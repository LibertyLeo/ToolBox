//
//  GradientColor.h
//
//  Created by Leo_Lei on 6/8/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 渐变的方向

 - GradientFromTopToBottom: 自上向下渐变
 - GradientFromLeftToRight: 自左向右渐变
 - GradientFromTopLeftToBottomRight: 自左上向右下渐变
 - GradientFromTopRightToBottomLeft: 自右上向左下渐变
 */
typedef NS_ENUM(NSUInteger, GradientDirection) {
    GradientFromTopToBottom = 0,
    GradientFromLeftToRight,
    GradientFromTopLeftToBottomRight,
    GradientFromTopRightToBottomLeft
};

@interface GradientColor : NSObject

/**
 改变图层上绘制颜色的方向达到渐变的效果

 @param startColor 起始颜色
 @param endColor 结束颜色
 @param frame 图层尺寸
 @param direction 渐变方向
 @return 渐变色图层
 */
- (CALayer *)getGradientStartWith:(UIColor *)startColor
                            endBy:(UIColor *)endColor
                       layerFrame:(CGRect)frame
                     gradientfrom:(GradientDirection)direction;

/**
 根据颜色数组绘制渐变色, 进行渐变色的图片生成

 @param colors 需要渐变的颜色数组
 @param direction 渐变方向
 @param size 渐变图片
 @return 具有渐变效果的颜色图片
 */
- (UIImage *)getGradientImageFromColors:(NSArray *)colors
                           gradientFrom:(GradientDirection)direction
                            byImageSize:(CGSize)size;

@end
