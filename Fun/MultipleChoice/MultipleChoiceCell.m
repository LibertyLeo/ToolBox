//
//  MultipleChoiceCell.m
//
//  Version 1.0.0
//  Created by Leo_Lei on 8/3/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import "MultipleChoiceCell.h"
#import "ChoiceModel.h"

@interface MultipleChoiceCell ()

@property (weak, nonatomic) IBOutlet UIImageView *chooseMark;
@property (weak, nonatomic) IBOutlet UILabel *choiceName;

@end

@implementation MultipleChoiceCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    [super layoutSubviews];

    UIImage *marked = [UIImage imageNamed:@"Mark"];
    UIImage *unmarked = [UIImage imageNamed:@"Unmark"];
    NSString *choiceName = _model.choiceName;
    if (_model.additionName.length) {
        choiceName = [choiceName stringByAppendingFormat:@"(%@)", _model.additionName];
    }
    self.choiceName.text = choiceName;
    self.chooseMark.image = _model.choosed ? marked : unmarked;
}

@end
