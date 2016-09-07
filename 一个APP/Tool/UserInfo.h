//
//  UserInfo.h
//  fenxiao1.0
//
//  Created by 祝高鹏 on 16/5/25.
//  Copyright © 2016年 祝高鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject
@property (nonatomic,strong)NSMutableDictionary *accountDict;

+(instancetype)shareAccount;

-(void)saveToSandBox;
-(void)logoOutAccount;

+(void)saveSearchWord:(NSString *)word;
+(NSArray *)getSearchWord;
+(void)clearSearchWord;

@end
