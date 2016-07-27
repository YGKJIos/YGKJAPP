//
//  MerchantModel.h
//  一个APP
//
//  Created by 梁立彬 on 16/7/25.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MerchantModel : NSObject

@property (nonatomic, copy)NSString *shangjiaId;
@property (nonatomic, copy)NSString *shangjiaName;
@property (nonatomic, copy)NSString *shangjiaTongzhi;
@property (nonatomic, copy)NSString *shangjiaWeizhi;
@property (nonatomic, copy)NSString *shangjiaDianhua;
@property (nonatomic, copy)NSString *shangjiaPingfen;
@property (nonatomic, copy)NSString *shangjiaTouxiang;
@property (nonatomic, copy)NSString *shangjiaLeixing;
@property (nonatomic, copy)NSString *shangjiaYingyeshijian;

// 团购券
@property (nonatomic, copy)NSString *tuangouName;
@property (nonatomic, copy)NSString *tuangouYuanjia;
@property (nonatomic, copy)NSString *tuangouTejia;
@property (nonatomic, copy)NSString *tuangouShuoming;
@property (nonatomic, copy)NSString *tuangouTouxiang;


@end
