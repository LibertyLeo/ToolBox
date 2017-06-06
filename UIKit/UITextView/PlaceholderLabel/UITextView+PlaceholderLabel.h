//
//  UITextView+PlaceholderLabel.h
//
//  Created by Leo_Lei on 11/22/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (PlaceholderLabel)

/**
 利用runtime获取到UITextView含有私有属性placeholderLabel, 故使用KVC对其进行设置来达到
 文字提示的效果, 目前还存在如果不设置textView的字体时, 首次显示会产生位移

 @param text 需要提示的文字
 */
- (void)setPlaceholderText:(NSString *)text;

@end
