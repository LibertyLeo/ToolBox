//
//  GradientColor.m
//
//  Created by Leo_Lei on 6/8/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import "GradientColor.h"

@implementation GradientColor

- (CALayer *)getGradientStartWith:(UIColor *)startColor
                       endBy:(UIColor *)endColor
                  layerFrame:(CGRect)frame
                gradientfrom:(GradientDirection)direction {
    CAGradientLayer *layer = [CAGradientLayer layer];
    //  存放渐变颜色数组
    layer.colors = @[(__bridge id)startColor.CGColor, (__bridge id)endColor.CGColor];

    //  起点和终点表示坐标系位置, (0.0, 0.0)表示左上角, (1.0, 1.0)表示右下角
    switch (direction) {
        case GradientFromTopToBottom:
            layer.startPoint = CGPointMake(0.0, 0.0);
            layer.endPoint = CGPointMake(0.0, 1.0);
            break;
        case GradientFromLeftToRight:
            layer.startPoint = CGPointMake(0.0, 0.0);
            layer.endPoint = CGPointMake(1.0, 0.0);
            break;
        case GradientFromTopLeftToBottomRight:
            layer.startPoint = CGPointMake(0.0, 0.0);
            layer.endPoint = CGPointMake(1.0, 1.0);
            break;
        case GradientFromTopRightToBottomLeft:
            layer.startPoint = CGPointMake(1.0, 0.0);
            layer.endPoint = CGPointMake(0.0, 1.0);
            break;
        default:
            break;
    }

    layer.frame = frame;
    return layer;
}

- (UIImage *)getGradientImageFromColors:(NSArray *)colors
                           gradientFrom:(GradientDirection)direction
                            byImageSize:(CGSize)size {
    NSMutableArray *colorData = [NSMutableArray array];
    for (UIColor *color in colors) {
        [colorData addObject:(id)color.CGColor];
    }

    UIGraphicsBeginImageContextWithOptions(size, YES, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace,
                                                        (CFArrayRef)colorData,
                                                        NULL);

    //  设定绘制区域
    CGPoint start = CGPointZero;
    CGPoint end = CGPointZero;
    switch (direction) {
        case GradientFromTopToBottom:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(0.0, size.height);
            break;
        case GradientFromLeftToRight:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(size.width, 0.0);
            break;
        case GradientFromTopLeftToBottomRight:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(size.width, size.height);
            break;
        case GradientFromTopRightToBottomLeft:
            start = CGPointMake(size.width, 0.0);
            end = CGPointMake(0.0, size.height);
            break;
        default:
            break;
    }

    CGContextDrawLinearGradient(context, gradient,
                                start, end,
                                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //  释放工作
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    return image;
}

@end
