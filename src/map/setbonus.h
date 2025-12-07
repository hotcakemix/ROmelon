#include <stdbool.h>
#include "map.h"
#ifndef _SETBONUS_H_
#define _SETBONUS_H_

#define SETBONUS_MAX 128		// セットボーナスの最大数（適宜調整してください）
#define MAX_SET_EQUIP 7			// 1つのセットに属する装備の最大数（例: 7個の装備）設定では6個の装備まで、luadb読み込みのため+1。
#define MAX_SET_BONUS_COUNT 3	// 1つのセットに対するボーナスの最大数
#define MAX_ITEMID 2000000		// アイテムIDの最大値（適宜調整してください）
#define MAX_SETS_PER_ITEM 2		// 1つのアイテムが属するセットの最大数

struct set_bonus_entry {
	int count;
	struct script_code* script;
};

struct set_bonus_item_data {
	int id;
	int id_list[MAX_SET_EQUIP];
	struct set_bonus_entry bonuses[MAX_SET_BONUS_COUNT];
};

extern struct set_bonus_item_data setbonus_db[SETBONUS_MAX];
extern int setbonus_count;

extern int itemid_to_setids[MAX_ITEMID][MAX_SETS_PER_ITEM];

void itemdb_init_setbonusdb(void);
bool itemdb_insert_setbonusdb(struct set_bonus_item_data sb);
struct set_bonus_item_data* itemdb_get_setbonusdb(int* count);

void pc_calc_setbonuses(struct map_session_data* sd);

#endif