//
//  AvailableWindow.h
//
//  Created by Leo_Lei on 6/7/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (AvailableWindow)

/**
 监听当前窗口的级别是否可以被占用, 如果可用, 在block中进行自定义操作的实现

 @param level 当前窗口的级别
 @param block 自定义操作的block
 */
+ (void)notifyCurrentWindowIsAvailable:(UIWindowLevel)level withBlock:(void (^)())block;

@end
