//
//  LLNetworkReachability.m
//
//  Created by Leo_Lei on 6/21/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import "LLNetworkReachability.h"
#import "AppDelegate.h"

@implementation LLNetworkReachability

+ (LLNetworkReachabilityStatus)getCurrentNetworkReachabilityStatus {
    //  获取当前应用对象
    UIApplication *currentApp = [UIApplication sharedApplication];
    
    //  获取当前状态栏的可见视图
    NSArray *subViews = [[[currentApp valueForKey:@"statusBar"] valueForKey:@"foregroundView"] subviews];
    
    NSNumber *data = nil;
    //  从可见视图的数组中获取到网络视图
    for (id netView in subViews) {
        if ([netView isKindOfClass:[NSClassFromString(@"UIStatusBarDataNetworkItemView") class]]) {
            data = netView;
            break;
        }
    }
    
    //  返回当前的网络状态
    LLNetworkReachabilityStatus currentStatus = LLNetworkReachabilityStatusNotReachable;
    NSNumber *num = [data valueForKey:@"dataNetworkType"];
    currentStatus = [num integerValue];
    return currentStatus;
}

@end
