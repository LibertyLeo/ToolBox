//
//  PureColor.h
//
//  Created by Leo_Lei on 6/7/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (PureColor)

/**
 能生成指定颜色的纯色图片
 
 @param color 想要生成纯色图片的颜色
 */
+ (UIImage *)getPureColorImage:(UIColor *)color;

@end
