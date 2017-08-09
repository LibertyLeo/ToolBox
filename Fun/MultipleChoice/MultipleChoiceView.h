//
//  MultipleChoiceView.h
//
//  Version 1.0.0
//  Created by Leo_Lei on 8/3/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ChoiceModel;

@interface MultipleChoiceView : UIView

/// 视图标题
@property (nonatomic, copy) NSString *viewTitle;

/// 选项模型
@property (nonatomic, copy) NSArray<ChoiceModel *> *choiceModels;

/// 用于存储已选择的选项
@property (nonatomic, copy) void(^choicesDidChoose)(NSArray<ChoiceModel *> *choices);


/**
 自定义面板的呼出方法

 @return 从xib加载的初始化面板
 */
+ (instancetype)showMainView;

@end
