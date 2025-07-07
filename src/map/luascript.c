/*
 * Copyright (C) 2002-2020  Auriga
 *
 * This file is part of Auriga.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA 02110-1301, USA.
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#ifndef WINDOWS
	#include <sys/time.h>
#endif
#include <time.h>
#include <math.h>

#include "timer.h"
#include "malloc.h"
#include "nullpo.h"
#include "utils.h"
#include "sqldbs.h"

#include "map.h"
#include "npc.h"
#include "mob.h"
#include "itemdb.h"
#include "achieve.h"
#include "clif.h"
#include "luascript.h"

#include "setbonus.h"	//れもん追加

#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"

static int garbage_collect_interval = 1000*30;		// ガベージコレクトの間隔

int lua_respawn_id;
int gc_threshold = 1000;		// ガベージコレクトの閾値
static int lua_lock_script = 0;	/* リロード用 */

extern const struct Lua_function {
	const char *name;
	lua_CFunction f;
} luafunc[];

/*==========================================
 * Stackのdump
 *------------------------------------------
 */
static void stackDump(lua_State *L)
{
	int i;
	int top = lua_gettop(L);
	printf("Stack dump...\n");  /* end the listing */
	for (i = 1; i <= top; i++) {  /* repeat for each level */
		int t = lua_type(L, i);
		switch (t) {
		
		case LUA_TSTRING:  /* strings */
			printf("`%s'", lua_tostring(L, i));
			break;
			
		case LUA_TBOOLEAN:  /* booleans */
			printf(lua_toboolean(L, i) ? "true" : "false");
            break;
    
		case LUA_TNUMBER:  /* numbers */
			printf("%g", lua_tonumber(L, i));
			break;
    
		default:  /* other values */
			printf("%s", lua_typename(L, t));
			break;
    
		}
		printf("  ");  /* put a separator */
	}
		printf("\n");  /* end the listing */
}

/*==========================================
 * Stackのtable閲覧
 *------------------------------------------
 */
void show_table(lua_State *L, int index)
{
	if(lua_gettop(L) == 0) {
		printf("No stack.\n");
		return;
	}

	printf("-----------------------------\n");

	lua_pushnil(L);
	while(lua_next(L, index)) {
		switch (lua_type(L, -2)) {  // key を表示
		case LUA_TNUMBER:
			printf("NUMBER: key=%td, ", lua_tointeger(L, -2));
			break;
		case LUA_TSTRING:
			printf("STRING: key=%s, ", lua_tostring(L, -2));
			break;
		case LUA_TBOOLEAN:
			printf("BOOLEAN: key=%d, ", lua_toboolean(L, -2));
			break;
		case LUA_TTABLE:
			printf("TABLE:\n");
			break;
		case LUA_TFUNCTION:
			printf("FUNCTION:\n");
			break;
		}
		switch(lua_type(L, -1)) {  // value を表示
		case LUA_TNUMBER:
			printf("value=%td\n", lua_tointeger(L, -1));
			break;
		case LUA_TSTRING:
			printf("value=%s\n", lua_tostring(L, -1));
			break;
		case LUA_TBOOLEAN:
			printf("value=%d\n", lua_toboolean(L, -1));
			break;
		default:
			printf("value=%s\n", lua_typename(L, lua_type(L, -1)));
			break;
		}
		lua_pop(L, 1);      // 値を取り除く
	}

	printf("-----------------------------\n");
}

// 特定 key へのアクセス
void show_table_item(lua_State *L, const char *key, int index)
{
	lua_pushstring(L, key);
	lua_rawget(L, index);
	if(lua_isstring(L, -1)) {
		const char* val = lua_tostring(L, -1);
		printf("key=%s, value=%s\n", key, val);
	}
}

/*==========================================
 * NLからsdへ変換
 *------------------------------------------
 */
static struct map_session_data *luascript_nl2sd(lua_State *NL)
{
	int char_id;
	struct map_session_data *sd=NULL;

