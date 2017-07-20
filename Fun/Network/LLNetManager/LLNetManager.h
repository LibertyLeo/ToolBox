//
//  LLNetManager.h
//
//  Created by Leo_Lei on 12/21/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFURLRequestSerialization.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^successBlock)(id _Nullable responseObject);
typedef void(^failureBlock)(NSError *error);
typedef void(^downloadBlock)(NSProgress *downloadProgress);

typedef void(^uploadBlock)(NSProgress *uploadProgress);
typedef void(^dataBlock)(id <AFMultipartFormData> formData);
typedef void(^completionBlock)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error);

/**
 使用AFNetWorking3.0版本进行核心配置, 减少Block中返回的参数, 以及修改各默认超时时长分别为
 GET请求10秒, POST请求15秒, SOAP请求15秒, 以及为之后配置HTTPS修改配置参数提供便利
 */
@interface LLNetManager : NSObject

/// 管理所有发起的网络请求
+ (LLNetManager *)sharedManager;

#pragma mark - GET请求
/**
 默认GET请求, 请求超时时长为10s
 
 @param URLString 用于构建URL的接口字符串
 @param parameters 请求所需参数
 @param success 请求成功时回调的block, 主要用于处理后台返回的数据
 @param failure 请求失败时回调的block, 主要用于返回错误信息
 */
- (void)GET:(NSString *)URLString
 parameters:(nullable NSDictionary *)parameters
    success:(nullable successBlock)success
    failure:(nullable failureBlock)failure;

/**
 GET请求, 可自行设置超时时长

 @param URLString 用于构建URL的接口字符串
 @param parameters 请求所需参数
 @param timeout 请求超时时长, 如果小于等于0或者比大于等于60的值将使用默认时长60秒
 @param success 请求成功时回调的block, 主要用于处理后台返回的数据
 @param failure 请求失败时回调的block, 主要用于返回错误信息
 */
- (void)GET:(NSString *)URLString
 parameters:(nullable NSDictionary *)parameters
timeoutInterval:(NSTimeInterval)timeout
    success:(nullable successBlock)success
    failure:(nullable failureBlock)failure;

/**
 GET请求, 可自行设置时长, 包含更新下载进度的block

 @param URLString 用于构建URL的接口字符串
 @param parameters 请求所需参数
 @param timeout 请求超时时长, 如果小于等于0或者比大于等于60的值将使用默认时长60秒
 @param downloadProgress 用于更新下载进度的block, 不会在主队列中回调
 @param success 请求成功时回调的block, 主要用于处理后台返回的数据
 @param failure 请求失败时回调的block, 主要用于返回错误信息
 */
- (void)GET:(NSString *)URLString
 parameters:(nullable NSDictionary *)parameters
timeoutInterval:(NSTimeInterval)timeout
   progress:(nullable downloadBlock)downloadProgress
    success:(nullable successBlock)success
    failure:(nullable failureBlock)failure;

#pragma mark - POST请求
/**
 默认POST请求, 请求超时时长为15s
 
 @param URLString 用于构建URL的接口字符串
 @param parameters 请求所需参数
 @param success 请求成功时回调的block, 主要用于处理后台返回的数据
 @param failure 请求失败时回调的block, 主要用于返回错误信息
 */
- (void)POST:(NSString *)URLString
 parameters:(nullable NSDictionary *)parameters
    success:(nullable successBlock)success
    failure:(nullable failureBlock)failure;

/**
 POST请求, 可自行设置超时时长
 
 @param URLString 用于构建URL的接口字符串
 @param parameters 请求所需参数
 @param timeout 请求超时时长, 如果小于等于0或者比大于等于60的值将使用默认时长60秒
 @param success 请求成功时回调的block, 主要用于处理后台返回的数据
 @param failure 请求失败时回调的block, 主要用于返回错误信息
 */
- (void)POST:(NSString *)URLString
 parameters:(nullable NSDictionary *)parameters
timeoutInterval:(NSTimeInterval)timeout
    success:(nullable successBlock)success
    failure:(nullable failureBlock)failure;

/**
 POST请求, 可自行设置时长, 包含更新上传进度的block
 
 @param URLString 用于构建URL的接口字符串
 @param parameters 请求所需参数
 @param timeout 请求超时时长, 如果小于等于0或者比大于等于60的值将使用默认时长60秒
 @param uploadProgress 用于更新上传进度的block, 不会在主队列中回调
 @param success 请求成功时回调的block, 主要用于处理后台返回的数据
 @param failure 请求失败时回调的block, 主要用于返回错误信息
 */
- (void)POST:(NSString *)URLString
 parameters:(nullable NSDictionary *)parameters
timeoutInterval:(NSTimeInterval)timeout
   progress:(nullable uploadBlock)uploadProgress
    success:(nullable successBlock)success
    failure:(nullable failureBlock)failure;

#pragma mark POST上传文件
/**
 POST上传数据请求, 可自行设置时长, 追加数据到block中
 @param URLString 用于构建URL的接口字符串
 @param parameters 请求所需参数
 @param timeout 请求超时时长, 如果小于等于0或者比大于等于60的值将使用默认时长60秒
 @param block 针对上传数据所做的操作, 例如拼接上传数据所在的路径以及文件名
 @param success 请求成功时回调的block, 主要用于处理后台返回的数据
 @param failure 请求失败时回调的block, 主要用于返回错误信息
 */
- (void)POST:(NSString *)URLString
  parameters:(nullable NSDictionary *)parameters
timeoutInterval:(NSTimeInterval)timeout
constructingBodyWithBlock:(nullable dataBlock)block
     success:(nullable successBlock)success
     failure:(nullable failureBlock)failure;

#pragma mark - SOAP请求
/**
 对WebService进行SOAP请求

 @param URLString 用于构建URL的接口字符串
 @param mainData 根据服务器所需要信息构建的字符串
 @param completion 完成该请求后的返回值, 包含错误信息
 */
- (void)POST:(NSString *)URLString
    envelope:(NSData *)mainData
  completion:(nullable completionBlock)completion;

@end

NS_ASSUME_NONNULL_END
