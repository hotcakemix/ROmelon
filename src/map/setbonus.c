/*

れもん追加セットボーナス機能
読み込みはluascript.cで行う
登録と適用関数はここ
実際にボーナス適用はstatus.cで行う(ここの関数に渡すだけ)
ヘッダーは itemdb.c status.c luascript.c で使ってる
pc.cに装備一致数を取得する関数も追加、そちらを使う(今使ってません)
*/

#include <string.h>
#include <stdio.h>
#include <time.h>
#include "setbonus.h"
#include "script.h"
#include "mmo.h"
#include "pc.h"
#include "status.h"
#include "itemdb.h"

struct set_bonus_item_data setbonus_db[SETBONUS_MAX];
int setbonus_count = 0;
int itemid_to_setids[MAX_ITEMID][MAX_SETS_PER_ITEM] = { {0} };

/*==========================================
 * セットボーナスの初期化
 *------------------------------------------*/
void itemdb_init_setbonusdb(void)
{
    setbonus_count = 0;
    memset(setbonus_db, 0, sizeof(setbonus_db));
    memset(itemid_to_setids, 0, sizeof(itemid_to_setids));
}

/*==========================================
 * セットボーナスを登録し、逆引きにも登録
 *------------------------------------------*/
bool itemdb_insert_setbonusdb(struct set_bonus_item_data sb)
{
    if (setbonus_count >= SETBONUS_MAX)
        return false;

    setbonus_db[setbonus_count] = sb;
    int internal_set_index = setbonus_count;

    for (int i = 0; sb.id_list[i] != -1; i++) {
        int itemid = sb.id_list[i];
        if (itemid < 0 || itemid >= MAX_ITEMID)
            continue;

        for (int j = 0; j < MAX_SETS_PER_ITEM; j++) {
            if (itemid_to_setids[itemid][j] == 0) {
                itemid_to_setids[itemid][j] = internal_set_index;
                break;
            }
        }
    }

    setbonus_count++;

    printf("[InsertSetBonus] Registered setid=%d (logical) at index %d (internal)\n", sb.id, internal_set_index);


    return true;
}

/*==========================================
 * セットボーナス全体を取得（必要なら個数も返す）
 *------------------------------------------*/
struct set_bonus_item_data* itemdb_get_setbonusdb(int* count)
{
    if (count)
        *count = setbonus_count;
    return setbonus_db;
}

/*==========================================
 * セットボーナスの適用
 *------------------------------------------*/
void pc_calc_setbonuses(struct map_session_data* sd)
{
    if (!sd) return;
    int set_matched_count[SETBONUS_MAX] = { 0 };


    clock_t total_start = clock();


    // フェーズ1: 装備走査
    for (int i = 0; i < EQUIP_INDEX_MAX; i++) {
        int idx = sd->equip_index[i];
        if (idx < 0 || !sd->inventory_data[idx]) continue;
        int itemid = sd->inventory_data[idx]->nameid;
        if (itemid < 0 || itemid >= MAX_ITEMID) continue;
        for (int j = 0; j < MAX_SETS_PER_ITEM; j++) {
            int internal_set_index = itemid_to_setids[itemid][j];
            if (internal_set_index == 0) continue;
            if (internal_set_index >= 0 && internal_set_index < SETBONUS_MAX) {
                set_matched_count[internal_set_index]++;
            }
            else {

                printf("  ERROR: Invalid internal_set_index %d for item %d (out of bounds for set_matched_count)\n", internal_set_index, itemid);

            }
        }
    }

    // フェーズ2: ボーナス適用
    int total_set_bonus_definitions_count;
    struct set_bonus_item_data* all_set_bonuses = itemdb_get_setbonusdb(&total_set_bonus_definitions_count);

    for (int s = 0; s < total_set_bonus_definitions_count; s++) {
        struct set_bonus_item_data* sb = &all_set_bonuses[s];
        for (int b = 0; b < MAX_SET_BONUS_COUNT; b++) {
            if (sb->bonuses[b].count <= 0 || !sb->bonuses[b].script) continue;
            if (set_matched_count[s] >= sb->bonuses[b].count) {

                clock_t start = clock();


                run_script(sb->bonuses[b].script, 0, sd->bl.id, 0);


                clock_t end = clock();
                double elapsed = (double)(end - start) / CLOCKS_PER_SEC * 1000.0;
                printf("[SET BONUS] Script execution time: %f ms (setid=%d, bonus=%d)\n", elapsed, sb->id, b);

            }
        }
    }


    clock_t total_end = clock();
    double total_elapsed = (double)(total_end - total_start) / CLOCKS_PER_SEC * 1000.0;
    printf("[SET BONUS] Total execution time: %f ms\n", total_elapsed);

}