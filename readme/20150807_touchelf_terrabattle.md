# 關卡 1-5 自動戰鬥研究

會研究 1-5 是因為可以刷角色的 B 值。

## 研究座標

![](images/IMG_0261.PNG)

* 裝置大小：`1536x2048` (iPad mini 2)
* 第一格左上角起點：`(128,263)`，一格大小：`212x212`
* 第一格中心點：`(234,369)`，坐標軸公式：`(23 + 211 i, 158 + 211 j)`

```lua
function pos(i, j)
    if i < 1 or 6 < i or j < 1 or 8 < j then
        logDebug(string.format("pos (%d, %d) error.", i, j));
        return 0, 0;
    else
        return 23 + 211 * i + math.random(-3, 3),
               158 + 211 * j + math.random(-3, 3);
    end
end
```

## 指定起點及操作的指令

* 格式定義
    - 前兩個字代表 `i` 和 `j`，舉例 `11` 就代表從 `i=1` 和 `j=1` 開始。
    - 接下來根據移動方向，分別以數字表示
        + `1` 左下
        + `4` 左
        + `7` 左上
        + `8`   上
        + `9` 右上
        + `6` 右
        + `3` 右下
        + `2`   下

```
// https://www.youtube.com/watch?v=pxrrQKN1miM
289662688888744934223
149666948
62476122268311624867178
55184189988312
26692981234268499887
52122322786247
```

## 移動一次路徑指令的測試程式

```lua
function move_path(path)
    -- path error
    if string.len(path) < 2 then
        logDebug("path '"..path.."' error!");
        return;
    end
    local i = tonumber(path:sub(1,1), 10);
    local j = tonumber(path:sub(2,2), 10);
    print(i, j);
    local dir = {
        [1] = {-1, 1},
        [4] = {-1, 0},
        [7] = {-1,-1},
        [8] = { 0,-1},
        [9] = { 1,-1},
        [6] = { 1, 0},
        [3] = { 1, 1},
        [2] = { 0, 1}
    };
    path = path:sub(3);
    -- print(path)
    path:gsub(".", function(c)
        c = tonumber(c, 10);
        i = i + dir[c][1];
        j = j + dir[c][2];
        print(i, j);
    end)
end
```

* 測試輸出 `149666948`

```
1   4
2   3
3   3
4   3
5   3
6   2
5   2
5   1
```

## 移動路徑 function

```lua
function move_path(path)
    -- path error
    if string.len(path) < 2 then
        return;
    end

    local finger_id = math.random(0, 128);
    local i = tonumber(path:sub(1,1), 10);
    local j = tonumber(path:sub(2,2), 10);
    local dir = {
        [1] = {-1, 1},
        [4] = {-1, 0},
        [7] = {-1,-1},
        [8] = { 0,-1},
        [9] = { 1,-1},
        [6] = { 1, 0},
        [3] = { 1, 1},
        [2] = { 0, 1}
    };
    local x, y = pos(i, j);
    path = path:sub(3);

    touchDown(finger_id, x, y);
    mSleep(math.random(75, 85));

    path:gsub(".", function(c)
        c = tonumber(c, 10);
        i, j = (i + dir[c][1]), (j + dir[c][2]);
        x, y = pos(i, j);
        touchMove(finger_id, x, y);
        mSleep(math.random(20, 30));
        print(i, j);
    end)

    touchUp(finger_id);
end
```

## 找滿的體力條判斷是否可轉

* 檢查時間條是否是滿的程式

```lua
function main()
    x, y = findImageFuzzy("/var/touchelf/tb/full_timebar.bmp", 90, 0xFF0000);
    if x ~= -1 and y ~= -1 then
        notifyMessage('found!');
    else
        notifyMessage('not found!');
    end
end
```

* 去背線上網站教學 <http://willtl2556460.pixnet.net/blog/post/21160750-%E4%B8%8D%E5%BF%85%E4%BB%B0%E8%B3%B4%E4%BF%AE%E5%9C%96%E8%BB%9F%E9%AB%94%EF%BC%8Cpixlr-%E7%B7%9A%E4%B8%8A%E8%BC%95%E9%AC%86%E5%B0%87%E5%9C%96%E7%89%87%E3%80%81%E7%85%A7>
* 去背線上網站 <https://pixlr.com/editor/>

* 去背圖片
![](images/tb_timebar_full_1_5.bmp)

## 最後完成的腳本

