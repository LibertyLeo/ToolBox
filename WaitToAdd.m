//
//  WaitToAdd.m
//
//  Created by Leo_Lei on 3/21/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import "WaitToAdd.h"

@implementation WaitToAdd

+ (CGFloat)totalCapacityOfDiskInMBBytes {
    CGFloat size = 0.0;
    NSError *error = nil;
    
    //  获得在本地路径中一个有关系统信息的字典。示例如下
    /*
     NSFileSystemFreeNodes = 219547811;     当前系统的可用节点数量?
     NSFileSystemFreeSize = 899267833856;   当前系统磁盘的可用容量
     NSFileSystemNodes = 243902917;         当前系统的总结点数量?
     NSFileSystemNumber = 16777220;         当前系统的文件数量?
     NSFileSystemSize = 999026356224;       当前系统的总容量
     */
    NSDictionary *dictionary = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
    if (!error) {
        NSNumber *number = [dictionary objectForKey:NSFileSystemSize];
        size = [number floatValue] / 1024 / 1024;
    } else {
        NSLog(@"error:%@", error);
    }
    return size;
}

+ (CGFloat)availableCapacityOfDiskInMBBytes {
    CGFloat size = 0.0;
    NSError *error = nil;
    
    NSDictionary *dictionary = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
    if (!error) {
        NSNumber *number = [dictionary objectForKey:NSFileSystemFreeSize];
        size = [number floatValue] / 1024 / 1024;
    } else {
        NSLog(@"error:%@", error);
    }
    return size;
}

+ (long long)fileSizeAtPathInBytes:(NSString *)filePath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager fileExistsAtPath:filePath] ? [[fileManager attributesOfItemAtPath:filePath error:nil] fileSize] : 0;
}

+ (long long)folderSizeAtPathInBytes:(NSString *)folderPath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:folderPath]) {
        return 0;
    } else {
        NSEnumerator *filesEnumerator = [[fileManager subpathsAtPath:folderPath] objectEnumerator];
        long long folderSize = 0;
        //  这里切记不能将while中fileName的赋值写在外面来, 否则会造成系统卡死, 程序无限吃内存
        NSString *fileName = nil;
        while ((fileName = [filesEnumerator nextObject]) != nil) {
            NSString *filePath = [folderPath stringByAppendingPathComponent:fileName];
            folderSize += [self fileSizeAtPathInBytes:filePath];
        }
        return folderSize;
    }
}

+ (NSString *)firstLetterOfString:(NSString *)specifiedString {
    NSMutableString *multableString = [NSMutableString stringWithString:specifiedString];
    CFStringTransform((CFMutableStringRef) multableString, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((CFMutableStringRef) multableString, NULL, kCFStringTransformStripDiacritics, NO);
    NSString *firstLetter = [multableString capitalizedString];
    return [firstLetter substringToIndex:1];
}

+ (NSDictionary *)dictionarySortedByFirstLetterWithStringArrayInAscengdingOrder:(NSArray *)stringArray {
    //  待定
    return nil;
}

@end
