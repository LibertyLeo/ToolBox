//
//  Path.h
//
//  Version 1.0.0
//  Created by Leo_Lei on 7/20/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Path : NSObject

/// 绘制路径
@property (nonatomic, assign) CGMutablePathRef path;

/// 线条宽度
@property (nonatomic, assign) CGFloat lineWidth;

/// 线条颜色
@property (nonatomic, strong) UIColor *lineColor;

@end
