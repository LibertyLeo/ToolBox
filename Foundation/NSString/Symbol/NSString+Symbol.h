//
//  NSString+Symbol.h
//
//  Created by Leo_Lei on 8/24/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Symbol)

/**
 计算出字符串中数字个数

 @return 数字个数
 */
- (NSInteger)numberCount;

/**
 对指定字符串进行非数字部分的过滤

 @return 仅包含数字的字符串
 */
- (NSString *)numberString;

/**
 使用正则表达式进行数字, 字母的个数计算

 @return 数字, 字母的个数
 */
- (NSInteger)countByRegex;

@end
