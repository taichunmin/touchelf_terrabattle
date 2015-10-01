-- 点击函数封装

-- 主入口函数
-- function main()
--  x, y = findImageInRegionFuzzy("/var/touchelf/tb/stage_selection_stamina.bmp", 90, 583, 173, 690, 226, 0xFFFFFF);
--  if x == -1 and y == -1 then
--    notifyMessage('not found', 3000);
--  else
--    notifyMessage('found! ('..x..', '..y..')', 3000);
--  end
-- end

function main()
  x, y = findColorInRegion(0xF4FFC4, 676, 235, 676, 235);
  if x == -1 and y == -1 then
    notifyMessage('not found', 3000);
  else
    notifyMessage('found! ('..x..', '..y..')', 3000);
  end
end
