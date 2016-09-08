//
//  PleaseJobModel.h
//  一个APP
//
//  Created by 梁立彬 on 16/9/1.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "MerchantInformationModel.h"

@interface PleaseJobModel : MerchantInformationModel

@property (nonatomic, copy)NSString *zhaopinxinxiId;
@property (nonatomic, copy)NSString *zhaopinZhiwei;
@property (nonatomic, copy)NSString *zhaopinXinzi;
@property (nonatomic, copy)NSString *zhaopinXueli;
@property (nonatomic, copy)NSString *zhaopinGongzuojingyan;
@property (nonatomic, copy)NSString *zhaopinFuli;
@property (nonatomic, copy)NSString *zhaopinZhiweimiaoshu;
@property (nonatomic, copy)NSString *zhaopinFabushijian;
@property (nonatomic, strong) NSString *zhaopinShijian;
@property (nonatomic, strong) NSString *zhaopinGongsijianjie;

@end
