//
//  weixinObject.h
//  ocCrazy
//
//  Created by dukai on 16/1/7.
//  Copyright © 2016年 dukai. All rights reserved.
//

#import <Foundation/Foundation.h>
//APP端签名相关头文件
#import "payRequsestHandler.h"
#import "WXApi.h"
@interface weixinObject : NSObject<WXApiDelegate>

typedef void (^weixinPayResult)(BOOL payRet);

@property (strong, nonatomic) weixinPayResult weixinBlock;

+(weixinObject *)weixin;
+(void)weixinPay:(float)amount order:(NSString *)orderNum block:(weixinPayResult)result;
@end
