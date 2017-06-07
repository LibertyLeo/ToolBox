//
//  CodeTool.h
//
//  Created by Leo_Lei on 6/7/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CodeTool)

/**
 根据字符串生成对应的条形码图像

 @param codeString 带转化成条形码图像的字符串
 @param width 生成条形码图像的宽度
 @param height 生成条形码图像的高度
 @return 条形码图像
 */
+ (UIImage *)generateBarCodeImage:(NSString *)codeString imageWidth:(CGFloat)width imageHeight:(CGFloat)height;

/**
 根据字符串生成对应的二维码图像

 @param codeString 待转化成二维码图像的字符串
 @param width 生成二维码图像的宽度
 @param height 生成二维码图像的高度
 @return 二维码图像
 */
+ (UIImage *)generateQRCodeImage:(NSString *)codeString imageWidth:(CGFloat)width imageHeight:(CGFloat)height;

@end
