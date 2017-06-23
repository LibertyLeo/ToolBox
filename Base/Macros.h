//
//  Macros.h
//
//  Created by Leo_Lei on 8/24/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

/// 获取屏幕宽高
#define kScreenHeight           [UIScreen mainScreen].bounds.size.height
#define kScreenWidth            [UIScreen mainScreen].bounds.size.width

/// 字体、颜色
#define kSystemFont(size)       [UIFont systemFontOfSize:size]
#define kBoldFont(size)         [UIFont boldSystemFontOfSize:size]
#define kItalicFont(size)       [UIFont italicSystemFontOfSize:size]
#define kRGBColor(R, G, B)      [UIColor colorWithRed:(R) / 255.0f green:(G) / 255.0f blue:(B) / 255.0f alpha:1.0]
#define kRGBAColor(R, G, B, A)  [UIColor colorWithRed:(R) / 255.0f green:(G) / 255.0f blue:(B) / 255.0f alpha:(A)]
#define kIOSBlue                kRGBColor(15.0, 126.0, 251.0)   //  iOS的系统蓝
#define kSeparateLineGray       kRGBColor(200.0, 199.0, 204.0)  //  表视图分界线的默认颜色

/// 判断系统版本
#define kSystemVersion          [[[UIDevice currentDevice] systemVersion] floatValue]

/// 字体适配, 可针对某两个屏幕进行特定字号的设定
#define kAutoSystemFont(screenWidth, big, small)    (screenWidth) >= 375? kSystemFont(big): kSystemFont(small)
#define kAutoBoldFont(screenWidth, big, small)      (screenWidth) >= 375? kBoldFont(big): kBoldFont(small)

/// 调试使用的打印
#ifdef DEBUG
#define kLog(format,...)    NSLog((@"<%@:%d> %s" format),\
                            [[NSString stringWithUTF8String:__FILE__] lastPathComponent],\
                                                            __LINE__, __PRETTY_FUNCTION__, ##__VA_ARGS__);
#else
#define kLog(...)
#endif

/// 简单粗暴的消除警告
#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

#endif /* Macros_h */
