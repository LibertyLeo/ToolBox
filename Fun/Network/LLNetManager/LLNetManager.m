//
//  LLNetManager.m
//
//  Version 1.0.0
//  Created by Leo_Lei on 7/21/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import "LLNetManager.h"
#import "AFNetworking.h"

@implementation LLNetManager

+ (LLNetManager *)sharedManager {
    static LLNetManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)GET:(NSString *)URLString
 parameters:(NSDictionary *)parameters
    success:(successBlock)success
    failure:(failureBlock)failure {

    return [self GET:URLString
          parameters:parameters
             timeout:10.0f
             success:success
             failure:failure];
}

- (void)GET:(NSString *)URLString
 parameters:(nullable NSDictionary *)parameters
    timeout:(NSTimeInterval)timeoutInterval
    success:(nullable successBlock)success
    failure:(nullable failureBlock)failure {

    return [self GET:URLString
          parameters:parameters
             timeout:timeoutInterval
            progress:nil
             success:success
             failure:failure];
}

- (void)GET:(NSString *)URLString
 parameters:(nullable NSDictionary *)parameters
    timeout:(NSTimeInterval)timeoutInterval
   progress:(nullable downloadBlock)downloadProgress
    success:(nullable successBlock)success
    failure:(nullable failureBlock)failure {
    // 针对超时进行一个安全设置
    if (timeoutInterval <= 0 || timeoutInterval >= 60) {
        timeoutInterval = 60.0f;
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = timeoutInterval;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:URLString
      parameters:parameters
        progress:downloadProgress
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             success([self handleSpecialCharactersWithJSONData:responseObject]);
         }
         failure:failure ? ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             // AFNetworking中针对错误信息的返回有自己的处理, 故此时如果我们设置failure为nil
             // 需要直接在此处返回nil, 否则由于failure为nil造成的error为nil
             // 会违背我们的block, 故产生崩溃
             failure(error);
         } : nil];
}

- (void)POST:(NSString *)URLString
  parameters:(NSDictionary *)parameters
     success:(successBlock)success
     failure:(failureBlock)failure {

    return [self POST:URLString
           parameters:parameters
              timeout:15.0f
              success:success
              failure:failure];
}

- (void)POST:(NSString *)URLString
  parameters:(nullable NSDictionary *)parameters
     timeout:(NSTimeInterval)timeoutInterval
     success:(nullable successBlock)success
     failure:(nullable failureBlock)failure {

    return [self POST:URLString
           parameters:parameters
              timeout:timeoutInterval
             progress:nil
              success:success
              failure:failure];
}

- (void)POST:(NSString *)URLString
  parameters:(nullable NSDictionary *)parameters
     timeout:(NSTimeInterval)timeoutInterval
    progress:(nullable uploadBlock)uploadProgress
     success:(nullable successBlock)success
     failure:(nullable failureBlock)failure {
    if (timeoutInterval <= 0 || timeoutInterval >= 60) {
        timeoutInterval = 60.0f;
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = timeoutInterval;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:URLString
       parameters:parameters
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              success([self handleSpecialCharactersWithJSONData:responseObject]);
          }
          failure:failure ? ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              // AFNetworking中针对错误信息的返回有自己的处理, 故此时如果我们设置failure为nil
              // 需要直接在此处返回nil, 否则由于failure为nil造成的error为nil
              // 会违背我们的block, 故产生崩溃
              failure(error);
          } : nil];
}

- (void)POST:(NSString *)URLString
  parameters:(nullable NSDictionary *)parameters
     timeout:(NSTimeInterval)timeoutInterval
  dataAppend:(nullable dataBlock)dataBlock
    progress:(nullable uploadBlock)uploadProgress
     success:(nullable successBlock)success
     failure:(nullable failureBlock)failure {
    if (timeoutInterval <= 0 || timeoutInterval >= 60) {
        timeoutInterval = 60.0f;
    }

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = timeoutInterval;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:URLString
       parameters:parameters
constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
    dataBlock(formData);}
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              success([self handleSpecialCharactersWithJSONData:responseObject]);
          }
          failure:failure ? ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              // AFNetworking中针对错误信息的返回有自己的处理, 故此时如果我们设置failure为nil
              // 需要直接在此处返回nil, 否则由于failure为nil造成的error为nil
              // 会违背我们的block, 故产生崩溃
              failure(error);
          } : nil];
}

- (void)POST:(NSString *)URLString
    envelope:(NSData *)relevantData
  completion:(completionBlock)completion {
    NSURL *url = [NSURL URLWithString:URLString];

    // 建立起接口请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];

    // 设置请求头请求体
    request.HTTPMethod = @"POST";
    request.HTTPBody = relevantData;
    request.timeoutInterval = 15.0f;
    [request setValue:@"application/soap+xml; charset=utf-8"
   forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%ld", relevantData.length]
   forHTTPHeaderField:@"Content-Length"];

    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];

    // 将完成的操作异步放在多线程中
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                    dispatch_async(dispatch_get_main_queue(), ^{
                                                        completion(data, response, error);
                                                    });
                                                }];

    [dataTask resume];
}

- (NSData *)handleSpecialCharactersWithJSONData:(NSData *)data {
    NSString *dataString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSMutableString *handleString = [NSMutableString stringWithString:dataString];
    
    [handleString replaceOccurrencesOfString:@"\n"
                                  withString:@"\\n"
                                     options:NSCaseInsensitiveSearch
                                       range:NSMakeRange(0, handleString.length)];
    
    [handleString replaceOccurrencesOfString:@"\b"
                                  withString:@"\\b"
                                     options:NSCaseInsensitiveSearch
                                       range:NSMakeRange(0, handleString.length)];
    
    [handleString replaceOccurrencesOfString:@"\f"
                                  withString:@"\\f"
                                     options:NSCaseInsensitiveSearch
                                       range:NSMakeRange(0, handleString.length)];
    
    [handleString replaceOccurrencesOfString:@"\r"
                                  withString:@"\\r"
                                     options:NSCaseInsensitiveSearch
                                       range:NSMakeRange(0, handleString.length)];
    
    [handleString replaceOccurrencesOfString:@"\t"
                                  withString:@"\\t"
                                     options:NSCaseInsensitiveSearch
                                       range:NSMakeRange(0, handleString.length)];
    
    return [[NSString stringWithString:handleString] dataUsingEncoding:NSUTF8StringEncoding];
}

@end
