//
//  UserInfo.m
//  fenxiao1.0
//
//  Created by 祝高鹏 on 16/5/25.
//  Copyright © 2016年 祝高鹏. All rights reserved.
//

#import "UserInfo.h"

//账号信息
#define t_accountDict @"t_accountDict"
//宏定义
#define Search_RecentSearchWord @"Search_RecentSearchWord"
@implementation UserInfo

+(instancetype)shareAccount{
    return [[self alloc] init];
}

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    
    static UserInfo *account;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        account = [super allocWithZone:zone];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        account.accountDict = [defaults objectForKey:t_accountDict];
        
    });
    
    return account;
}

-(void)saveToSandBox{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.accountDict forKey:t_accountDict];
    [defaults synchronize];
}

-(void)logoOutAccount{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:t_accountDict];
    [userDefaults synchronize];
}

+(void)saveSearchWord:(NSString *)word{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if ([userDefaults objectForKey:Search_RecentSearchWord]) {
        NSArray *oldWord = [userDefaults objectForKey:Search_RecentSearchWord];
        if (oldWord.count>0) {
            NSMutableArray *newWord = [NSMutableArray arrayWithArray:oldWord];
            BOOL isHas = NO;
            for (NSString *str in oldWord) {
                if ([str isEqualToString:word]) {
                    isHas = YES;
                    break;
                }
            }
            if (!isHas) {
                [newWord addObject:word];
            }
            [userDefaults setObject:[NSArray arrayWithArray:newWord] forKey:Search_RecentSearchWord];
        }else{
            NSArray *wordArr = [NSArray arrayWithObject:word];
            [userDefaults setObject:wordArr forKey:Search_RecentSearchWord];
        }
    }else{
        NSArray *wordArr = [NSArray arrayWithObject:word];
        [userDefaults setObject:wordArr forKey:Search_RecentSearchWord];
    }
    [userDefaults synchronize];
}

+(NSArray *)getSearchWord{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *arr = [userDefaults objectForKey:Search_RecentSearchWord];
    if (arr && arr.count>0) {
        return arr;
    }
    return nil;
}

+(void)clearSearchWord{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:Search_RecentSearchWord];
    [userDefaults synchronize];
}

@end