	lua_pushliteral(NL, "char_id");
	lua_rawget(NL, LUA_GLOBALSINDEX);
	char_id = (int)lua_tointeger(NL, -1);
	lua_pop(NL, 1);

	sd = map_id2sd(char_id);

	if(!sd){
		printf("luascript_nl2sd: fatal error ! player not attached!\n");
	}
	return sd;
}

/*==========================================
 * NLからoidへ変換
 *------------------------------------------
 */
static int luascript_nl2oid(lua_State *NL)
{
	int oid;

	lua_pushliteral(NL, "oid");
	lua_rawget(NL, LUA_GLOBALSINDEX);
	oid = (int)lua_tointeger(NL, -1);
	lua_pop(NL, 1);

	return oid;
}

/*==========================================
 * functionの実行
 *------------------------------------------
 */
int luascript_run_function(const char *name,int char_id,const char *format,...)
{
	va_list ap;
	lua_State *NL;
	int n=0;

	if(lua_lock_script) {	// 再読み込み中なので実行しない
		return 0;
	}

	if(char_id == 0) {	// 共有ステートメントで実行する
		NL = L;
	}
	else {	// それ以外ならコルーチンで実行する
		struct map_session_data *sd;
		if((sd = map_id2sd(char_id)) == NULL)
			return 0;
		luaL_checkstack(L,1,"Too many thread");
		NL = lua_newthread(L);
		lua_pushliteral(NL,"char_id");
		lua_pushnumber(NL,char_id);
		lua_rawset(NL,LUA_GLOBALSINDEX);
	}

	lua_getglobal(NL,name);		// functionをスタックに積む

	va_start(ap,format);
	while(*format) {	// 'format'に沿って変数をスタックに積む
		switch (*format++) {
		case 'i':
			lua_pushnumber(NL,va_arg(ap,int));
			break;
		case 's':
			lua_pushstring(NL,va_arg(ap,char*));
			break;
		}
		n++;
		luaL_checkstack(NL,1,"Too many arg");
	}
	va_end(ap);

	// functionの実行
	if(lua_resume(NL,n) > 1 && lua_tostring(NL,-1) != NULL) {
		printf("luascript_run_function: can't run function %s : %s\n",name,lua_tostring(NL,-1));
		return 0;
	}

	return 0;
}

/*==========================================
 * chank実行
 *------------------------------------------
 */
void luascript_addscript(const char *chunk)
{
	lua_State *NL;

	NL = lua_newthread(L);

	lua_pushliteral(NL,"char_id");
	lua_pushnumber(NL,0);
	lua_rawset(NL,LUA_GLOBALSINDEX);

	printf("read %s...",chunk);

	if(luaL_loadfile(NL,chunk) != 0) {
		printf("luascript_addscript: loadfile [%s] failed !\n",chunk);
		return;
	}
	if(lua_pcall(NL,0,1,0) != 0) {
		printf("luascript_addscript: cannot run [%s] : %s\n",chunk,lua_tostring(NL,-1));
		return;
	}

	printf("\n");

	if(lua_isboolean(NL, -1)) {
		int ret = lua_toboolean(NL, -1);
		if(!ret) {
			printf("luascript_addscript: catch error response in [%s]\n",chunk);
		}
	}
	lua_pop(NL, 1);

	return;
}

/*==========================================
 * CのファンクションをLuaへ登録
 *------------------------------------------
 */
static void luascript_register_function(void)
{
	int i;

	for(i=0; luafunc[i].f; i++) {
		lua_pushstring(L, luafunc[i].name);
		lua_pushcfunction(L, luafunc[i].f);
		lua_settable(L, LUA_GLOBALSINDEX);
	}
	printf("Done registering '%d' lua script commands.\n",i);

	return;
}

/*==========================================
 * ガベージコレクタTimer
 *------------------------------------------
 */
