//
//  NSDictionary+ChineseDescription.h
//
//  Created by Leo_Lei on 8/24/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (ChineseDescription)

/**
 仿照字典的decription打印规则, 打印拼接好元素的字符串

 @return 根据规则生成的字符串
 */
- (NSString *)chineseDescription;
@end
