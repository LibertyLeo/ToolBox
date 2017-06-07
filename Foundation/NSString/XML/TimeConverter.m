//
//  TimeConverter.m
//
//  Created by Leo_Lei on 6/7/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import "TimeConverter.h"

@implementation NSString (TimeConverter)

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
