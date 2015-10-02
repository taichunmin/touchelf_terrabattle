package.path=package.path .. ";/var/touchelf/scripts/?.lua";
require "terra_battle_library";

-- 适用屏幕参数
SCREEN_RESOLUTION="1536x2048";
SCREEN_COLOR_BITS=32;

-- 主入口函数
function main()
    math.randomseed( os.time() );
    rotateScreen(0);

    local path_11_10 = {
        "23863869423474",
        "6111368123",
        "6687672987",
        "123"
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
