//
//  NSString+Time.m
//
//  Created by Leo_Lei on 11/23/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import "NSString+Time.h"

@implementation NSString (Time)

+ (NSString *)translateDate:(NSDate *)date inFormat:(NSDateFormatter *)format {
    return [format stringFromDate:date];
}

+ (NSString *)showCurrentTime {
    //  获取系统时间
    NSDate *date = [NSDate date];
    
    //  设置日期格式
    NSDateFormatter *dataFormat = [[NSDateFormatter alloc] init];
    dataFormat.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    //  返回指定日期格式的时间
    return [self translateDate:date inFormat:dataFormat];
}

@end
