//
//  UIWindow+AlertWindow.m
//
//  Created by Leo_Lei on 12/23/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import "UIWindow+AlertWindow.h"

@implementation UIWindow (AlertWindow)

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
