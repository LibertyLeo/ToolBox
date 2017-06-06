//
//  UIViewController+OwnerViewController.h
//
//  Created by Leo_Lei on 12/23/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (OwnerViewController)

/** 使用类方法进行扩展, 通过根据主窗口的根视图控制器去寻找到当前正在使用的视图控制器*/
+ (UIViewController *)currentViewController;

@end
