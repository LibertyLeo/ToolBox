//
//  UIImage+PureColorImage.h
//
//  Created by Leo_Lei on 11/15/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (PureColorImage)

/**
 能生成指定颜色的纯色图片
 
 @param color 想要生成纯色图片的颜色
 */
+ (UIImage *)getPureColorImage:(UIColor *)color;

@end
