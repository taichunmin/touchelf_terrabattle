--[[--
  Use this file to specify System preferences.
  Review [examples](+Z:\Sern\touchelf\ZeroBrane\cfg\user-sample.lua) or check [online documentation](http://studio.zerobrane.com/documentation.html) for details.
--]]--

-- 设置程序语言为中文
language = 'cn'

-- 加载自定义补全函数的定义文件api/lua/custom.lua
api = { "custom" }

-- 不检测文件内部的换行符格式
editor.checkeol = false

-- 设置默认换行符
editor.defaulteol = wxstc.wxSTC_EOL_LF

-- 代码缩进宽度
editor.tabwidth = 4

-- 开启文件内的词组补全
acandtip.nodynwords = false

-- 默认配色为黑色背景
local G = ...
styles.text = {bg = {240,240,220}}
styles = G.loadfile('cfg/tomorrow.lua')('Monokai')
stylesoutshell = styles
styles.marker = styles.marker or {}
styles.marker.message = {ch = wxstc.wxSTC_MARK_ARROWS, fg = {0, 0, 0}, bg = {240, 240, 240}}
styles.marker.output = {ch = wxstc.wxSTC_MARK_BACKGROUND, fg = {0, 0, 0}, bg = {240, 240, 240}}
styles.marker.prompt = {ch = wxstc.wxSTC_MARK_CHARACTER+('>'):byte(), fg = {0, 0, 0}, bg = {240, 240, 240}}
stylesoutshell = styles
styles.indicator={}
