//
//  FileDownload.h
//
//  Created by Leo_Lei on 8/29/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileDownload : NSObject

/**
 进行文件的下载请求

 @param url 下载路径
 @param fileName 文件名称
 */
- (instancetype)initDowlonadWithURL:(NSURL *)url fileName:(NSString *)fileName;

/// 开始下载
- (void)downloadBegin;

@end
