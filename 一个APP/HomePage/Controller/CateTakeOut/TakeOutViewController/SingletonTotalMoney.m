//
//  SingletonTotalMoney.m
//  一个APP
//
//  Created by 梁立彬 on 16/9/9.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "SingletonTotalMoney.h"

@implementation SingletonTotalMoney

+ (instancetype)Singleton
{
    static SingletonTotalMoney *singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[SingletonTotalMoney alloc]init];
    });
    return singleton;
}

@end
