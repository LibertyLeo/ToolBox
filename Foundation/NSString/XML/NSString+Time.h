//
//  NSString+Time.h
//
//  Created by Leo_Lei on 11/23/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 封装有关于时间的日期字符串相互转换*/
@interface NSString (Time)

/**
 显示指定日期的字符串

 @param date 指定日期
 @param format 日期格式
 @return 根据生成格式类型, 进行字符串的返回
 */
+ (NSString *)translateDate:(NSDate *)date inFormat:(NSDateFormatter *)format;

/**
 显示当前时间
 
 @return 返回以年-月-日 时:分:秒格式的字符串
 */
+ (NSString *)showCurrentTime;

@end
