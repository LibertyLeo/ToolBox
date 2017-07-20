//
//  DrawingBoard.h
//
//  Created by Leo_Lei on 7/19/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawingBoard : UIView

/// 线条宽度
@property (nonatomic, assign) CGFloat lineWidth;

/// 线条颜色
@property (nonatomic, strong) UIColor *lineColor;


/// 撤销
- (void)undo;

/// 清屏
- (void)reset;

/// 截屏, 以png格式返回当前画板内容
- (UIImage *)saveCurrentImage;

@end
