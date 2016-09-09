//
//  HomeModelView.h
//  一个APP
//
//  Created by 梁立彬 on 16/6/17.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MarketModel.h"

typedef enum
{
    foodModelStyle,  // 美食风格
    ordinaryModelStyle, // 普通风格
    travelModelStyle,  // 畅游周边
    inviteModelStyle  // 热门招聘
    
}ViewStyle;

@interface HomeModelView : UIView
/**
 *  普通
 */
@property (nonatomic, strong)UIImageView *imageV;
@property (nonatomic, strong)UILabel *titleLab;
/**
 *  美食
 */
@property (weak, nonatomic) IBOutlet UILabel *foodTitleLab;
@property (weak, nonatomic) IBOutlet UIImageView *foodImage;
@property (weak, nonatomic) IBOutlet UILabel *foodName;
@property (weak, nonatomic) IBOutlet UILabel *moneyLab;
@property (weak, nonatomic) IBOutlet UILabel *textLab;
@property (weak, nonatomic) IBOutlet UILabel *costLab; // 原价钱


/**
 *旅游
 */
@property (weak, nonatomic) IBOutlet UIImageView *travelImage;
@property (weak, nonatomic) IBOutlet UIImageView *travelType;
@property (weak, nonatomic) IBOutlet UILabel *travelNameLab;  //景点名称
@property (weak, nonatomic) IBOutlet UILabel *travelMoneyLab;
@property (weak, nonatomic) IBOutlet UIImageView *travelLocation;
@property (weak, nonatomic) IBOutlet UILabel *distanceLab;

/**
 *  热门招聘/Users/yg///Users/yg/Desktop/YGKJAPP/一个APP/HomePage/Controller/HomePage/HomeView/HomeModelView.xibUsers/yg/Desktop/YGKJAPP/一个APP/HomePage/Controller/HomePage/HomeView/HomeModelView.xibDesktop/YGKJAPP/一个APP/HomePage/Controller/HomePage/HomeView/HomeModelView.xib
 */
@property (weak, nonatomic) IBOutlet UILabel *invitePost; //邀请岗位
@property (weak, nonatomic) IBOutlet UILabel *companyName; // 公司名称
@property (weak, nonatomic) IBOutlet UILabel *inviteLocation;//地理位子
@property (weak, nonatomic) IBOutlet UILabel *inviteMoneyLab; //工资
@property (weak, nonatomic) IBOutlet UIImageView *locationImage; //定位图片
@property (weak, nonatomic) IBOutlet UIImageView *agreeimage; //已认证图片

// 二手置换
@property (weak, nonatomic) IBOutlet UIImageView *secondImage;
@property (weak, nonatomic) IBOutlet UILabel *secondName;
@property (weak, nonatomic) IBOutlet UILabel *secondMoney;


+ (HomeModelView *)foodModelStyleView;  //美食View

+ (HomeModelView *)travelModelStyleView; // 旅游View

+ (HomeModelView *)inviteModelStyleView; //热门招聘

- (void)ordinaryModelStyle;  // 普通风格

+ (HomeModelView *)secondHandModelStyle; //二手置换

//- (void)setModelViewStyle:(ViewStyle)style; // 页面的风格
- (void)setModelImageViewName:(NSString *)image title:(NSString *)title;


@end
