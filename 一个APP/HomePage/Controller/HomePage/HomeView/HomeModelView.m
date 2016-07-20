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
+ (HomeModelView *)foodModelStyleView
{
    HomeModelView *view = [[NSBundle mainBundle]loadNibNamed:@"HomeModelView" owner:nil options:nil].firstObject;
//    view.size = CGSizeMake(70, 124);
    UILabel *lineLab = [[UILabel alloc]init];
    lineLab.x = 40;
    lineLab.height = 1;
    lineLab.width = 8;
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
// 招聘
+ (HomeModelView *)inviteModelStyleView
{
    HomeModelView *view = [[NSBundle mainBundle]loadNibNamed:@"HomeModelView" owner:nil options:nil][2];
        return view;
}
// 普通样式
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
