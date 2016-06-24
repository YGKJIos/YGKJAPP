//
//  AFNetWorting.h
//  一个APP
//
//  Created by 梁立彬 on 16/6/13.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AFNetWorting : NSObject


+ (void)getNetWortingWithUrlString:(NSString *)urlString params:(NSDictionary *)params controller:(UIViewController *)controller success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

+ (void)postNetWortingWithUrlString:(NSString *)urlString params:(NSDictionary *)params controller:(UIViewController *)controller success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

@end
