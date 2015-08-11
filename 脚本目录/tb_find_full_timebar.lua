-- 点击函数封装

-- 主入口函数
function main()
    repeat
        mSleep(2000);
        x, y = findImageInRegionFuzzy("/var/touchelf/tb/stage_selection_stamina.bmp", 80, 551, 141, 730, 253, 0xFFFFFF);
        if x == -1 and y == -1 then
			touchDown(9, 100, 100);
			mSleep(60);
			touchUp(9);
        end
    until x ~= -1 and y ~= -1;
end