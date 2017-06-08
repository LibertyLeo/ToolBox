#ToolBox
该仓库主要用来存储平时项目常用的一些自我封装以及宏定义。

## [Base](/Base)
- Constant: 常量文件。  
- Macro: 常用宏。

## Foundation
- [LLModel](/Foundation/LLModel): 用于网络请求数据返回后的JSON解析。    
- NSData:
	- [FilterCharacter](/Foundation/NSData/FilterCharacter): 用于将网络请求返回数据中包含的转义字符进行识别。
- NSString:
	- [ImageType](/Foundation/NSString/ImageType): 用于解析图像数据返回其图片格式。
    - [Symbol](/Foundation/NSString/Symbol): 判断字符串中字母或者数字的个数。
    - [TimeConverter](/Foundation/NSString/TimeConverter): 字符串与日期进行转换。
- NSArray:
	- [ChineseDescription](/Foundation/NSArray/ChineseDescription): 用于将数组中unicode数据进行中文转换。
- NSDictionary:
	- [ChineseDescription](/Foundation/NSDictionary/ChineseDescription): 用于将字典中unicode数据进行中文转换。

## Network
- [FileDownload](/Network/FileDownload): 用于下载文件的简单封装，文件下载完毕会转移到沙盒目录下进行缓存。
- [LLNetManager](/Network/LLNetManager): 采用AFNetwoking3.0为核心，进行对一般GET、POST请求进行二次封装。
- [LLNetworkReachability](/Network/LLNetworkReachability): 通过获取状态栏中网络状态视图来进行网络的判断，如果状态栏被隐藏或不可见，该方法不可用。

## UIKit
- UIButton:
	- [TimeCounter](/UIKit/UIButton/TimeCounter): 封装用于在限定时间内取消按钮的操作性，即防止短时间内进行多次操作而产生的“发送验证码”式按钮。
- UIImage:
	- [BarCode and QRCode](/UIKit/UIImage/Bar%20and%20QRCode): 对UIImage扩展生成条形码和二维码的API，根据字符串进行图像的生成。
	- [PureColor](/UIKit/UIImage/PureColor): 通过图形上下文，进行对指定颜色数据进行解析，重新定义图层绘制，返回纯色图像。
	- [ImageTailor](/UIKit/UIImage/ImageTailor): 通过图形上下文，进行指定图形的图层裁剪操作，返回裁剪后的圆形图像。
- UITableView:
	- [ExpandTableView](/UIKit/UITableView/ExpandTableView): 项目中经常会使用到的折叠式视图，点击分组组头可进行当前组的展开收起操作。
- UITextView:
	- [PlaceholderLabel](/UIKit/UITextView/PlaceholderLabel): 通过runTime遍历出iOS本身存在该属性，只是放在了声明文件中。通过KVC的方式封装了API将该属性进行公开。
- UIView:
	- [SchemeJump](/UIKit/UIView/SchemeJump): 通过URL进行系统功能如通话，短信的调用。
	- [Geometry](/UIKit/UIView/Geometry): 对UIView的一些位置、尺寸属性进一步封装，简化设定约束时的API调用。
- UIViewController:
	- [MBProgressHUD](/UIKit/UIViewController/MBProgressHUD): 项目中经常使用的提示视图，配合MBProgressHUD基于UIViewController的封装。
	- [Owner](/UIKit/UIViewController/Owner): 通过递归视图控制器栈进行当前使用的视图控制器的查找。
	- [Alert](/UIKit/UIViewController/Alert): 针对UIAlertController警醒框进行API的封装，满足至多添加一个新操作的使用。
- UIWindow:
	- [AvailableWindow](/UIKit/UIWindow): 通过监视当前窗口的使用情况，解决弹出单个警醒框后不可再弹出警醒框的问题。
