//
//  FilterCharacter.h
//
//  Created by Leo_Lei on 6/7/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (FilterCharacter)

/**
 针对返回的JSON数据中包含换行符等特殊符号进行处理

 @param data 服务器后台返回的数据
 @return 经处理过的JSON数据
 */
+ (NSData *)handleSpecialCharactersWithJSONData:(NSData *)data;

@end
