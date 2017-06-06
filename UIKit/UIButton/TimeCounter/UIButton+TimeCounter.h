//
//  UIButton+TimeCounter.h
//
//  Created by Leo_Lei on 11/28/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (TimeCounter)

/**
 显示倒计时按钮, 倒计时期间, 按钮不响应事件。到时后, 重新响应点击事件
 
 @param seconds 倒计时秒数
 */
- (void)showTimeCounterForSeconds:(NSInteger)seconds;

@end
