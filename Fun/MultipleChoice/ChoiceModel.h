//
//  ChoiceModel.h
//
//  Version 1.0.0
//  Created by Leo_Lei on 8/3/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChoiceModel : NSObject

/// 选项名称
@property (nonatomic, readonly, copy) NSString *choiceName;

/// 额外参数, 便于相同选项名称时加以区分
@property (nonatomic, readonly, copy) NSString *additionName;

/// 选项高度
@property (nonatomic, readonly, assign) CGFloat cellHeight;

/// 选项标识, YES选中, NO未选中
@property (nonatomic, assign) BOOL choosed;


/**
 创建单个选项的初始化方法

 @param name 选项名称
 @param additionName 额外名称, 便于相同选项名称时加以区分
 @return 具备选项名称, 以及可能拥有的
 */
- (instancetype)initChoiceModelWithName:(NSString *)name
                           additionName:(nullable NSString *)additionName;

@end

NS_ASSUME_NONNULL_END
