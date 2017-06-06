//
//  LLModel.h
//
//  Created by Leo_Lei on 8/24/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLModel : NSObject

/**
 进行JSON数据的解析, 进行初始化操作

 @param dataDic 需要解析的数据字典
 @return 经过初始化, 解析完毕的数据字典
 */
- (id)initWithDataDic:(NSDictionary*)dataDic;

/**
 进行数据匹配操作, 即设置对应的模型名与JSON中的键名相匹配

 @param dataDic 需要解析的数据字典
 */
- (void)setAttributes:(NSDictionary*)dataDic;

/** 设置映射字典*/
- (NSDictionary*)attributeMapDictionary;

@end
