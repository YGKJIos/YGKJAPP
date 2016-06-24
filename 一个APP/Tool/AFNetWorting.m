//
//  AFNetWorting.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/13.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "AFNetWorting.h"
#import <AFNetworking.h>


static NSString *headerUrl = @"http://192.168.1.66:8080/shangcheng/";  //测试服务器 IP地址


@implementation AFNetWorting

#pragma mark - 创建请求者
+(AFHTTPSessionManager *)manager
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 超时时间
    manager.requestSerializer.timeoutInterval = 30;
    
    // 声明上传的是json格式的参数，需要你和后台约定好，不然会出现后台无法获取到你上传的参数问题
    manager.requestSerializer = [AFHTTPRequestSerializer serializer]; // 上传普通格式
    //    manager.requestSerializer = [AFJSONRequestSerializer serializer]; // 上传JSON格式
    
    // 声明获取到的数据格式
    manager.responseSerializer = [AFHTTPResponseSerializer serializer]; // AFN不会解析,数据是data，需要自己解析
    //    manager.responseSerializer = [AFJSONResponseSerializer serializer]; // AFN会JSON解析返回的数据
    // 个人建议还是自己解析的比较好，有时接口返回的数据不合格会报3840错误，大致是AFN无法解析返回来的数据
    return manager;
}

+(void)getNetWortingWithUrlString:(NSString *)urlString params:(NSDictionary *)params controller:(UIViewController *)controller success:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    // 加载动画
    MBProgressHUD *progress = [MBProgressHUD showHUDAddedTo:controller.view animated:YES];
    progress.backgroundColor = [UIColor grayColor];
    progress.alpha = 0.5;
    // 拼接url
    NSString *addressUrl = [NSString stringWithFormat:@"%@%@",headerUrl,urlString];
    
    // AFN网络请求
    AFHTTPSessionManager *manager = [self manager];
    [manager GET:addressUrl parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
//        NSString *sandBox = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
//        NSString *sandBoxPath = [sandBox stringByAppendingPathComponent:@"reponse"];
//        NSLog(@"sandBoxPath----%@" , sandBoxPath);
//        NSDictionary *reponseDic = [NSDictionary dictionaryWithContentsOfFile:sandBoxPath];
//        success(task,reponseDic);
        if (responseObject) {
            [progress removeFromSuperview];
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//            [dic writeToFile:sandBoxPath atomically:YES];
            success(task, dic);
        }else
        {
            [progress removeFromSuperview];
            success(task,@"网络出现错误！！！");
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [progress removeFromSuperview];
        failure(task,error);
    }];
    
}

+ (void)postNetWortingWithUrlString:(NSString *)urlString params:(NSDictionary *)params controller:(UIViewController *)controller success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:headerUrl parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
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
