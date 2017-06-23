//
//  UIViewControllerAlert.m
//
//  Created by Leo_Lei on 6/7/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import "UIViewControllerAlert.h"

@implementation UIViewController (Alert)

- (void)showAlertWithTitle:(nullable NSString *)title message:(NSString *)message {
    //  Create a alert controller.
    //  创建提醒控制器
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    //  Edit the alert action.
    //  创建提醒事件
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消"
                                                     style:UIAlertActionStyleCancel
                                                   handler:^(UIAlertAction * _Nonnull action) {
                                                       [alert dismissViewControllerAnimated:YES completion:nil];
                                                   }];
    
    //  Add the action into controller.
    //  添加提醒事件到提醒控制器上
    [alert addAction:cancel];
    
    /*
     When using 'self' to present view controller, when current viewController is
     deallocating and attempting to load the view, it may cause unpredictable behavior,
     using navigation controller may allow this case possible.When you pop view controller,
     by combine with 'loadViewIfNeeded' method may help you not seeing the warning on
     the work bench.
     */
    /*
     此处不使用当前视图控制器推出, 可以规避因回退上一视图控制器时, 视图控制器消失造成页面崩溃
     如果使用当前视图控制器的导航栏控制器进行推出, 由于当前视图控制器推出, 但是导航栏依在,
     工作台将打印"当前要展示的视图控制器已经消失, 要载入视图会导致不可预测的行为"提示, 添加
     loadViewIfNeeded可以规避该提示
     */
    if (self.navigationController != nil) {
        [self.navigationController presentViewController:alert animated:YES completion:nil];
        [alert loadViewIfNeeded];
    } else {
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (void)showAlert:(UIAlertControllerStyle)alertStyle
          message:(NSString *)message
      cancelTitle:(NSString *)cancelTitle
    cancelHandler:(actionHandler)handler {
    [self showAlert:alertStyle
              title:message
            message:nil
        cancelTitle:cancelTitle
      cancelHandler:handler];
}

- (void)showAlert:(UIAlertControllerStyle)alertStyle
            title:(NSString *)title
          message:(NSString *)message
      cancelTitle:(NSString *)cancelTitle
    cancelHandler:(actionHandler)handler {
    [self showAlert:alertStyle
              title:title
            message:message
        cancelTitle:cancelTitle
      cancelHandler:handler
     newActionTitle:@""
   newActionHandler:nil
          isDefault:YES];
}

- (void)showAlert:(UIAlertControllerStyle)alertStyle
            title:(NSString *)title
          message:(NSString *)message
      cancelTitle:(NSString *)cancelTitle
    cancelHandler:(actionHandler)cancelAction
   newActionTitle:(NSString *)actionTitle
 newActionHandler:(actionHandler)newAction
        isDefault:(BOOL)defaultStyle {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:alertStyle];

    //  用于需要在block中使用, 故提前weak
    __weak typeof(alert)weakAlert = alert;

    //  如果不设置默认按钮的文字, 使用默认值, 如果定义了操作, 则根据操作执行, 否则仅关闭弹出框
    NSString *buttonTitle = (cancelTitle.length != 0 ?
                             cancelTitle : @"取消");
    UIAlertActionStyle buttonstyle = (cancelTitle.length != 0 ?
                                      UIAlertActionStyleDefault : UIAlertActionStyleCancel);
    actionHandler buttonHandler = (cancelAction != nil ?
                                   cancelAction : ^(UIAlertAction * _Nonnull action) {
                                       __strong typeof(weakAlert)strongAlert = weakAlert;
                                       [strongAlert dismissViewControllerAnimated:YES
                                                                       completion:nil];
                                   });

    UIAlertAction *action = [UIAlertAction actionWithTitle:buttonTitle
                                                     style:buttonstyle
                                                   handler:buttonHandler];

    [alert addAction:action];

    //  新增按钮长度标题文字长度如果不为0, 才进行操作的添加
    if (actionTitle.length != 0) {
        UIAlertActionStyle actionStyle = (defaultStyle ? UIAlertActionStyleDefault : UIAlertActionStyleDestructive);
        UIAlertAction *action = [UIAlertAction actionWithTitle:actionTitle
                                                         style:actionStyle
                                                       handler:newAction];

        [alert addAction:action];
    }

    [self presentViewController:alert animated:YES completion:nil];
}

@end
