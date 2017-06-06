//
//  UIImage+RoundedImage.m
//
//  Created by Leo_Lei on 8/9/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import "UIImage+RoundedImage.h"

@implementation UIImage (RoundedImage)

- (UIImage *)trimIntoRoundedImage {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    
    //  获取图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //  设置圆形
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(context, rect);
    
    //  裁剪
    CGContextClip(context);
    
    //  绘画图形
    [self drawInRect:rect];
    
    //  从当前图形上下文获取到图片进行返回
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
