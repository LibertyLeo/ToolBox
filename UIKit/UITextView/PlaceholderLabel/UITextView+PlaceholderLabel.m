//
//  UITextView+PlaceholderLabel.m
//
//  Created by Leo_Lei on 11/22/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import "UITextView+PlaceholderLabel.h"

@implementation UITextView (PlaceholderLabel)

- (void)setPlaceholderText:(NSString *)text {
    UILabel *placeholderLabel = [[UILabel alloc] init];
    placeholderLabel.text = text;
    placeholderLabel.font = self.font;
    placeholderLabel.textColor = [UIColor lightGrayColor];
    placeholderLabel.numberOfLines = 0;
    [placeholderLabel sizeToFit];
    [self addSubview:placeholderLabel];
    [self setValue:placeholderLabel forKey:@"_placeholderLabel"];
}

@end
