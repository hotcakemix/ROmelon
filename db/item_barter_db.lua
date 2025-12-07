-----------------------------------------------------------
--barterのみの場合valueは必要なアイテムID、value2は必要個数
--expbarterの場合value,value2は読み込まない
--expbarter必要素材最大５個まで
--expbarter{必要アイテムID,必要精錬値,個数}

BarterDB = {
    {
        barter_id = 1,
        nameid = 1201,
        value = 0,
        value2 = 0,
        expbarter = {
            { 1000, 0, 5 },
            { 1001, 0, 10 },
        }
    },
    {
        barter_id = 2,
        nameid = 1606,
        value = 910,
        value2 = 1
    },
    {
        barter_id = 7,
        nameid = 1602,
        value = 0,
        value2 = 0,
        expbarter = {
            { 1000, 0, 1 },
        }
    },
     {
        barter_id = 5,
        nameid = 965,
        value = 0,
        value2 = 0,
        expbarter = {
            { 1000, 0, 5 },
            { 1001, 0, 10 },
        }
    },
    {
        barter_id = 10,
        nameid = 965,
        value = 0,
        value2 = 0,
        expbarter = {
            { 1000, 0, 5 },
            { 1001, 0, 10 },
        }
    },
    {
        barter_id = 12,
        nameid = 1101,
        value = 0,
        value2 = 0,
        expbarter = {
            { 1601, 17, 1 },
            { 1201, 15, 1 },
        }
    },
----------------------職パッケ
    {--高級ドラム
        barter_id = 13,
        nameid = 930000,
        value = 920000,
        value2 = 10,
    },
    {--ソウルリーパー
        barter_id = 14,
        nameid = 930001,
        value = 920000,
        value2 = 10,
    },
    {--星帝
        barter_id = 15,
        nameid = 930002,
        value = 920000,
        value2 = 10,
    },
    {--ルーンナイト
        barter_id = 16,
        nameid = 930003,
        value = 920000,
        value2 = 10,
    },
    {--ウォーロック
        barter_id = 17,
        nameid = 930004,
        value = 920000,
        value2 = 10,
    },
    {--レンジャー
        barter_id = 18,
        nameid = 930005,
        value = 920000,
        value2 = 10,
    },
    {--アークビショップ
        barter_id = 19,
        nameid = 930006,
        value = 920000,
        value2 = 10,
    },
    {--ギロチンクロス
        barter_id = 20,
        nameid = 930007,
        value = 920000,
        value2 = 10,
    },
    {--メカニック
        barter_id = 21,
        nameid = 930008,
        value = 920000,
        value2 = 10,
    },
    {--ロイヤルガード
        barter_id = 22,
        nameid = 930009,
        value = 920000,
        value2 = 10,
    },
    {--ソーサラー
        barter_id = 23,
        nameid = 930010,
        value = 920000,
        value2 = 10,
    },
    {--ミンストレル
        barter_id = 24,
        nameid = 930011,
        value = 920000,
        value2 = 10,
    },
    {--ワンダラー
        barter_id = 25,
        nameid = 930012,
        value = 920000,
        value2 = 10,
    },
    {--修羅
        barter_id = 26,
        nameid = 930013,
        value = 920000,
        value2 = 10,
    },
    {--シャドウチェイサー
        barter_id = 27,
        nameid = 930014,
        value = 920000,
        value2 = 10,
    },
    {--ジェネティック
        barter_id = 28,
        nameid = 930015,
        value = 920000,
        value2 = 10,
    },
};

function BarterDBInit()
    for _, entry in ipairs(BarterDB) do
        local value = entry.value
        local value2 = entry.value2
        local expbarter = entry.expbarter

        if expbarter then
            value = 0
            value2 = 0
        end

        local result = InsertBarter(
            entry.barter_id,
            entry.nameid,
            value,
            value2,
            expbarter
        )

        if result ~= true then
            print("Error: InsertBarter failed for barter_id =", entry.barter_id)
            return false -- エラーが発生した場合に false を返す
        end
    end
    return true
end

return BarterDBInit()