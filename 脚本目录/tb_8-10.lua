package.path=package.path .. ";/var/touchelf/scripts/?.lua";
require "terra_battle_library";

-- 适用屏幕参数
SCREEN_RESOLUTION="1536x2048";
SCREEN_COLOR_BITS=32;

-- 主入口函数
function main()
    math.randomseed( os.time() );
    rotateScreen(0);

    local path_8_10 = {
        "1563499692447",
        "6344",
        "433",
        "133234489"
    };

    -- during stage
    for ik, iv in pairs(path_8_10) do
        -- logDebug(ik, iv);
        repeat
            x, y = findColorInRegion(0xF4FFC4, 676, 235, 676, 235);
            mSleep(500);
        until x ~= -1 and y ~= -1;

        mSleep(1000);
        move_path(iv);
    end
    logDebug('tb_timebar_full_8_10: ('..x..', '..y..')');
    mSleep(1000);
end
