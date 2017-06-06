//
//  NSString+ImageType.m
//
//  Created by Leo_Lei on 8/9/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import "NSString+ImageType.h"

@implementation NSString (ImageType)

- (NSString *)contentTypeThroughImageData:(NSData *)data {
    uint8_t byte;
    [data getBytes:&byte length:1];
    switch (byte) {
        case 0xFF:
            return @"jpeg";
        case 0x89:
            return @"png";
        case 0x47:
            return @"gif";
        case 0x49:
        case 0x4D:
            return @"tiff";
        case 0x52:
            if ([data length] < 12) {
                return nil;
            }
            
            NSString *dataString = [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(0, 12)] encoding:NSASCIIStringEncoding];
            if ([dataString hasPrefix:@"RIFF"] && [dataString hasSuffix:@"WEBP"]) {
                return @"webp";
            }
            return nil;
    }
    return nil;
}

@end
