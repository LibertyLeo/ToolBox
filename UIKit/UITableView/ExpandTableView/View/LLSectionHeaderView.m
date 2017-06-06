//
//  LLSectionHeaderView.m
//
//  Created by Leo_Lei on 9/29/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import "LLSectionHeaderView.h"

@interface LLSectionHeaderView()

@property (weak, nonatomic) IBOutlet UIImageView *triangleImageView;

@end

@implementation LLSectionHeaderView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Initialization code
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                action:@selector(tapToExpand)];
    [self addGestureRecognizer:singleTap];
}

- (void)setExpand:(BOOL)expand {
    _expand = expand;
    [UIView animateWithDuration:0.25 animations:^{
        self.triangleImageView.transform = expand? CGAffineTransformMakeRotation(M_PI_2) : CGAffineTransformIdentity;
    }];
}

- (void)tapToExpand {
    self.expand = !_expand;
    
    if (self.touchBlock) {
        self.touchBlock(_expand);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
