//
//  HUDController.h
//
//  Version 1.0.0
//  Created by Leo_Lei on 7/17/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 仿写MBProgressHUD模式的枚举, 纯文本提醒使用前三种模式, 进度指示使用后三种模式
typedef NS_ENUM(NSUInteger, HUDMode) {
    /// 风火轮
    Default = 0,
    /// 自定义视图
    CustomView,
    /// 仅文本
    Text,
    /// 水平进度条
    HorizontalBar,
    /// 圆轮
    Circle,
    /// 圆环
    Ring
};

/// 该扩展主要用于在视图控制器加载进度指示器。
@interface UIViewController (MBProgressHUD)

/**
 展示进度指示器。
 展示进度相关样式时, 使用-showHUD:progress设定进度值。

 @param mode 展示样式。
 */
- (void)showHUD:(HUDMode)mode;

/**
 展示进度指示器, 可设置进度值。

 @param mode 展示样式。
 @param value 进度值。
 */
- (void)showHUD:(HUDMode)mode progress:(CGFloat)value;

/**
 展示进度指示器, 可设置提醒文本。
 展示进度相关样式时, 使用-showHUD:message:progress设定进度值。

 @param mode 展示样式。
 @param message 提醒文本。
 */
- (void)showHUD:(HUDMode)mode message:(nullable NSString *)message;

/**
 展示进度指示器, 可设置提醒文本、进度值。

 @param mode 展示样式。
 @param message 提醒文本。
 @param value 进度值。
 */
- (void)showHUD:(HUDMode)mode
        message:(nullable NSString *)message
       progress:(CGFloat)value;

/**
 展示纯文本样式的进度指示器, 可设置延时消失时长。

 @param message 提醒文本。
 @param isCenter 指示器显示位置: YES在屏幕中央, NO在屏幕底部。
 @param delay 延时消失时长: 小于等于0s或者大于10s, 默认1s。
 */
- (void)showHUDWithOnlyMessage:(NSString *)message
                      inCenter:(BOOL)isCenter
                    afterDelay:(NSTimeInterval)delay;

/**
 隐藏进度指示器。

 @param animated 是否使用动画: YES默认以当前样式隐藏, NO无动画。
 */
- (void)hideHUD:(BOOL)animated;

/**
 隐藏进度指示器, 可设置延时消失时长。

 @param animated 是否使用动画: YES默认以当前样式隐藏, NO无动画。
 @param delay 延时消失时长: 小于等于0s或者大于10s, 默认1s。
 */
- (void)hideHUD:(BOOL)animated afterDelay:(NSTimeInterval)delay;

/**
 隐藏进度指示器, 消失前提供自定义状态视图, 可设置提醒文本, 默认延时1s消失。

 @param message 提醒文本。
 @param succeeded 自定义状态: YES显示打勾图片, NO显示打叉图片。
 */
- (void)hideHUDWithMessage:(NSString *)message success:(BOOL)succeeded;

@end

NS_ASSUME_NONNULL_END