static int luascript_garbagecollect(int tid,unsigned int tick,int id,void *data)
{
	int dummy = 0;	// 実際には使わないダミー
	int v = lua_gc(L, LUA_GCCOUNT, dummy);	// Luaの使用メモリ取得（キロバイト単位）

	// メモリ使用量が多ければガベージコレクトする
	if(v > gc_threshold) {
		lua_gc(L, LUA_GCSTEP, 2000);

		printf("lua_garbagecollect: %d Memory Usage(KB), Execute: %d\n", v, gc_threshold);

		gc_threshold = v + 256;
	}
	else {	// 閾値を下げて様子を見る
		if(gc_threshold > 256)
			gc_threshold = gc_threshold - 1;
	}

	return 0;
}

/*==========================================
 * 設定ファイルを読み込む
 *------------------------------------------
 */
int luascript_config_read(const char *cfgName)
{
	char line[1024], w1[1024], w2[1024];
	FILE *fp;

	fp = fopen(cfgName,"r");
	if(fp == NULL) {
		printf("file not found: %s\n", cfgName);
		return 1;
	}

	while(fgets(line, sizeof(line) - 1, fp)) {
		if(line[0] == '\0' || line[0] == '\r' || line[0] == '\n')
			continue;
		if(line[0] == '/' && line[1] == '/')
			continue;

		if(sscanf(line, "%1023[^:]: %1023[^\r\n]", w1, w2) != 2)
			continue;

		if (strcmpi(w1, "lua") == 0) {
			luascript_addscript(w2);
//		} else if (strcmpi(w1, "dellua") == 0) {
//			luascript_delscript(w2);
		} else if (strcmpi(w1, "garbage_collect_interval") == 0) {
			garbage_collect_interval = atoi(w2);
			if (garbage_collect_interval < 0) {
				printf("luascript_config_read: Invalid garbage_collect_interval value: %d. Set to 0.\n", garbage_collect_interval);
				garbage_collect_interval = 0;
			}
		} else if (strcmpi(w1, "import") == 0) {
			luascript_config_read(w2);
		}
	}
	fclose(fp);

	return 0;
}

/*==========================================
 * Luaのリロード
 *------------------------------------------
 */
void luascript_reload(void)
{
	// 再読み込み中にステートメントを呼ばれると困るのでロックする
	lua_lock_script = 1;

	// 一度ステートメントを削除する
	lua_close(L);
	L = NULL;

	// 古いステートメントを呼ばないようにインクリメントさせる
	lua_respawn_id++;

	// 新たに開きなおす
	L = lua_open();
	luaL_openlibs(L);

	luascript_register_function();
	lua_pushliteral(L,"char_id");
	lua_pushnumber(L,0);
	lua_rawset(L,LUA_GLOBALSINDEX);
	luascript_config_read(luascript_conf_filename);

	// ロック解除
	lua_lock_script = 0;
}

/*==========================================
 * 初期化処理
 *------------------------------------------
 */
int do_init_luascript(void)
{
	lua_respawn_id = 0;
	L = lua_open();
	luaL_openlibs(L);

	luascript_register_function();
	lua_pushliteral(L,"char_id");
	lua_pushnumber(L,0);
	lua_rawset(L,LUA_GLOBALSINDEX);

	if(garbage_collect_interval > 0) {
		add_timer_func_list(luascript_garbagecollect);
		add_timer_interval(gettick() + garbage_collect_interval,luascript_garbagecollect,0,NULL,garbage_collect_interval);
	}

	return 0;
}

/*==========================================
 * 終了
 *------------------------------------------
 */
int do_final_luascript(void)
{
	if(L)
		lua_close(L);

	return 0;
}



//
// 埋め込み関数
//

/*==========================================
 * PACKETVER取得
 *------------------------------------------
 */
static int luafunc_getpacketver(lua_State *NL)
{
	lua_pushinteger(NL, PACKETVER);
	return 1;
}

