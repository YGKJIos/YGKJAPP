//
//  MerchantModel.h
//  一个APP
//
//  Created by 梁立彬 on 16/7/25.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MerchantInformationModel : NSObject

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
@property (nonatomic, copy)NSString *tuangoujuanId;

// 家政服务
@property (nonatomic, copy)NSString *fuwuFanwei;
@property (nonatomic, copy)NSString *fuwuXiangmu;

// 热门招聘
@property (nonatomic, retain) NSString *qiuzhiXueli;
@property (nonatomic, retain) NSString *qiuzhiNianxian;
@property (nonatomic, retain) NSString *qiuzhiFuli;
@property (nonatomic, retain) NSString *shangjiaqiuzhizhaopinId;

// 二手置换
@property (nonatomic, retain) NSString *ershouShijian;
@property (nonatomic, retain) NSString *ershouDianhua;
@property (nonatomic, retain) NSString *ershouJiage;
@property (nonatomic, retain) NSString *shangjiaJuli;



@end
