//
//  FileDownload.m
//
//  Created by Leo_Lei on 8/29/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import "FileDownload.h"

@interface FileDownload ()<NSURLSessionDownloadDelegate>

@property(nonatomic, copy) NSString *fileName;
@property(nonatomic, strong) NSURL *fileUrl;

@end

@implementation FileDownload

- (NSString *)fileName {
    //  没有文件名, 默认以链接最后字符为文件名称
    if (!_fileName) {
        _fileName = self.fileUrl.path.lastPathComponent.stringByRemovingPercentEncoding;
    }
    
    return _fileName;
}

- (instancetype)initDowlonadWithURL:(NSURL *)url fileName:(NSString *)fileName {
    self = [super init];
    if (self) {
        self.fileUrl = url;
        self.fileName = fileName;
    }
    
    return self;
}

#pragma mark - 下载文件
- (void)downloadBegin {
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    cachePath = [cachePath stringByAppendingPathComponent:self.fileName];
    
    //  判断缓存文件下是否存在文件, 如果不存在进行下载工作
    if (![[NSFileManager defaultManager] fileExistsAtPath:cachePath]) {
        NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]
                                                              delegate:self
                                                         delegateQueue:[NSOperationQueue mainQueue]];
        NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:self.fileUrl];
        [downloadTask resume];
    }
}

#pragma mark - NSURLSESSION_DOWNLOAD_DELEGATE
- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location {
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    cachePath = [cachePath stringByAppendingPathComponent:self.fileName];
    NSFileManager *manager = [NSFileManager defaultManager];
    //  下载文件完毕, 进行文件的移动工作
    [manager moveItemAtPath:location.path toPath:cachePath error:nil];
}

@end
