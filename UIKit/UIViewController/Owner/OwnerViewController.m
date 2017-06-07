//
//  OwnerViewController.m
//
//  Created by Leo_Lei on 6/7/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import "OwnerViewController.h"

@implementation UIViewController (Owner)

+ (UIViewController *)currentViewController {
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    return [UIViewController findBestMatchedViewController:rootViewController];
}

+ (UIViewController *)findBestMatchedViewController:(UIViewController *)viewController {
    //  首先判断当前是否有正在显示的视图控制器, 一般肯定有, 取当前正在显示的视图控制器进行递归
    if (viewController.presentedViewController) {
        return [UIViewController findBestMatchedViewController:viewController.presentedViewController];
    } else if ([viewController isKindOfClass:[UISplitViewController class]]) {
        //  判断找到的视图控制器是否为分页控制器类型, 如果存在分页, 取最后一页的视图控制器再次递归, 否则当前页即当前所使用的视图控制器
        UISplitViewController *splitViewController = (UISplitViewController *)viewController;
        if (splitViewController.viewControllers.count > 0) {
            return [UIViewController findBestMatchedViewController:splitViewController.viewControllers.lastObject];
        } else {
            return viewController;
        }
    } else if ([viewController isKindOfClass:[UINavigationController class]]) {
        //  判断找到的视图控制器是否是导航栏控制器类型, 如果存在多个子控制器, 获取其顶部的视图控制器接着递归, 否则即为当前视图控制器
        UINavigationController *navigationController = (UINavigationController *)viewController;
        if (navigationController.viewControllers.count > 0) {
            return [UIViewController findBestMatchedViewController:navigationController.topViewController];
        } else {
            return viewController;
        }
    } else if ([viewController isKindOfClass:[UITabBarController class]]) {
        //  判断找到的视图控制器是否是标签控制器, 如果存在多个标签控制器, 获取当前选中的视图控制器递归, 否则即为当前视图控制器
        UITabBarController *tabBarController = (UITabBarController *)viewController;
        if (tabBarController.viewControllers.count > 0) {
            return [UIViewController findBestMatchedViewController:tabBarController.selectedViewController];
        } else {
            return viewController;
        }
    } else {
        //  如果显示的视图控制器, 均不属于以上几类控制器, 则直接进行返回
        return viewController;
    }
}

@end
