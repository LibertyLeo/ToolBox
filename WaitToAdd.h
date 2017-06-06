//
//  WaitToAdd.h
//
//  Created by Leo_Lei on 3/21/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WaitToAdd : NSObject

#pragma mark - 计算磁盘、文件大小
/**
 获得磁盘的总容量

 @return 返回磁盘总容量，以兆为单位
 */
+ (CGFloat)totalCapacityOfDiskInMBBytes;

/**
 获得磁盘的可用容量

 @return 返回磁盘可用容量，以兆为单位
 */
+ (CGFloat)availableCapacityOfDiskInMBBytes;

/**
 获得指定路径下文件的大小

 @param filePath 文件路径
 @return 返回文件大小，以字节为单位
 */
+ (long long)fileSizeAtPathInBytes:(NSString *)filePath;

/**
 获得指定路径下文件夹中所有文件的总量

 @param folderPath 文件夹路径
 @return 返回所有文件的总和，以字节为单位
 */
+ (long long)folderSizeAtPathInBytes:(NSString *)folderPath;

#pragma mark - 关于字符串排序
/**
 获得字符串的首字母, 中文字符串也同样可行

 @param specifiedString 需要获得首字母的字符串
 @return 一个字母或者一个汉字
 */
+ (NSString *)firstLetterOfString:(NSString *)specifiedString;

/**
 将指定的字符串数组根据数组中的每一个字符串的首字母进行升序排序

 @param stringArray 需要进行排序的字符串数组
 @return 一个包含了字母和排序过的数组的字典。以字母为键, 排序完毕的数组为键值。
 */
+ (NSDictionary *)dictionarySortedByFirstLetterWithStringArrayInAscengdingOrder:(NSArray *)stringArray;

@end
