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
            x, y = findColorInRegion(0xF4FFC4, 676, 235, 676, 235);
            mSleep(500);
        until x ~= -1 and y ~= -1;
        mSleep(1000);
        move_path(iv);
    end

    -- stage end
    repeat
        mSleep(2000);
        x, y = findImageInRegionFuzzy("/var/touchelf/tb/stage_selection_stamina.bmp", 90, 583, 173, 690, 226, 0xFFFFFF);
        if x == -1 and y == -1 then
			touchDown(9, 100, 100);
			mSleep(60);
			touchUp(9);
        end
    until x ~= -1 and y ~= -1;

    mSleep(1000);
end