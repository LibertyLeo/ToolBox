//
//  Encryption.m
//
//  Created by Leo_Lei on 6/14/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import "Encryption.h"
#import <CommonCrypto/CommonDigest.h>

@implementation Encryption

- (NSString *)MD5HexEncryption:(NSString *)text {
    const char *cStr = [text UTF8String];
    unsigned char encrypt[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), encrypt);

    NSMutableString *encryption = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [encryption appendFormat:@"%02X", encrypt[i]];
    }

    return encryption;
}

@end
