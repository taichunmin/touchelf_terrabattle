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

function wait_your_turn()
    local c;
    repeat
        mSleep(750);
        c = getColor(676, 235);
    until c == 0xF4FFC4;
end

function click_wait_to_menu()
    local c;
    repeat
        mSleep(750);
        c = getColor(588, 200);
        if c ~= 0xFFB400 then
            touchDown(9, 100, 100);
            mSleep(60);
            touchUp(9);
        end
    until c == 0xFFB400;
end
