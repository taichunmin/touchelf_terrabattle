package.path=package.path .. ";/var/touchelf/scripts/?.lua";
require "terra_battle_library";

-- 适用屏幕参数
SCREEN_RESOLUTION="1536x2048";
SCREEN_COLOR_BITS=32;

-- 主入口函数
function main()
    math.randomseed( os.time() );
    rotateScreen(0);

    local path_13_8 = {
        "28969688729724444387297",
        "5898888762222",
        "168988494222222399998767",
    };

    -- during stage
    for _, iv in pairs(path_1_5) do
        if not wait_your_turn() then
            break;
        end
        move_path(iv);
    end

    mSleep(1000);
end