/*==========================================
 * NEW_006b取得
 *------------------------------------------
 */
static int luafunc_getpacketpre(lua_State *NL)
{
#if defined(NEW_006b)
	lua_pushinteger(NL, 0);
#else
	lua_pushinteger(NL, 1);
#endif
	return 1;
}

/*==========================================
 * packet_db.lua
 *------------------------------------------
 */
static int luafunc_addpacket(lua_State *NL)
{
	int cmd;
	short len;
	const char *name = NULL;
	char line[1024];
	short pos[8];

	memset(pos, 0, sizeof(pos));

	cmd = luaL_checkint(NL,1);
	len = luaL_checkint(NL,2);
	if(lua_isstring(NL,3))
		name = luaL_checkstring(NL,3);
	if(lua_isnumber(NL,4)) {
		pos[0] = luaL_checkint(NL,4);
	}
	else if(lua_istable(NL,4)) {
		int i;
		int s_len = (int)lua_objlen(NL,4);
		for(i=0; i<8 && i<s_len; i++) {
			lua_rawgeti(NL,4,i + 1);
			pos[i] = luaL_checkint(NL,-1);
			lua_pop(NL, 1);      // 値を取り除く
		}
	}

	if(name == NULL)
		sprintf(line, "0x%04x,%d", cmd, len);
	else
		sprintf(line, "0x%04x,%d,%s,%d:%d:%d:%d:%d:%d:%d:%d", cmd, len, name, pos[0], pos[1], pos[2], pos[3], pos[4], pos[5], pos[6], pos[7]);

	packetdb_insert_packet(line);

	return 0;
}

/*==========================================
 * packet_db.lua Encryption key
 *------------------------------------------
 */
static int luafunc_packet_key(lua_State *NL)
{
	unsigned int key1, key2, key3;

	key1 = luaL_checkint(NL,1);
	key2 = luaL_checkint(NL,2);
	key3 = luaL_checkint(NL,3);

	packetdb_insert_packet_key(key1, key2, key3);

	return 0;
}

/*==========================================
 * item_randopt_db.lua
 *------------------------------------------
 */
static int luafunc_InsertRandopt(lua_State *NL)
{
	int nameid, mob_id, val;
	int i=0;
	struct randopt_item_data ro;
	bool result;

	memset(&ro, 0, sizeof(ro));

	nameid=luaL_checkint(NL,1);
	ro.nameid = nameid;

	mob_id=luaL_checkint(NL,2);
	if(mob_id < 0)
		return 0;
	ro.mobid = mob_id;

	lua_pushnil(NL);
	while(lua_next(NL, 3)) {
		if(lua_istable(NL,-1)) {
			lua_pushnil(NL);
			while(lua_next(NL, -2)) {
				switch(luaL_checkint(NL,-2)) {  // key を表示
				case 1:
					val = luaL_checkint(NL,-1) - 1;
					if(val < 0 || val >= 5)
						val = 0;
					ro.opt[i].slot = val;
					break;
				case 2:
					ro.opt[i].optid = luaL_checkint(NL,-1);
					break;
				case 3:
					if(lua_istable(NL,-1)) {
						lua_rawgeti(NL,-1,1);
						ro.opt[i].optval_min = luaL_checkint(NL,-1);
						lua_pop(NL, 1);      // 値を取り除く
						lua_rawgeti(NL,-1,2);
						ro.opt[i].optval_max = luaL_checkint(NL,-1);
						lua_pop(NL, 1);      // 値を取り除く
						if(lua_objlen(NL,-1) >= 3) {
							lua_rawgeti(NL,-1,3);
							ro.opt[i].optval_plus = luaL_checkint(NL,-1);
							lua_pop(NL, 1);      // 値を取り除く
						}
					}
					else {
						val = luaL_checkint(NL,-1);
						ro.opt[i].optval_min = val;
						ro.opt[i].optval_max = val;
					}
					break;
				case 4:
					ro.opt[i].rate = luaL_checkint(NL,-1);
					break;
				}
				lua_pop(NL, 1);      // 値を取り除く
			}
			lua_pop(NL, 1);      // 値を取り除く
			if(++i >= MAX_RANDOPT_TABLE)
				break;
		}
	}
	lua_pop(NL, 3);      // 値を取り除く

	result = itemdb_insert_randoptdb(ro);
	lua_pushboolean(NL, result);

	return 1;
}

