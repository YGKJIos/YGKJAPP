//
//  SingletonTotalMoney.h
//  一个APP
//
//  Created by 梁立彬 on 16/9/9.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MerchantInformationModel.h"

@interface SingletonTotalMoney : NSObject
+ (instancetype)Singleton;
@property (nonatomic, copy)NSString* peisong;  // 配送
@property (nonatomic, copy)NSString* num;     // 个数
@property (nonatomic, assign)CGFloat peisongMoney; //配送费
@property (nonatomic, copy)NSString* TotalMoney;  // 统计
@property (nonatomic, strong)MerchantInformationModel *model;

@end
