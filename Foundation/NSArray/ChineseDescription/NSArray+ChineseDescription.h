//
//  NSArray+ChineseDescription.h
//
//  Created by Leo_Lei on 8/24/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (ChineseDescription)

/**
 仿照数组的decription打印规则, 打印拼接好元素的字符串

 @return 根据规则生成的字符串
 */
- (NSString *)chineseDescription;

@end
