//
//  NSArray+ChineseDescription.m
//
//  Created by Leo_Lei on 8/24/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import "NSArray+ChineseDescription.h"

@implementation NSArray (ChineseDescription)

- (NSString *)chineseDescription {
    //  1.第一种方法, for循环
    //  打印数组时以"("打头
    NSMutableString *desc = [NSMutableString stringWithString:@"(\n"];
    
    /*
     取得每一个数组元素, 进行追加字符串操作, 直到追加到最后一个字符时, 进行换行操作
     \" 由于打印中文字符, 所以对元素都手动添加双引号, 可自行决定是否添加
     \t 代表跳至下一个制表符位置
     */
    for (int i = 0; i < self.count; i++) {
        NSString *string = self[i];
        [desc appendFormat:@"\t\"%@\"", string];
        if (i != self.count - 1) {
            [desc appendString:@",\n"];
        }
    }
    [desc appendString:@"\n)"];
    return desc;
    
    //  2.第二种方法, 迭代
    //    NSMutableString *desc = [NSMutableString stringWithString:@"(\n"];
    //
    //    // 迭代数组中的所有元素, 进行字符串拼接
    //    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    //        [desc appendFormat:@"\t\"%@\",\n", obj];
    //    }];
    //    [desc appendString:@")\n"];
    //
    //    // 删除最后一个逗号
    //    if (self.count > 0) {
    //        NSRange range = [desc rangeOfString:@"," options:NSBackwardsSearch];
    //        [desc deleteCharactersInRange:range];
    //    }
    //    
    //    return desc;
}

@end
