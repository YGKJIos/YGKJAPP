//
//  HomeModelView.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/17.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "HomeModelView.h"

@interface HomeModelView ()

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
 *  热门招聘
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


@end

@implementation HomeModelView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

+ (HomeModelView *)foodModelStyleView
{
    HomeModelView *view = [[NSBundle mainBundle]loadNibNamed:@"HomeModelView" owner:nil options:nil].firstObject;
    UILabel *lineLab = [[UILabel alloc]init];
    lineLab.frame = view.costLab.frame;
    lineLab.height = 1;
    lineLab.y = view.costLab.y+4;
    lineLab.backgroundColor = BGcolor(180, 180, 180);
    lineLab.transform = CGAffineTransformMakeRotation(M_PI_4/2);
    [view  addSubview:lineLab];
    
    return view;
}
// 畅游周边 view
+ (HomeModelView *)travelModelStyleView
{
    HomeModelView *view = [[NSBundle mainBundle]loadNibNamed:@"HomeModelView" owner:nil options:nil][1];
    return view;
}
+ (HomeModelView *)inviteModelStyleView
{
    HomeModelView *view = [[NSBundle mainBundle]loadNibNamed:@"HomeModelView" owner:nil options:nil][2];
        return view;
}
- (void)ordinaryModelStyle
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height-20)];
    self.imageV = imageView;
    [self addSubview:imageView];
    
    self.titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, imageView.height, imageView.width, 20)];
    self.titleLab.textAlignment = NSTextAlignmentCenter;
    self.titleLab.textColor = BGcolor(109, 109, 109);
    self.titleLab.font = [UIFont systemFontOfSize:12];
    [self addSubview:self.titleLab];

}
- (void)setModelImageViewName:(NSString *)image title:(NSString *)title
{
    self.imageV.image = [UIImage imageNamed:image];
    self.titleLab.text = title;
}

// 二手置换
+ (HomeModelView *)secondHandModelStyle
{
    HomeModelView *view = [[NSBundle mainBundle]loadNibNamed:@"HomeModelView" owner:nil options:nil][3];
    return view;
}


@end