```lua
-- 适用屏幕参数
SCREEN_RESOLUTION="1536x2048";
SCREEN_COLOR_BITS=32;

function pos(i, j)
    if type(i) ~= "number" or type(j) ~= "number" or i < 1 or 6 < i or j < 1 or 8 < j then
        logDebug(string.format("pos (%d, %d) error.", i, j));
        return 0, 0;
    else
        return 23 + 211 * i + math.random(-3, 3),
               158 + 211 * j + math.random(-3, 3);
    end
end

function move_path(path)
    -- path error
    if type(path) ~= "string" then
        logDebug("path must be string, " .. type(path) .. " is given.");
        return;
    end
    if string.len(path) < 2 then
        logDebug(path .. " must be longer than 2.");
        return;
    end

    local finger_id = math.random(1, 25);
    local i = tonumber(path:sub(1,1), 10);
    local j = tonumber(path:sub(2,2), 10);
    local dir = {
        [1] = {-1, 1},
        [4] = {-1, 0},
        [7] = {-1,-1},
        [8] = { 0,-1},
        [9] = { 1,-1},
        [6] = { 1, 0},
        [3] = { 1, 1},
        [2] = { 0, 1}
    };
    local x, y = pos(i, j);
    path = path:sub(3);

    touchDown(finger_id, x, y);
    mSleep(math.random(150, 200));

    path:gsub(".", function(c)
        c = tonumber(c, 10);
        i, j = (i + dir[c][1]), (j + dir[c][2]);
        x, y = pos(i, j);
        touchMove(finger_id, x, y);
        mSleep(math.random(75, 100));
        print(i, j);
    end)

    touchUp(finger_id);
    mSleep(5000);
end

-- 主入口函数
function main()
    math.randomseed( os.time() );
    rotateScreen(0);
    mSleep(960);
    touchDown(10, 776, 1330);
    mSleep(48);
    touchUp(10);

    mSleep(2252);
    touchDown(7, 474, 1820);
    mSleep(66);
    touchUp(7);

    local path_1_5 = {
        "289662688888744934223",
        "149666948",
        "62476122268311624867178",
        "55184189988312",
        "26692981234268499887",
        "52122322786247",
    };

    for ik, iv in pairs(path_1_5) do
        -- logDebug(ik, iv);
        repeat
            x, y = findImageInRegionFuzzy("/var/touchelf/tb/tb_timebar_full_1_5.bmp", 80, 600, 190, 830, 280, 0xFFFFFF);
            mSleep(2000);
        until x ~= -1 and y ~= -1;
        mSleep(1000);
        move_path(iv);
    end

    mSleep(25000);
    touchDown(5, 820, 1254);
    mSleep(31);
    touchUp(5);

    mSleep(902);
    touchDown(2, 1044, 1492);
    mSleep(65);
    touchUp(2);

    mSleep(803);
    touchDown(2, 1050, 1484);
    mSleep(65);
    touchUp(2);

    mSleep(2384);
    touchDown(2, 1006, 1488);
    mSleep(48);
    touchUp(2);

    mSleep(2219);
    touchDown(9, 250, 82);
    mSleep(15);
    touchMove(9, 248, 84);
    mSleep(68);
    touchUp(9);

    mSleep(1000);
end
```

## 偵測是否已回到體力選擇大廳

```lua
repeat
    mSleep(2000);
    x, y = findImageInRegionFuzzy("/var/touchelf/tb/stage_selection_stamina.bmp", 80, 551, 141, 730, 253, 0xFFFFFF);
    if x == -1 and y == -1 then
        touchDown(9, 100, 100);
        mSleep(60);
        touchUp(9);
    end
until x ~= -1 and y ~= -1;
```

## 腳本 v1.0

```lua
-- 适用屏幕参数
SCREEN_RESOLUTION="1536x2048";
SCREEN_COLOR_BITS=32;

function pos(i, j)
    if type(i) ~= "number" or type(j) ~= "number" or i < 1 or 6 < i or j < 1 or 8 < j then
        logDebug(string.format("pos (%d, %d) error.", i, j));
        return 0, 0;
    else
        return 23 + 211 * i + math.random(-3, 3),
               158 + 211 * j + math.random(-3, 3);
    end
end

function move_path(path)
    -- path error
    if type(path) ~= "string" then
        logDebug("path must be string, " .. type(path) .. " is given.");
        return;
    end
    if string.len(path) < 2 then
        logDebug(path .. " must be longer than 2.");
        return;
    end

    local finger_id = math.random(1, 25);
    local i = tonumber(path:sub(1,1), 10);
    local j = tonumber(path:sub(2,2), 10);
    local dir = {
        [1] = {-1, 1},
        [4] = {-1, 0},
        [7] = {-1,-1},
        [8] = { 0,-1},
        [9] = { 1,-1},
        [6] = { 1, 0},
        [3] = { 1, 1},
        [2] = { 0, 1}
    };
    local x, y = pos(i, j);
    path = path:sub(3);

    touchDown(finger_id, x, y);
    mSleep(math.random(150, 200));

    path:gsub(".", function(c)
        c = tonumber(c, 10);
        i, j = (i + dir[c][1]), (j + dir[c][2]);
        x, y = pos(i, j);
        touchMove(finger_id, x, y);
        mSleep(math.random(75, 100));
        print(i, j);
    end)

    touchUp(finger_id);
    mSleep(5000);
end

-- 主入口函数
function main()
    math.randomseed( os.time() );
    rotateScreen(0);
    mSleep(960);
    touchDown(10, 776, 1330);
    mSleep(48);
    touchUp(10);

    mSleep(2252);
    touchDown(7, 474, 1820);
    mSleep(66);
    touchUp(7);

    local path_1_5 = {
        "289662688888744934223",
        "149666948",
        "62476122268311624867178",
        "55184189988312",
        "26692981234268499887",
        "52122322786247",
    };

    -- during stage
    for ik, iv in pairs(path_1_5) do
        -- logDebug(ik, iv);
        repeat
            x, y = findImageInRegionFuzzy("/var/touchelf/tb/tb_timebar_full_1_5.bmp", 80, 600, 190, 830, 280, 0xFFFFFF);
            mSleep(2000);
        until x ~= -1 and y ~= -1;
        mSleep(1000);
        move_path(iv);
    end

    -- stage end
    repeat
        mSleep(2000);
        x, y = findImageInRegionFuzzy("/var/touchelf/tb/stage_selection_stamina.bmp", 80, 551, 141, 730, 253, 0xFFFFFF);
        if x == -1 and y == -1 then
            touchDown(9, 100, 100);
            mSleep(60);
            touchUp(9);
        end
    until x ~= -1 and y ~= -1;

    mSleep(1000);
end
```
