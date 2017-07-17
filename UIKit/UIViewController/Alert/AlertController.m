//
//  AlertController.m
//
//  Created by Leo_Lei on 7/17/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import "AlertController.h"

@implementation UIViewController (AlertController)

/**
 配置仅取消按钮弹窗, 可设置提醒标题、文本, 取消按钮标题及操作。

 @param isAlert YES为操作表单(ActionSheet), NO为提醒框(Alert)。
 @param title 提醒标题。
 @param message 提醒文本。
 @param cancelTitle 取消按钮标题, 默认为取消。
 @param handler 取消按钮操作。
 @return 提醒框控制器。
 */
- (UIAlertController *)createBasicAlert:(BOOL)isAlert
                                  title:(NSString *)title
                                message:(NSString *)message
                            cancelTitle:(NSString *)cancelTitle
                                handler:(actionHandler)handler {
    UIAlertControllerStyle style = (isAlert ?
                                    UIAlertControllerStyleAlert : UIAlertControllerStyleActionSheet);
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:style];

    NSString *actionTitle = (cancelTitle.length != 0 ? cancelTitle : @"取消");
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:actionTitle
                                                     style:UIAlertActionStyleCancel
                                                   handler:handler];

    [alert addAction:cancel];
    return alert;
}

- (void)showAlert:(BOOL)isAlert message:(NSString *)message {
    [self showAlert:isAlert message:message cancelTitle:nil];
}

- (void)showAlert:(BOOL)isAlert message:(NSString *)message cancelTitle:(NSString *)title {
    [self showAlert:isAlert title:nil message:message cancelTitle:title];
}

- (void)showAlert:(BOOL)isAlert
            title:(NSString *)title
          message:(NSString *)message
      cancelTitle:(NSString *)cancelTitle {
    [self showAlert:isAlert
              title:title
            message:message
        cancelTitle:cancelTitle
      cancelHandler:nil];
}

- (void)showAlert:(BOOL)isAlert
            title:(NSString *)title
          message:(NSString *)message
      cancelTitle:(NSString *)cancelTitle
    cancelHandler:(actionHandler)handler {
    UIAlertController *alert = [self createBasicAlert:isAlert
                                                title:title
                                              message:message
                                          cancelTitle:cancelTitle
                                              handler:handler];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)showAlert:(BOOL)isAlert
            title:(NSString *)title
          message:(NSString *)message
      actionTitle:(NSString *)actionTitle
 destructiveStyle:(BOOL)isDestructiveStyle
          handler:(actionHandler)handler {
    UIAlertActionStyle style = (isDestructiveStyle ?
                                UIAlertActionStyleDestructive : UIAlertActionStyleDefault);
    UIAlertAction *action = [UIAlertAction actionWithTitle:actionTitle
                                                     style:style
                                                   handler:handler];
    NSArray *actions = (actionTitle == nil ? nil : @[action]);
    [self showAlert:isAlert title:title message:message actions:actions];
}

- (void)showAlert:(BOOL)isAlert
            title:(NSString *)title
          message:(NSString *)message
          actions:(NSArray<UIAlertAction *> *)actions {
    UIAlertController *alert = [self createBasicAlert:isAlert
                                                title:title
                                              message:message
                                          cancelTitle:nil
                                              handler:nil];
    if (actions.count) {
        for (UIAlertAction *action in actions) {
            NSAssert([action isKindOfClass:[UIAlertAction class]], @"检查操作数组中的类型是否正确。");
            NSAssert(action.style != UIAlertActionStyleCancel, @"弹窗的取消按钮有且仅有一个, 该封装方法默认已对取消按钮进行配置, 请传入其他按钮。");
            [alert addAction:action];
        }
    }

    [self presentViewController:alert animated:YES completion:nil];
}

@end