/*==========================================
 * barter_db.lua
 *------------------------------------------
 */
static int luafunc_InsertBarter(lua_State* NL)
{
	int barter_id, nameid, value, value2, expnameid, refine, amount;
	int i = 0;
	struct barter_item_data bi;
	bool result;

	memset(&bi, 0, sizeof(bi));

	barter_id = luaL_checkint(NL, 1);
	bi.barter_id = barter_id;

	nameid = luaL_checkint(NL, 2);
	bi.nameid = nameid;

	// value と value2 の初期値を設定
	value = luaL_checkint(NL, 3);
	value2 = luaL_checkint(NL, 4);

	if (lua_istable(NL, 5)) {
		// expbarter テーブルが存在する場合、value と value2 を 0 に設定
		value = 0;
		value2 = 0;

		lua_pushnil(NL);
		while (lua_next(NL, 5)) {
			if (lua_istable(NL, -1)) {
				lua_pushnil(NL);
				while (lua_next(NL, -2)) {
					int key = luaL_checkint(NL, -2);
					switch (key) {
					case 1:
						expnameid = luaL_checkint(NL, -1);
						bi.expbarter[i].nameid = expnameid;
						break;
					case 2:
						refine = luaL_checkint(NL, -1);
						bi.expbarter[i].refine = refine;
						break;
					case 3:
						amount = luaL_checkint(NL, -1);
						bi.expbarter[i].amount = amount;
						break;
					default:
						luaL_error(NL, "Invalid key in expbarter table: %d", key);
						return 0;
					}
					lua_pop(NL, 1);
				}
				lua_pop(NL, 1);
				if (++i >= 6) {
					luaL_error(NL, "Too many expbarter items (max: %d).", MAX_EXPBARTER_ITEM);
					return 0;
				}
			}
			else {
				luaL_error(NL, "Expbarter table must contain tables.");
				return 0;
			}
		}
		lua_pop(NL, 1);
	}

	bi.value = value;
	bi.value2 = value2;

	result = itemdb_insert_barterdb(bi);
	if (!result) {
		luaL_error(NL, "Failed to insert barter item into database.");
		return 0;
	}

	lua_pushboolean(NL, result);
	return 1;
}


/*==========================================
 * れもん追加set_bonus.lua
 *------------------------------------------
 */
