//
//  CodeTool.m
//
//  Created by Leo_Lei on 6/7/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import "CodeTool.h"

@implementation UIImage (CodeTool)

+ (UIImage *)generateBarCodeImage:(NSString *)codeString imageWidth:(CGFloat)width imageHeight:(CGFloat)height {
    //  将字符串进行无损转换
    NSData *data = [codeString dataUsingEncoding:NSISOLatin1StringEncoding allowLossyConversion:false];
    
    //  使用CIFilter类创建一个二维码, 并为其填充数据
    CIFilter *filter = [CIFilter filterWithName:@"CICode128BarcodeGenerator"];
    [filter setValue:data forKey:@"inputMessage"];
    CIImage *barcodeImage = [filter outputImage];
    
    //  通过进行等比例缩放为生成图片消除模糊
    CGFloat scaleX = width / barcodeImage.extent.size.width;
    CGFloat scaleY = height / barcodeImage.extent.size.height;
    CIImage *transformedImage = [barcodeImage imageByApplyingTransform:CGAffineTransformScale(CGAffineTransformIdentity, scaleX, scaleY)];
    
    return [UIImage imageWithCIImage:transformedImage];
}

+ (UIImage *)generateQRCodeImage:(NSString *)codeString imageWidth:(CGFloat)width imageHeight:(CGFloat)height {
    //  将字符串进行无损转换
    NSData *data = [codeString dataUsingEncoding:NSISOLatin1StringEncoding allowLossyConversion:false];
    
    //  使用CIFilter类创建一个二维码, 并为其填充数据, 我们当然也可以为其设定校准质量
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setValue:data forKey:@"inputMessage"];
    [filter setValue:@"H" forKey:@"inputCorrectionLevel"];
    CIImage *qrcodeImage = [filter outputImage];
    
    //  通过进行等比例缩放为生成图片消除模糊
    CGFloat scaleX = width / qrcodeImage.extent.size.width;
    CGFloat scaleY = height / qrcodeImage.extent.size.height;
    CIImage *transformedImage = [qrcodeImage imageByApplyingTransform:CGAffineTransformScale(CGAffineTransformIdentity, scaleX, scaleY)];
    
    return [UIImage imageWithCIImage:transformedImage];
}

@end
