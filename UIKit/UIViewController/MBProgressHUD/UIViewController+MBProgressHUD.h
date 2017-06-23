//
//  UIViewController+MBProgressHUD.h
//
//  Created by Leo_Lei on 8/24/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 仿写MBProgressHUD模式, 纯文本提示使用前三种模式, 进度指示使用后三种模式
typedef NS_ENUM(NSUInteger, HUDMode) {
    /// 风火轮
    HUDModeDefault = 0,
    /// 自定义视图
    HUDModeCustomView,
    /// 仅文字
    HUDModeOnlyText,
    /// 水平进度条
    HUDModeHorizontalBar,
    /// 圆轮
    HUDModeCircle,
    /// 圆环
    HUDModeRing
};

@interface UIViewController (MBProgressHUD)

/**
 展示指定样式的进度指示器。
 设置样式为进度条, 圆轮, 圆环时, 进度不可设置, 如需进度设置使用showHUD:withProgress

 @param mode 展示样式
 */
- (void)showHUD:(HUDMode)mode;

/**
 展示指定样式的进度指示器, 并提供进度设定

 @param mode 展示样式
 @param progressValue 指示进度值
 */
- (void)showHUD:(HUDMode)mode withProgress:(CGFloat)progressValue;

/**
 展示指定样式的进度指示器, 可设置提示文字。
 设置样式为进度条, 圆轮, 圆环时, 进度不可设置, 如需进度设置使用-showHUD:withMessage:progress

 @param mode 展示样式
 @param message 提示文字
 */
- (void)showHUD:(HUDMode)mode withMessage:(nullable NSString *)message;

/**
 展示指定样式的进度指示器, 可设置提示文字, 并提供进度设定

 @param mode 展示样式
 @param message 提示文字
 @param progressValue 指示进度值
 */
- (void)showHUD:(HUDMode)mode
    withMessage:(nullable NSString *)message
       progress:(CGFloat)progressValue;

/**
 展示纯文本样式的进度指示器, 可设置延时消失, 小于等于0s或者大于10s, 以默认值1s计

 @param message 提示文字
 @param center 指示器位置: YES在屏幕中央, NO在屏幕底部
 @param delayTime 延时时长
 */
- (void)showHUDWithWarnMessage:(NSString *)message
                      inCenter:(BOOL)center
                    afterDelay:(NSTimeInterval)delayTime;

/**
 立即隐藏进度指示器

 @param animated 动画隐藏: YES默认以当前显示样式隐藏, NO无动画
 */
- (void)hideHUD:(BOOL)animated;

/**
 延时隐藏进度指示器

 @param animated 动画隐藏: YES默认以当前显示样式隐藏, NO无动画
 @param delayTime 延时时长: 小于等于0s或者大于10s, 以默认值1s计
 */
- (void)hideHUD:(BOOL)animated
     afterDelay:(NSTimeInterval)delayTime;

/**
 展示自定义视图样式的进度指示器后延时隐藏, 可设置提示文字, 默认延时1s消失

 @param message 提示文字
 @param success 提示结果: YES显示打勾图片, NO显示打叉图片
 */
- (void)hideHUDWithMessage:(NSString *)message
                   success:(BOOL)success;

@end

NS_ASSUME_NONNULL_END

