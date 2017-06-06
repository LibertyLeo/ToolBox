//
//  UIImage+RoundedImage.h
//
//  Created by Leo_Lei on 8/9/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (RoundedImage)

/**
 通过裁剪当前所在图层的图像，将图片进行圆角化处理

 @return 圆角化后的图片
 */
- (UIImage *)trimIntoRoundedImage;

@end
