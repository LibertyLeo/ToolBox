//
//  UIViewController+MBProgressHUD.h
//
//  Created by Leo_Lei on 8/24/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (MBProgressHUD)

/**
 仅载入一个旋转的风火轮提示用户正在加载
 */
- (void)showHUD;

/**
 展示包含风火轮样式以及提醒文字的提醒框, 为避免防止网络情况良好,
 遮罩蒙版造成一闪而过的不适感, 故蒙版更改为透明
 
 @param title 提醒文字
 */
- (void)showHUDWithTitle:(nullable NSString *)title;

/**
 展示纯文字提示样式, 默认显示停留1秒, 屏幕有蒙版遮罩效果
 
 @param message 提醒文字
 @param isCenter 是否在屏幕中央显示
 */
- (void)showHUDWithWarnMessage:(NSString *)message
                      inCenter:(BOOL)isCenter;

/**
 隐藏提醒框
 
 @param animated 是否动画隐藏, 如果是, 默认以当前HUD样式隐藏
 */
- (void)hideHUD:(BOOL)animated;

/**
 延时隐藏提醒框, 可根据需要设置隐藏的时长
 
 @param animated 是否动画隐藏, 如果是, 默认以当前HUD样式隐藏
 @param delay 延时时长
 */
- (void)hideHUD:(BOOL)animated
     afterDelay:(NSTimeInterval)delay;

/**
 隐藏提醒框附带图片样式
 
 @param message 提醒文字
 @param success 自我判断是否成功, 区别在于展示的图片不同
 */
- (void)hudDidFinishWithMessage:(NSString *)message
                        success:(BOOL)success;

@end

NS_ASSUME_NONNULL_END

