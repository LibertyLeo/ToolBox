//
//  NSDictionary+ChineseDescription.m
//
//  Created by Leo_Lei on 8/24/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import "NSDictionary+ChineseDescription.h"

@implementation NSDictionary (ChineseDescription)

- (NSString *)chineseDescription {
    
    NSMutableString *desc = [NSMutableString stringWithString:@"{\n"];
    
    /*
     取得每一个键值对, 进行追加字符串操作, 直到追加到最后一组键值对时, 进行换行操作
     \" 由于打印的键值对都是中文字符, 所以对元素都手动添加双引号, 可自行决定是否添加
     \t 代表跳至下一个制表符位置
     */
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [desc appendFormat:@"\t\"%@\" = \"%@\";\n", key, obj];
    }];
    [desc appendString:@"}\n"];
    
    return desc;
}

@end
