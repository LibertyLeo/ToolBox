//
//  DrawingBoard.m
//
//  Version 1.0.0
//  Created by Leo_Lei on 7/20/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import "DrawingBoard.h"
#import "Path.h"

@interface DrawingBoard ()

@property (nonatomic, assign) CGMutablePathRef drawPath;        // 当前绘制路径
@property (nonatomic, strong) NSMutableArray<Path *> *paths;    // 保存多条路径

@end

@implementation DrawingBoard

#pragma mark - 初始化方法
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 设定默认线条颜色及线宽
        self.lineColor = [UIColor blackColor];
        self.lineWidth = 5.0f;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // 设定默认线条颜色及线宽
        self.lineColor = [UIColor blackColor];
        self.lineWidth = 5.0f;
    }
    return self;
}

#pragma mark - 绘制方法
- (void)drawRect:(CGRect)rect {
    // 绘制数组中所有路径
    for (Path *model in self.paths) {
        [self drawPath:model.path
               inColor:model.lineColor
         withLineWidth:model.lineWidth];
    }

    // 路径在touchEnded方法中才应该添加到路径数组中, 因此需要绘制当前路径
    if (self.drawPath != nil) {
        [self drawPath:self.drawPath
               inColor:self.lineColor
         withLineWidth:self.lineWidth];
    }
}

- (void)drawPath:(CGMutablePathRef)path
         inColor:(UIColor *)color
   withLineWidth:(CGFloat)width {
    CGContextRef context = UIGraphicsGetCurrentContext();
    [color setStroke];
    CGContextSetLineWidth(context, width);
    CGContextAddPath(context, path);
    CGContextDrawPath(context, kCGPathStroke);
}

#pragma mark - UITouch触摸方法
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 获取起点坐标
    UITouch *touch = [touches anyObject];
    CGPoint origin = [touch locationInView:self];

    // 创建一条路径
    self.drawPath = CGPathCreateMutable();

    // 起点添加到路径上
    CGPathMoveToPoint(self.drawPath, NULL, origin.x, origin.y);
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 获取当前触摸点
    UITouch *touch = [touches anyObject];
    CGPoint current = [touch locationInView:self];

    // 将触摸点甜添加到路径中并进行连线
    CGPathAddLineToPoint(self.drawPath, NULL, current.x, current.y);

    // 将每个点显示在界面上, 进行重绘
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 创建数组保存PathModel
    if (self.paths == nil) {
        self.paths = [NSMutableArray array];
    }

    // 创建一个Model并添加到数组中
    Path *model = [[Path alloc] init];
    model.path = self.drawPath;
    model.lineColor = self.lineColor;
    model.lineWidth = self.lineWidth;

    [self.paths addObject:model];

    // 释放创建出的绘制路径
    CGPathRelease(self.drawPath);
    // 进一步防止野指针出现
    self.drawPath = nil;
}

#pragma mark - 自定义方法
- (void)undo {
    // 删除最后一个PathModel
    [self.paths removeLastObject];
    [self setNeedsDisplay];
}

- (void)reset {
    [self.paths removeAllObjects];
    [self setNeedsDisplay];
}

- (UIImage *)saveCurrentImage {
    UIGraphicsBeginImageContext(self.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:context];
    UIImage *currentImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return currentImage;
}

@end
