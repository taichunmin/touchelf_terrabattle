LuaQ                -  
@ J�  I���I ��	@ �J  I���I���I@B�I�B�	@��J  I���I@ÁI�C�I�B�	@ �J  I���I āI@D�I�B�	@��J  I���I�āI�C�I�B�	@ �J  I���I@ŁI�E�I�B�	@ �J  I���I ƁI@F�I�B�	@��J  I���I�ƁI@F�I�B�	@ �J  I���I@ǁI�G�I�B�	@ �J  I���I ȁI@H�I�B�	@��J  I���I�ȁI@H�I�B�	@ �J  I���I@ɁI�I�I�I�	@ �J  I���I@ʁI�I�I�J�	@ �J  I���I ˁI@K�I�K�	@��J  I���I ́I@L�I�K�	@��J  I���I�́I M�I�K�	@ �J  I���I�́I�M�I�K�	@��J  I���I@΁I�N�I�K�	@ �J  I���I ρI@O�I�K�	@��J  I���I�ρI P�I�K�	@ �J  I���I�ЁI�P�I�K�	@��J  I���I@сI�Q�I�K�	@ �J  I���I ҁI@R�I�B�	@��J  I���I�ҁI@R�I�B�	@ �J  I���I@ӁI�S�I�S�	@ �J  I���I@ԁI�T�I�B�	@ �J  I���I ՁI@U�I�S�	@��J  I���I�ՁI V�I�S�	@ �J  I���I�ցI�V�I�B�	@��J  I���I@ׁI�W�I�B�	@ �J  I���I ؁I@X�I�B�	@��J  I���I�؁I�B�I�S�	@ �J  I���I@فI@X�I�B�	@ �J  I���I�فI Z�I�B�	@ �J  I���I�ځI Z�I�B�	@��J  I���I ہI Z�I@[�	@��J  I���I�ہI Z�I�S�	@ �J  I���I@܁I Z�I�S�	@ �J  I���I�܁I ]�I�S�	@ �J  I���I�݁I�]�I@[�	@��J  I���I@ށI�]�I@[�	@ �J  I���I�ށI _�I@_�	@ �J  I���I�߁I `�I@[�	@ �J  I���I���I�`�I a�	@��J  I���I��I�I�I�B�	@��J  I���I �I�B�I�K�	@��J  I���I��I�B�I�I�	@��J  I���I �I�B�I�S�	@��J  I���I��I�B�I�I�	@��J  I���I �I�B�I�S�	@��   � �      UI    type    value    description    脚本UI界面 	   logDebug 	   function s   输出调试信息到系统日志, 可以在'触摸精灵->设置->查看日志'中查看
   参数1: 调试信息    args    (message: string)    returns    ()    mSleep /   进行毫秒级别延迟
   参数1: 毫秒数    (time: number)    notifyMessage �   以文字提示框的方式通知用户
   参数1: 提示文字
   参数2: [可选] 显示时间，单位为毫秒，默认为1000 #   (message: string [, time: number])    notifyVibrate 5   以振动的方式通知用户
   参数1: 毫秒数    notifyVoice >   以播放音频的方式通知用户
   参数1: 音频路径    (path: string) 
   touchDown c   发送触摸按下事件
   参数1: 手指ID, 范围0~128
   参数2: X坐标
   参数3: Y坐标 #   (id: number, x: number, y: number) 
   touchMove j   发送触摸移动事件
   参数1: touchDown()传入的手指ID
   参数2: X坐标
   参数3: Y坐标    touchUp B   发送触摸抬起事件
   参数1: touchDown()传入的手指ID    (id: number)    keyDown s   发送物理按键按下事件
   参数1: 物理按键名称, IOS支持'HOME'; Android支持:'HOME','BACK','MENU'    (key: string)    keyUp s   发送物理按键抬起事件
   参数1: 物理按键名称, IOS支持'HOME'; Android支持:'HOME','BACK','MENU' 	   getColor X   获取指定坐标的颜色
   参数1: X坐标
   参数2: Y坐标
 返回值1: 颜色    (x: number, y: number) 	   (number)    getColorRGB |   获取指定坐标的颜色的R,G,B值
   参数1: X坐标
   参数2: Y坐标
 返回值1: R
 返回值2: G
 返回值3: B    (number, number, number) 
   findColor �   全屏找色
   参数1: 要找的颜色值
 返回值1: X坐标, 如果没找到返回-1
 返回值2: Y坐标, 如果没找到返回-1    (color: number)    (number, number)    findColorFuzzy �   全屏模糊找色
   参数1: 要找的颜色值
   参数2: 精确度, 范围1~100
 返回值1: X坐标, 如果没找到返回-1
 返回值2: Y坐标, 如果没找到返回-1    (color: number fuzzy: number)    findColorInRegion   区域找色
   参数1: 要找的颜色值
   参数2: 区域左上角X坐标
   参数3: 区域左上角Y坐标
   参数4: 区域右下角X坐标
   参数5: 区域右下角Y坐标
 返回值1: X坐标, 如果没找到返回-1
 返回值2: Y坐标, 如果没找到返回-1 ?   (color: number x1: number, y1: number, x2: number, y2: number)    findColorInRegionFuzzy =  区域模糊找色
   参数1: 要找的颜色值
   参数2: 精确度, 范围1~100
   参数3: 区域左上角X坐标
   参数4: 区域左上角Y坐标
   参数5: 区域右下角X坐标
   参数6: 区域右下角Y坐标
 返回值1: X坐标, 如果没找到返回-1
 返回值2: Y坐标, 如果没找到返回-1 M   (color: number fuzzy: number x1: number, y1: number, x2: number, y2: number)    findMultiColorInRegionFuzzy �  多点区域模糊找色
   参数1: 要找的颜色数组, 格式: {颜色1, 颜色2相对于颜色1的X坐标偏移, 颜色2相对于颜色1的Y坐标偏移, 颜色2 ...}
   参数2: 精确度, 范围1~100
   参数3: 区域左上角X坐标
   参数4: 区域左上角Y坐标
   参数5: 区域右下角X坐标
   参数6: 区域右下角Y坐标
 返回值1: X坐标, 如果没找到返回-1
 返回值2: Y坐标, 如果没找到返回-1 N   (colors: table, fuzzy: number x1: number, y1: number, x2: number, y2: number) 
   findImage �   全屏找图
   参数1: 要找的图片路径(BMP格式)
   参数2: [可选] 指定找图时忽略的透明色
 返回值1: X坐标, 如果没找到返回-1
 返回值2: Y坐标, 如果没找到返回-1 "   (image: string [, color: number])    findImageFuzzy �   全屏模糊找图
   参数1: 要找的图片路径(BMP格式)
   参数2: 精确度, 范围1~100
   参数3: [可选] 指定找图时忽略的透明色
 返回值1: X坐标, 如果没找到返回-1
 返回值2: Y坐标, 如果没找到返回-1 0   (image: string fuzzy: number [, color: number])    findImageInRegion Y  区域找图
   参数1: 要找的图片路径(BMP格式)
   参数2: 区域左上角X坐标
   参数3: 区域左上角Y坐标
   参数4: 区域右下角X坐标
   参数5: 区域右下角Y坐标
   参数6: [可选] 指定找图时忽略的透明色
 返回值1: X坐标, 如果没找到返回-1
 返回值2: Y坐标, 如果没找到返回-1 Q   (color: number x1: number, y1: number, x2: number, y2: number [, color: number])    findImageInRegionFuzzy s  区域模糊找图
   参数1: 要找的颜色值
   参数2: 精确度, 范围1~100
   参数3: 区域左上角X坐标
   参数4: 区域左上角Y坐标
   参数5: 区域右下角X坐标
   参数6: 区域右下角Y坐标
   参数7: [可选]指定找图时忽略的透明色
 返回值1: X坐标, 如果没找到返回-1
 返回值2: Y坐标, 如果没找到返回-1 _   (color: number fuzzy: number x1: number, y1: number, x2: number, y2: number [, color: number])    snapshotScreen �   全屏截图
   参数1: 截图存储的路径, 支持BMP和JPG格式,根据后缀名智能判断
   参数2: [可选] 图片尺寸缩放百分比, 范围10~100 #   (image: string, [, scale: number])    snapshotRegion -  区域截图
   参数1: 截图存储的路径, 支持BMP和JPG格式,根据后缀名智能判断
   参数2: 区域左上角X坐标
   参数3: 区域左上角Y坐标
   参数4: 区域右下角X坐标
   参数5: 区域右下角Y坐标
   参数6: [可选] 图片尺寸缩放百分比, 范围10~100    localOcrText e  本地图片识别
   参数1: 语言包tessdata目录的路径
   参数2: 语言类型, 'eng'为英文, 'chi_sim'为中文
   参数3: 区域左上角X坐标
   参数4: 区域左上角Y坐标
   参数5: 区域右下角X坐标
   参数6: 区域右下角Y坐标
   参数7: [可选] 文字白名单
 返回值1: 识别的文字, 失败返回空字符串 g   (path: string, language: string, x1: number, y1: number, x2: number, y2: number [, whitelist: string]) 	   (string)    cloudOcrInit U   选择远程代答平台
   参数1: 远程代答平台ID, 0为好爱, 1为打码兔    (platform: number)    cloudOcrText �  将当前屏幕区域截图后进行远程图片识别
   参数1: 用户名密码格式, 好爱:密码串 打码兔:用户名|密码
   参数2: 题目类型, 请前往所用代答平台官网查询
   参数3: 区域左上角X坐标
   参数4: 区域左上角Y坐标
   参数5: 区域右下角X坐标
   参数6: 区域右下角Y坐标
   参数7: 超时时间,范围20~600
 返回值1: 识别的文字, 失败返回空字符串 a   (userpass: string, type: string, x1: number, y1: number, x2: number, y2: number timeout: number)    cloudOcrTextEx �  将N个指定图片合并为一个图片后进行远程图片识别
   参数1: 用户名密码格式, 好爱:密码串 打码兔:用户名|密码
   参数2: 题目类型, 请前往所用代答平台官网查询
   参数3: 超时时间, 范围20~600
   参数4: 待合并的第一个图片路径
   ...
   参数N: 待合并的第N个图片路径
 返回值1: 识别的文字, 失败返回空字符串 G   (userpass: string, type: string, timeout: number, image1: string, ...)    keepScreen �   是否缓存屏幕: 开启缓存时将屏幕数据缓存到内存中, 后续找图找色函数都使用缓存的数据而不是每次重新获取屏幕数据, 直到关闭屏幕缓存
   参数1: 是否开启缓存    (switch: boolean)    rotateScreen J   旋转屏幕坐标体系
   参数1: 旋转角度, 有效值:0,90,-90,180    (angle: number) 	   copyText 2   复制文字到系统剪贴板
   参数1: 文字    (text: string) 	   clipText 3   获取系统剪贴板的文字
 返回值1: 文字 
   inputText h   输入文字到当前输入框中
   参数1: 要输入的文字, 其中'\b'可用于退格删除字符    appRun ,   打开指定应用
   参数1: 软件包名    (app: string)    appKill ,   关闭指定应用
   参数1: 软件包名    appRunning X   查询指定应用是否正在运行
   参数1: 软件包名
 返回值1: 是否运行 
   (boolean)    appBundlePath |   [只支持IOS系统] 查询指定应用的主程序目录路径
   参数1: 软件包名
 返回值1: 主程序目录路径    appDataPath v   [只支持IOS系统] 查询指定应用的数据目录路径
   参数1: 软件包名
 返回值1: 数据目录路径    httpGet D   HTTP协议访问
   参数1: 网页地址
 返回值1: 网页数据    (url: string)    ftpGet �   FTP协议下载
   参数1: 远程文件地址
   参数2: 本地文件路径
   参数3: FTP用户名
   参数4: FTP密码
 返回值1: 是否成功 7   (url: string, path: string, user: string pass: string)    ftpPut �   FTP协议上传
   参数1: 远程文件地址
   参数2: 本地文件路径
   参数3: FTP用户名
   参数4: FTP密码
 返回值1: 是否成功    memoryRead �   读取指定应用的内存数据
   参数1: 应用包名
   参数2: 内存地址
   参数3: 数据类型
 返回值1: 是否成功
 返回值2: 数据 -   (app: string, address: number, type: string)    (boolean, number)    memoryWrite �   写入数据到指定应用内存
   参数1: 应用包名
   参数2: 内存地址
   参数3: 数据类型
   参数4: 数据
 返回值1: 是否成功 ;   (app: string, address: number, type: string, data: number)    memorySearch 5  搜索指定应用的内存数据
   参数1: 应用包名
   参数2: 开启新的搜索还是再上一次搜索的结果上再次过滤搜索
   参数3: 数据数组, 格式: {数据1, 数据2相对于数据1的偏移, 数据2, ...}
 返回值1: 所有符合条件的内存地址数组, 最多返回128个 -   (app: string, restart: boolean, data: table)    (table)    setControlBarPosition ^   [只支持安卓系统]设置播放控制条的位置
   参数1: X坐标
   参数2: Y坐标    getScreenResolution >   获取屏幕分辨率
 返回值1: 宽度
 返回值2: 高度    getScreenColorBits 3   获取屏幕色彩位数
 返回值1: 色彩位数    getDeviceID -   获取设备唯一串号
 返回值1: 串号    getNetTime -   获取网络时间
 返回值1: 网络时间    getVersion 3   获取触摸精灵版本号
 返回值1: 版本号                 