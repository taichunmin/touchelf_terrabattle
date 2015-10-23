package.path=package.path .. ";/var/touchelf/scripts/?.lua";
require "terra_battle_library";

-- 适用屏幕参数
SCREEN_RESOLUTION="1536x2048";
SCREEN_COLOR_BITS=32;

-- 主入口函数
function main()
    math.randomseed( os.time() );
    rotateScreen(0);
    mSleep(960);
    -- 240 * i + 160
    touchDown(10, 750, 1600);
    mSleep(48);
    touchUp(10);

    mSleep(2252);
    -- start button
    touchDown(7, 474, 1820);
    mSleep(66);
    touchUp(7);

    local path_15_6 = {
        "2142229221",
        "344423",
        "168889",
        "148886363",
        "43397",
    };

    click_wait_to_stage();

    -- during stage
    for _, iv in pairs(path_15_6) do
        if not wait_your_turn() then
            break;
        end
        move_path(iv);
    end

    -- stage end
    click_wait_to_menu();
    mSleep(1000);
end
