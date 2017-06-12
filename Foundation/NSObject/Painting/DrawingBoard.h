//
//  DrawingBoard.h
//
//  Created by Leo_Lei on 6/7/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawingBoard : UIView

/** 线条颜色*/
@property (nonatomic, strong) UIColor *drawColor;

/** 线条宽度*/
@property (nonatomic, assign) CGFloat lineWidth;

/** 撤销*/
- (void)undo;

/** 清屏*/
- (void)reset;

@end
