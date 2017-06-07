//
//  ImageTailor.h
//
//  Created by Leo_Lei on 6/7/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Rounded)

/**
 通过裁剪当前所在图层的图像，将图片进行圆角化处理

 @return 圆角化后的图片
 */
- (UIImage *)trimIntoRoundedImage;

@end
