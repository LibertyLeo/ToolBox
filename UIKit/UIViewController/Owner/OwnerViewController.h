//
//  OwnerViewController.h
//
//  Created by Leo_Lei on 6/7/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Owner)

/** 使用类方法进行扩展, 通过根据主窗口的根视图控制器去寻找到当前正在使用的视图控制器*/
+ (UIViewController *)currentViewController;

@end