static int luafunc_InsertSetBonus(lua_State* NL)
{
	int id;
	struct set_bonus_item_data sb;
	bool result = false;

	// 第1引数: id
	id = luaL_checkint(NL, 1);
	sb.id = id;

	// 第2引数: ID配列
	luaL_checktype(NL, 2, LUA_TTABLE);
	int id_count = 0;
	lua_pushnil(NL); // スタックに nil をプッシュ (lua_next の初期値)
	while (lua_next(NL, 2) != 0) {
		if (lua_isnumber(NL, -2)) {
			if (id_count < MAX_SET_EQUIP) {
				if (lua_isnumber(NL, -1)) {
					sb.id_list[id_count++] = (int)lua_tonumber(NL, -1);
				}
			}
		}
		lua_pop(NL, 1);
	}
	for (; id_count < MAX_SET_EQUIP; id_count++)
		sb.id_list[id_count] = -1;

	// 第3引数: bonusテーブル
	luaL_checktype(NL, 3, LUA_TTABLE);
	int bonus_count = 0;
	lua_pushnil(NL);
	while (lua_next(NL, 3) != 0) {
		if (lua_isnumber(NL, -2)) {
			if (bonus_count < MAX_SET_BONUS_COUNT && lua_istable(NL, -1)) {
				lua_getfield(NL, -1, "count");
				lua_getfield(NL, -2, "script");

				if (lua_isnumber(NL, -2) && lua_isstring(NL, -1)) {
					sb.bonuses[bonus_count].count = (int)lua_tonumber(NL, -2);
					const char* script_str = luaL_checkstring(NL, -1);

					if (script_str) {
						// もう { } で囲まない！そのまま使う
						unsigned char script_buf[4096];
						strncpy((char*)script_buf, script_str, sizeof(script_buf) - 1);
						script_buf[sizeof(script_buf) - 1] = '\0';

						// Syntaxチェック（itemdbと同じ）
						char* endptr = parse_script_line_end(script_buf, "setbonus_db.lua", -1);
						if (endptr) {
							struct script_code* code = parse_script(script_buf, "setbonus_db.lua", -1);
							if (!script_is_error(code)) {
								sb.bonuses[bonus_count].script = code;
							}
							else {
								sb.bonuses[bonus_count].script = NULL;
							}
						}
						else {
							sb.bonuses[bonus_count].script = NULL;
						}
					}
				}
				lua_pop(NL, 2); // count, script
				bonus_count++;
			}
		}
		lua_pop(NL, 1);
	}

	result = itemdb_insert_setbonusdb(sb);

	lua_pushboolean(NL, result);
	return 1;
}
/*==========================================
 * achievement_db.lua
 *------------------------------------------
 */
static int luafunc_InsertAchieveInfo(lua_State *NL)
{
	int achieveid, score, title;
	enum achieve_types type;
	const char *name = NULL;
	const char *reward = NULL;
	bool result;

	achieveid = luaL_checkint(NL,1);
	name    = luaL_checkstring(NL,2);
	type    = luaL_checkint(NL,3);
	score   = luaL_checkint(NL,4);
	title   = luaL_checkint(NL,5);
	reward  = luaL_checkstring(NL,6);

	result = achieve_insert_info(achieveid, name, type, score, title, reward);
	lua_pushboolean(NL, result);

	return 1;
}

static int luafunc_InsertAchieveContent(lua_State *NL)
{
	int achieveid, nameid, count;
	bool result;

	achieveid = luaL_checkint(NL,1);
	nameid    = luaL_checkint(NL,2);
	count     = luaL_checkint(NL,3);

	result = achieve_insert_content(achieveid, nameid, count);
	lua_pushboolean(NL, result);

	return 1;
}

static int luafunc_InsertAchieveDBEnd(lua_State *NL)
{
	bool result;

	result = achieve_insert_db_end();
	lua_pushboolean(NL, result);

	return 1;
}

static int luafunc_InsertAchieveLevelDB(lua_State *NL)
{
	int lv, exp;
	bool result;

	lv  = luaL_checkint(NL,1);
	exp = luaL_checkint(NL,2);

	result = achieve_insert_leveldb(lv, exp);
	lua_pushboolean(NL, result);

	return 1;
}

const struct Lua_function luafunc[] = {
	{"getpacketver",luafunc_getpacketver},
	{"getpacketpre",luafunc_getpacketpre},
	{"addpacket",luafunc_addpacket},
	{"packet_key",luafunc_packet_key},
	{"InsertRandopt",luafunc_InsertRandopt},
	{"InsertBarter",luafunc_InsertBarter},
	{"InsertSetBonus",luafunc_InsertSetBonus},
	{"InsertAchieveInfo",luafunc_InsertAchieveInfo},
	{"InsertAchieveContent",luafunc_InsertAchieveContent},
	{"InsertAchieveDBEnd",luafunc_InsertAchieveDBEnd},
	{"InsertAchieveLevelDB",luafunc_InsertAchieveLevelDB},

	{NULL,NULL}
};
