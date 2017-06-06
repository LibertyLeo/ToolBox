//
//  UIView+SchemeJump.m
//
//  Created by Leo_Lei on 12/22/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import "UIView+SchemeJump.h"

@implementation UIView (SchemeJump)

- (void)openScheme:(NSString *)scheme errorInfo:(NSString *)errorMessage {
    UIApplication *application = [UIApplication sharedApplication];
    NSURL *URL = [NSURL URLWithString:scheme];
    
    if ([application respondsToSelector:@selector(openURL:options:completionHandler:)]) {
        [application openURL:URL options:@{}
           completionHandler:^(BOOL success) {
               if (!success) {
                   [self errorOccured:errorMessage];
               }
           }];
    } else {
        BOOL success = [application openURL:URL];
        if (!success) {
            [self errorOccured:errorMessage];
        }
    }
}

/**
 配合跳转使用, 如果跳转失败, 传入错误信息进行弹窗提醒, 由于不确定当前视图会以什么形式存在, 故导入
 自定义扩展UIWindow供AlertController弹窗使用
 
 @param errorMessage 错误信息
 */
- (void)errorOccured:(NSString *)errorMessage {
    [UIWindow notifyCurrentWindowIsAvailable:UIWindowLevelAlert withBlock:^{
        UIWindow *alertWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        alertWindow.windowLevel = UIWindowLevelAlert;
        alertWindow.rootViewController = [UIViewController new];
        [alertWindow makeKeyAndVisible];
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:errorMessage
                                                                                 message:nil
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *hiddeAction = [UIAlertAction actionWithTitle:@"取消"
                                                              style:UIAlertActionStyleCancel
                                                            handler:^(UIAlertAction * _Nonnull action) {
                                                                alertWindow.hidden = YES;
                                                            }];
        
        [alertController addAction:hiddeAction];
        [alertWindow.rootViewController presentViewController:alertController
                                                     animated:YES
                                                   completion:nil];
    }];
}

#pragma mark - 检测当前窗口的使用情况
+ (void)notifyCurrentWindowIsAvailable:(UIWindowLevel)level withBlock:(void (^)())block {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    if (keyWindow.windowLevel == level) {
        //  判断当前窗口是否被占用, 如果被占用, 添加观察者进行窗口的占用情况进行监听, 该观察者对象的生命周期由系统管理
        id observer;
        observer = [[NSNotificationCenter defaultCenter] addObserverForName:UIWindowDidBecomeHiddenNotification
                                                                     object:keyWindow
                                                                      queue:nil
                                                                 usingBlock:^(NSNotification *note) {
                                                                     [[NSNotificationCenter defaultCenter] removeObserver:observer];
                                                                     // 进行递归判断
                                                                     [self notifyCurrentWindowIsAvailable:level withBlock:block];
                                                                 }];
    } else {
        //  如果当前窗口一旦腾出使用权, 回调block, 进行自定义操作的实现
        block();
    }
}

@end
