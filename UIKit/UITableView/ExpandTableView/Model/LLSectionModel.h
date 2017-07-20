//
//  LLSectionModel.h
//
//  Created by Leo_Lei on 9/29/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLSectionModel : NSObject

/// 当前分组展开状态
@property (nonatomic, assign) BOOL isExpand;

/// 分组名
@property (nonatomic, copy) NSString *sectionTitle;

/// 每个分组中的元素
@property (nonatomic, copy) NSArray *rows;

@end
