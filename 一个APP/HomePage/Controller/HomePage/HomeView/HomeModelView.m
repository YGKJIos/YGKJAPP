//
//  HomeModelView.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/17.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "HomeModelView.h"
static NSString *headUrl = @"http://192.168.1.88:8080/shangcheng/";

@interface HomeModelView ()
@end

@implementation HomeModelView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

// 美食精选
- (void)foodModelStyleView
{
    // 
    self.foodTitleLab = [[UILabel alloc]init];
    self.foodTitleLab.frame = CGRectMake(0, 0, self.width, 20);
    [self addSubview:self.foodTitleLab];
    self.foodTitleLab.textColor = BGcolor(109, 109, 109);
    self.foodTitleLab.font = [UIFont systemFontOfSize:14];
    self.foodTitleLab.textAlignment = NSTextAlignmentCenter;
    
    // 美食图片
    self.foodImage = [[UIImageView alloc]init];
    self.foodImage.frame = CGRectMake(0, self.foodTitleLab.height, self.width, 70);
    [self addSubview:self.foodImage];
    
    self.foodName = [[UILabel alloc]init];
    self.foodName.frame = CGRectMake(0, 90, self.width, 20);
    [self addSubview:self.foodName];
    self.foodName.textColor = BGcolor(109, 109, 109);
    self.foodName.font = [UIFont systemFontOfSize:12];
    self.foodName.textAlignment = NSTextAlignmentLeft;
    
    self.moneyLab = [[UILabel alloc]init];
    self.moneyLab.frame = CGRectMake(0, 110, 40, 20);
    [self addSubview:self.moneyLab];
    self.moneyLab.textColor = [UIColor redColor];
    self.moneyLab.font = [UIFont systemFontOfSize:12];
    
    self.costLab = [[UILabel alloc]init];
    self.costLab.frame = CGRectMake(40, 110, 40, 20);
    [self addSubview:self.costLab];
    self.costLab.textColor = BGcolor(109, 109, 109);
    self.costLab.font = [UIFont systemFontOfSize:12];
    
    UIView *line = [[UIView alloc]initWithFrame:self.costLab.frame];
    line.height = 1;
    line.width = 20;
    line.centerX = self.costLab.centerX;
    line.centerY = self.costLab.centerY;
    
    line.backgroundColor= BGcolor(109, 109, 109);
    line.transform = CGAffineTransformMakeRotation(M_PI_4/2);
    [self addSubview:line];
}

// 畅游周边 view
+ (HomeModelView *)travelModelStyleView
{
    HomeModelView *view = [[NSBundle mainBundle]loadNibNamed:@"HomeModelView" owner:nil options:nil][1];
    return view;
}
// 招聘
+ (HomeModelView *)inviteModelStyleView
{
    HomeModelView *view = [[NSBundle mainBundle]loadNibNamed:@"HomeModelView" owner:nil options:nil][2];
        return view;
}
// 普通样式
- (void)ordinaryModelStyle
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    self.imageV = imageView;
    [self addSubview:imageView];
    
    self.titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, imageView.height + 5, imageView.width, 20)];
    self.titleLab.textAlignment = NSTextAlignmentCenter;
    self.titleLab.textColor = BGcolor(109, 109, 109);
    self.titleLab.font = [UIFont systemFontOfSize:12];
    [self addSubview:self.titleLab];

}
- (void)setModelImageViewName:(NSString *)image title:(NSString *)title
{
//    self.imageV.image = [UIImage imageNamed:image];
    NSString *imageUrl = [NSString stringWithFormat:@"%@%@",headUrl,image];
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
    self.titleLab.text = title;
}

// 二手置换
+ (HomeModelView *)secondHandModelStyle
{
    HomeModelView *view = [[NSBundle mainBundle]loadNibNamed:@"HomeModelView" owner:nil options:nil][3];
    return view;
}


@end
