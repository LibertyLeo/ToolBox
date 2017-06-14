//
//  Encryption.h
//
//  Created by Leo_Lei on 6/14/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Encryption : NSObject

/**
 进行十六进制的MD5加密, 返回字母为大写组合
 (若需要返回小写组合, 在方法实现中使用小写x即可)

 @param text 需要加密的字符串
 @return 经过加密的字符串
 */
- (NSString *)MD5HexEncryption:(NSString *)text;

@end
