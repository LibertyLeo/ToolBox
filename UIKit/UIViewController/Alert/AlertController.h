//
//  AlertController.h
//
//  Version 1.0.0
//  Created by Leo_Lei on 7/17/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ __nullable actionHandler)(UIAlertAction *action);

/**
 该扩展主要用于在视图控制器进行弹窗的快速创建, 并显示在控制器上。

 @author Leo_Lei
 @version 1.0.0
 */
@interface UIViewController (AlertController)

/**
 配置仅取消按钮弹窗, 可设置提醒文本。

 @param isAlert YES为操作表单(ActionSheet), NO为提醒框(Alert)。
 @param message 提醒文本。
 */
- (void)showAlert:(BOOL)isAlert message:(NSString *)message;

/**
 配置仅取消按钮弹窗, 可设置提醒文本、取消按钮标题。

 @param isAlert YES为操作表单(ActionSheet), NO为提醒框(Alert)。
 @param message 提醒文本。
 @param title 取消按钮标题: 默认为取消。
 */
- (void)showAlert:(BOOL)isAlert
          message:(NSString *)message
      cancelTitle:(nullable NSString *)title;

/**
 配置仅取消按钮弹窗, 可设置提醒标题、文本, 取消按钮标题。

 @param isAlert YES为操作表单(ActionSheet), NO为提醒框(Alert)。
 @param title 提醒标题。
 @param message 提醒文本。
 @param cancelTitle 取消按钮标题: 默认为取消。
 */
- (void)showAlert:(BOOL)isAlert
            title:(nullable NSString *)title
          message:(NSString *)message
      cancelTitle:(nullable NSString *)cancelTitle;

/**
 配置仅取消按钮弹窗, 可设置提醒标题、文本, 取消按钮标题及操作。

 @param isAlert YES为操作表单(ActionSheet), NO为提醒框(Alert)。
 @param title 提醒标题。
 @param message 提醒文本。
 @param cancelTitle 取消按钮标题: 默认为取消。
 @param handler 取消按钮操作。
 */
- (void)showAlert:(BOOL)isAlert
            title:(nullable NSString *)title
          message:(NSString *)message
      cancelTitle:(nullable NSString *)cancelTitle
    cancelHandler:(actionHandler)handler;

/**
 配置双按钮弹窗, 可设置提醒标题、文本, 默认按钮的标题及操作。

 @param isAlert YES为操作表单(ActionSheet), NO为提醒框(Alert)。
 @param title 提醒标题。
 @param message 提醒文本。
 @param actionTitle 按钮标题。
 @param isDestructiveStyle 按钮样式: YES销毁样式, NO默认样式。
 @param handler 按钮操作。
 */
- (void)showAlert:(BOOL)isAlert
            title:(nullable NSString *)title
          message:(NSString *)message
      actionTitle:(nullable NSString *)actionTitle
 destructiveStyle:(BOOL)isDestructiveStyle
          handler:(actionHandler)handler;

/**
 配置多按钮弹窗, 可设置提醒标题、文本, 取消按钮标题。

 @param isAlert YES为操作表单(ActionSheet), NO为提醒框(Alert)。
 @param title 提醒标题。
 @param message 提醒文本。
 @param actions 需要增加的操作数组。
 */
- (void)showAlert:(BOOL)isAlert
            title:(nullable NSString *)title
          message:(NSString *)message
          actions:(nullable NSArray<UIAlertAction *> *)actions;

@end

NS_ASSUME_NONNULL_END
