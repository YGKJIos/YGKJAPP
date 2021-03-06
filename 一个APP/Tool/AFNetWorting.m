//
//  AFNetWorting.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/13.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "AFNetWorting.h"
#import <AFNetworking.h>
#warning 本地服务器与测试服务器互换
static NSString *bendiUrl = @"http://139.129.209.189:8080/shangcheng/";  //测试服务器 IP地址 // headerUrl
static NSString *headerUrl = @"http://192.168.1.88:8080/shangcheng/";  // 本地服务器 // bendiUrl

@implementation AFNetWorting

#pragma mark - 创建请求者
+(AFHTTPSessionManager *)manager
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 超时时间
    manager.requestSerializer.timeoutInterval = 10;
    
    // 声明上传的是json格式的参数，需要你和后台约定好，不然会出现后台无法获取到你上传的参数问题
    manager.requestSerializer = [AFHTTPRequestSerializer serializer]; // 上传普通格式
    //    manager.requestSerializer = [AFJSONRequestSerializer serializer]; // 上传JSON格式
    
    // 声明获取到的数据格式
    manager.responseSerializer = [AFHTTPResponseSerializer serializer]; // AFN不会解析,数据是data，需要自己解析
    //    manager.responseSerializer = [AFJSONResponseSerializer serializer]; // AFN会JSON解析返回的数据
    // 个人建议还是自己解析的比较好，有时接口返回的数据不合格会报3840错误，大致是AFN无法解析返回来的数据
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    return manager;
}

+ (void)getNetWortingWithUrlString:(NSString *)urlString params:(NSDictionary *)params controller:(UIViewController *)controller success:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    // 拼接url
    NSString *addressUrl = [NSString stringWithFormat:@"%@%@",bendiUrl,urlString];
    
    // AFN网络请求
    AFHTTPSessionManager *manager = [self manager];
    [manager GET:addressUrl parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            success(task, dic);
            
        }else
        {
            success(task,@"网络出现错误！！！");
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(task,error);
    }];
    
}

+ (void)postNetWortingWithUrlString:(NSString *)urlString params:(NSDictionary *)params controller:(UIViewController *)controller success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure

{
    AFHTTPSessionManager *manager = [self manager];
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",bendiUrl,urlString];
    [manager POST:urlStr parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 请求成功
        if (responseObject) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            success(task, dic);
        }else
        {
            success(task,@"网络不给力啊!!!");
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 请求失败
        failure(task, error);
    }];
}

@end
