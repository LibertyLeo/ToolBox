//
//  ChoiceModel.m
//
//  Version 1.0.0
//  Created by Leo_Lei on 8/3/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import "ChoiceModel.h"

@implementation ChoiceModel

- (instancetype)initChoiceModelWithName:(NSString *)name
                           additionName:(NSString *)additionName {
    self = [super init];
    if (self) {
        _choiceName = name;
        _additionName = additionName;
    }
    return self;
}

- (CGFloat)cellHeight {
    NSString *text = _choiceName;
    if (_additionName.length) {
        // 如果存在额外参数, 需要增加额外参数的显示
        text = [text stringByAppendingFormat:@"(%@)", _additionName];
    }

    // 实际可计算宽度需要减去额外间隙及留白
    CGFloat restWidth = 90;
    CGRect textRect = [text boundingRectWithSize:CGSizeMake(kScreenWidth - restWidth, CGFLOAT_MAX)
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:@{NSFontAttributeName : kSystemFont(17)}
                                         context:nil];
    // 计算高度+上下留白间隙+0.5的分界线高度为实际所需高度
    return ceil(CGRectGetHeight(textRect)) + 10 + 0.5;
}

@end
