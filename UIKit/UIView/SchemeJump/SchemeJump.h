//
//  SchemeJump.h
//
//  Created by Leo_Lei on 12/22/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (SchemeJump)

/**
 完成系统设置以及App之间的跳转

 @param scheme 跳转路径的字符串源
 @param errorMessage 跳转失败自定义的提醒文字
 */
- (void)openScheme:(NSString *)scheme errorInfo:(NSString *)errorMessage;

@end

NS_ASSUME_NONNULL_END
