//
//  NSString+Symbol.m
//
//  Created by Leo_Lei on 8/24/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import "NSString+Symbol.h"

@implementation NSString (Symbol)

- (NSInteger)numberCount {
    NSInteger count = 0;
    for (NSInteger i = 0; i < self.length; ++i) {
        if (isnumber([self characterAtIndex:i])) {
            //  isnumber提供了判断字符为数字的机制
            count++;
        }
    }
    return count;
}

- (NSString *)numberString {
    NSMutableString *string = [NSMutableString string];
    for (NSInteger i = 0; i < self.length; ++i) {
        if (isnumber([self characterAtIndex:i])) {
            [string appendFormat:@"%c", [self characterAtIndex:i]];
        }
    }
    return string;
}

- (NSInteger)countByRegex {
    //  根据需要筛选字母、数字选定筛选语句
    NSString *numberRegexStr = @"[0-9]";
    //    NSString *symbolRegexStr = @"[a-zA-Z]";
    
    NSRegularExpression *regularExpression = [[NSRegularExpression alloc] initWithPattern:numberRegexStr
                                                                                  options:NSRegularExpressionCaseInsensitive
                                                                                    error:nil];
    NSArray *resultArray = [regularExpression matchesInString:self
                                                      options:0
                                                        range:NSMakeRange(0, self.length)];
    return resultArray.count;
}

@end
