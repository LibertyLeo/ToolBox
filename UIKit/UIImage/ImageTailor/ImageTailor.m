//
//  ImageTailor.m
//
//  Created by Leo_Lei on 6/7/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import "ImageTailor.h"

@implementation UIImage (Rounded)

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
