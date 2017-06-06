//
//  NSString+ImageType.h
//
//  Created by Leo_Lei on 8/9/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ImageType)

/**
 通过图片数据进行常用图片类型判断

 @param data 图片信息
 @return 图片类型名
 */
- (NSString *)contentTypeThroughImageData:(NSData *)data;

@end
