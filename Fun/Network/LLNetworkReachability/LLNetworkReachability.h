//
//  LLNetworkReachability.h
//
//  Created by Leo_Lei on 6/21/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 一个关于获取网络状态的类
@interface LLNetworkReachability : NSObject

/// 定义常见的网络状态
typedef NS_ENUM(NSInteger, LLNetworkReachabilityStatus) {
    /// 未知网络
    LLNetworkReachabilityStatusUnknown          = -1,
    /// 网络不可链接
    LLNetworkReachabilityStatusNotReachable     = 0,
    /// 2G网络
    LLNetworkReachabilityStatusReachableVia2G   = 1,
    /// 3G网络
    LLNetworkReachabilityStatusReachableVia3G   = 2,
    /// 4G网络
    LLNetworkReachabilityStatusReachableVia4G   = 3,
    /// LTE网络, 4G+
    LLNetworkReachabilityStatusReachableViaLTE  = 4,
    /// WiFi
    LLNetworkReachabilityStatusReaacableViaWiFi = 5
};

/**
 通过状态栏的网络视图获取到当前网络状态(即如果当前状态栏被隐藏或其他情况下不可见，则该扩展无效)

 @return 返回对应网络状态的枚举值
 */
+ (LLNetworkReachabilityStatus)getCurrentNetworkReachabilityStatus;

@end

