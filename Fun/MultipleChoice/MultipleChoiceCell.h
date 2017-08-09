//
//  MultipleChoiceCell.h
//
//  Version 1.0.0
//  Created by Leo_Lei on 8/3/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ChoiceModel;

@interface MultipleChoiceCell : UITableViewCell

/// 选项模型
@property (nonatomic, strong) ChoiceModel *model;

@end
