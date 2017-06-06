//
//  UIImage+PureColorImage.m
//
//  Created by Leo_Lei on 11/15/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import "UIImage+PureColorImage.h"

@implementation UIImage (PureColorImage)

+ (UIImage *)getPureColorImage:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
