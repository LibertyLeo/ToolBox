//
//  UIViewController+UIAlertController.h
//
//  Created by Leo_Lei on 8/24/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (UIAlertController)

/**
 一个包含取消按钮的简单提醒框

 @param title 提醒标题
 @param message 提醒内容
 */
- (void)showAlertWithTitle:(nullable NSString *)title
                   message:(NSString *)message NS_DEPRECATED_IOS(8_0, 8_0,
                                                                 "use -showAlert:message:cancelTitle instead."
                                                                 "This method is no longer used.");

/**
 配置带取消样式按钮的弹窗, 提醒文本, 取消按钮文字可编辑
 
 @param alertStyle 弹窗样式, 可选择提醒窗或下拉列表
 @param message 提醒文本
 @param cancelTitle 取消按钮标题, 如果缺省, 使用"取消"当作标题
 */
- (void)showAlert:(UIAlertControllerStyle)alertStyle
          message:(NSString *)message
      cancelTitle:(nullable NSString *)cancelTitle;

/**
 配置带取消样式按钮的弹窗, 提醒标题、文本, 取消按钮文字可编辑
 
 @param alertStyle 弹窗样式, 可选择提醒窗或下拉列表
 @param title 提醒标题
 @param message 提醒文本
 @param cancelTitle 取消按钮标题, 如果缺省, 使用"取消"当作标题
 */
- (void)showAlert:(UIAlertControllerStyle)alertStyle
            title:(NSString *)title
          message:(nullable NSString *)message
      cancelTitle:(nullable NSString *)cancelTitle;

/**
 配置带取消样式按钮的弹窗, 提醒标题、文本, 取消按钮文字可编辑, 附加新操作
 
 @param alertStyle 弹窗样式, 可选择提醒窗或下拉列表
 @param title 提醒标题
 @param message 提醒文本
 @param cancelTitle 取消按钮标题, 如果缺省, 使用"取消"当作标题
 @param actionTitle 新操作按钮标题
 @param handler 新操作
 @param defaultStyle 1为默认样式, 0为红字警示样式(默认提醒窗只能拥有一个取消样式的按钮)
 */
- (void)showAlert:(UIAlertControllerStyle)alertStyle
            title:(NSString *)title
          message:(nullable NSString *)message
      cancelTitle:(nullable NSString *)cancelTitle
   newActionTitle:(NSString *)actionTitle
 newActionHandler:(void (^ __nullable)(UIAlertAction *action))handler
        isDefault:(BOOL)defaultStyle;

@end

NS_ASSUME_NONNULL_END
