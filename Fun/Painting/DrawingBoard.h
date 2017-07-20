//
//  DrawingBoard.h
//
//  Version 1.0.0
//  Created by Leo_Lei on 7/20/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawingBoard : UIView

/// 线条宽度
@property (nonatomic, assign) CGFloat lineWidth;

/// 线条颜色
@property (nonatomic, strong) UIColor *lineColor;

/// 判断是否有绘制记录, 适用于对未绘制图像不进行保存操作的场景
@property (nonatomic, readonly, assign) BOOL pathExist;


/// 撤销
- (void)undo;

/// 清屏
- (void)reset;

/// 截屏, 返回当前画板内容
- (UIImage *)saveCurrentImage;

@end
