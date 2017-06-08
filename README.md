#ToolBox
该仓库主要用来存储平时项目常用的一些自我封装以及宏定义。

## [Base](/Base)
- Constant: 常量文件。
- Macro: 常用宏。

## Foundation
- [建立JSON模型](/Foundation/LLModel): 用于网络请求数据返回后的JSON解析。
- NSObject:
    - [渐变色背景绘制](/Foundation/NSObject/GradientColor): 利用图层绘制原理进行渐变色图片的制作。
- NSData:
	- [转义字符识别](/Foundation/NSData/FilterCharacter): 用于将网络请求返回数据中包含的转义字符进行识别。
- NSString:
	- [图片格式](/Foundation/NSString/ImageType): 用于解析图像数据返回其图片格式。
    - [数字字母数量](/Foundation/NSString/Symbol): 判断字符串中字母或者数字的个数。
    - [日期转换器](/Foundation/NSString/TimeConverter): 字符串与日期进行转换。
- NSArray:
	- [打印中文元素](/Foundation/NSArray/ChineseDescription): 用于将数组中unicode数据进行中文转换。
- NSDictionary:
	- [打印中文元素](/Foundation/NSDictionary/ChineseDescription): 用于将字典中unicode数据进行中文转换。

## Network
- [文件下载](/Network/FileDownload): 用于下载文件的简单封装，文件下载完毕会转移到沙盒目录下进行缓存。
- [网络助手](/Network/LLNetManager): 采用AFNetwoking3.0为核心，进行对一般GET、POST请求进行二次封装。
- [网络检测](/Network/LLNetworkReachability): 通过获取状态栏中网络状态视图来进行网络的判断，如果状态栏被隐藏或不可见，该方法不可用。

## UIKit
- UIButton:
	- [定时器按钮](/UIKit/UIButton/TimeCounter): 封装用于在限定时间内取消按钮的操作性，即防止短时间内进行多次操作而产生的“发送验证码”式按钮。
- UIImage:
	- [条形码、二维码生成器](/UIKit/UIImage/Bar%20and%20QRCode): 对UIImage扩展生成条形码和二维码的API，根据字符串进行图像的生成。
	- [纯色图片制作器](/UIKit/UIImage/PureColor): 通过图形上下文，进行对指定颜色数据进行解析，重新定义图层绘制，返回纯色图像。
	- [图片圆角裁剪](/UIKit/UIImage/ImageTailor): 通过图形上下文，进行指定图形的图层裁剪操作，返回裁剪后的圆形图像。
- UITableView:
	- [可收缩展开视图](/UIKit/UITableView/ExpandTableView): 项目中经常会使用到的折叠式视图，点击分组组头可进行当前组的展开收起操作。
- UITextView:
	- [占位文字](/UIKit/UITextView/PlaceholderLabel): 通过runTime遍历出iOS本身存在该属性，只是放在了声明文件中。通过KVC的方式封装了API将该属性进行公开。
- UIView:
	- [系统功能调用器](/UIKit/UIView/SchemeJump): 通过URL进行系统功能如通话，短信的调用。
	- [几何](/UIKit/UIView/Geometry): 对UIView的一些位置、尺寸属性进一步封装，简化设定约束时的API调用。
- UIViewController:
	- [进度显示](/UIKit/UIViewController/MBProgressHUD): 项目中经常使用的提示视图，配合MBProgressHUD基于UIViewController的封装。
	- [当前视图控制器](/UIKit/UIViewController/Owner): 通过递归视图控制器栈进行当前使用的视图控制器的查找。
	- [警示框](/UIKit/UIViewController/Alert): 针对UIAlertController警醒框进行API的封装，满足至多添加一个新操作的使用。
- UIWindow:
	- [当前可用窗口](/UIKit/UIWindow): 通过监视当前窗口的使用情况，解决弹出单个警醒框后不可再弹出警醒框的问题。
