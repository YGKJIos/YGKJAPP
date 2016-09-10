//
//  ThridTableViewCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/18.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "ThridTableViewCell.h"
#import "HomeModelView.h"

@interface ThridTableViewCell ()
@property (nonatomic, strong)UIImageView *posterImage;

@end

@implementation ThridTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

- (void)cellStyle:(HomeTaleViewCellStyle)Style
{
    if (Style == lifeServeCellStyle) {
        [self lifeServeStyle]; // 生活
        self.style = Style;
    }else if (Style == newCellStyle)
    {
        [self newStyle];  // 实事新闻
        self.style = Style;
    }else if (Style == hotJobCellStyle)
    {
        [self hotJobStyle];  // 热门招聘
        self.style = Style;
    }else if (Style == travelCellStyle)
    {
        [self travelStyle]; // 周边畅游
        self.style = Style;
    }else if (Style == secondCellStyle){
        [self secondStyle]; // 二手置换
        self.style = Style;
    }
}
// 周边畅游
- (void)travelStyle{
    CGFloat wid = (WIDTH -(3 * 90)) / 4;
    for (int i = 0; i < 3; i++) {
        HomeModelView *view = [HomeModelView travelModelStyleView];
        view.frame = CGRectMake((wid+i*(90+wid)), 10 ,90 , 102 );
        [view setUserInteractionEnabled:YES];
        view.tag = 3000+i;
        [self.contentView addSubview:view];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(thridTapImageViewAction:)];
        [view addGestureRecognizer:tap];
    }
}
// 生活服务
- (void)lifeServeStyle
{
    int num = 0;
    CGFloat wid = (WIDTH -((107*WIDTH/375)*3)) / 4;
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 3; j++) {
            HomeModelView *view = [[HomeModelView alloc]initWithFrame:CGRectMake(wid+j*(107*WIDTH/375+wid), 10+i*120, 107*WIDTH/375, 95*HEIGHT/667)];
            [view ordinaryModelStyle];
            view.tag = 1000+(num++);
            [view setUserInteractionEnabled:YES];
            [self.contentView addSubview:view];
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(thridTapImageViewAction:)];
            [view addGestureRecognizer:tap];
            
        }
    }
    self.posterImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 245, WIDTH, 120)];
    [self.contentView addSubview:self.posterImage];
    
}
// 时事新闻
- (void)newStyle
{
    CGFloat wid = (WIDTH - 140 *2)/3;
    HomeModelView *leftView = [[HomeModelView alloc]initWithFrame:CGRectMake(wid, 10, 140, 90)];
    [leftView ordinaryModelStyle];
    leftView.tag = 2000;
    [leftView setUserInteractionEnabled:YES];
    [self.contentView addSubview:leftView];

    UITapGestureRecognizer *leftTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(thridTapImageViewAction:)];
    [leftView addGestureRecognizer:leftTap];
    
    HomeModelView *rightView = [[HomeModelView alloc]initWithFrame:CGRectMake(wid*2+140, 10, 140, 90)];
    [rightView ordinaryModelStyle];
    rightView.tag = 2001;
    [rightView setUserInteractionEnabled:YES];
    [self.contentView addSubview:rightView];
    
    UITapGestureRecognizer *rightTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(thridTapImageViewAction:)];
    [rightView addGestureRecognizer:rightTap];
    
    self.posterImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 135, WIDTH, 106)];
    [self.contentView addSubview:self.posterImage];
}
// 热门招聘
- (void)hotJobStyle
{
    HomeModelView *leftView = [HomeModelView inviteModelStyleView];
    leftView.tag = 4000;
    leftView.origin = CGPointMake(WIDTH/2-165*WIDTH/375, 15);
    leftView.size = CGSizeMake(150*WIDTH/375, 60*HEIGHT/667);
    [self.contentView addSubview:leftView];
    
    HomeModelView *rightView = [HomeModelView inviteModelStyleView];
    rightView.tag = 4001;
    rightView.origin = CGPointMake(WIDTH/2+15*WIDTH/375, 15);
    rightView.size = CGSizeMake(150*WIDTH/375, 60*HEIGHT/667);
    [self.contentView addSubview:rightView];
    
    UITapGestureRecognizer *liftTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(thridTapImageViewAction:)];
    [leftView addGestureRecognizer:liftTap];
    
    UITapGestureRecognizer *rightTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(thridTapImageViewAction:)];
    [rightView addGestureRecognizer:rightTap];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, rightView.y+rightView.height+15, WIDTH, 120)];
    imageView.image = [UIImage imageNamed:@"shouye_ershou"];
    [self.contentView addSubview:imageView];
}
// 二手置换
- (void)secondStyle{
    HomeModelView *leftView = [HomeModelView secondHandModelStyle];
    leftView.tag = 5000;
    CGFloat wid = ((375 -(2 * 170)) / 3 * WIDTH / 375);
    leftView.frame = CGRectMake(wid, 10 * HEIGHT / 667, 170 * WIDTH / 375, 110 * HEIGHT / 667);
    [self.contentView addSubview:leftView];
    
    HomeModelView *rightView = [HomeModelView secondHandModelStyle];
    rightView.tag = 5001;
    rightView.frame = CGRectMake(leftView.x+leftView.width +wid, 10 * HEIGHT / 667, 170 * WIDTH / 375, 110 * HEIGHT / 667);
    UITapGestureRecognizer *liftTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(thridTapImageViewAction:)];
    [leftView addGestureRecognizer:liftTap];
    
    UITapGestureRecognizer *rightTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(thridTapImageViewAction:)];
    [rightView addGestureRecognizer:rightTap];
    
    [self.contentView addSubview:rightView];
}

- (void)thridTapImageViewAction:(UITapGestureRecognizer *)tap
{
    UIImageView *image = (UIImageView *)tap.view;
    [self.delegte ThridPushViewControllerNum:image.tag];
}

-(void)setThridCellHomeModel:(HomeModel *)model
{
    // 生活服务
    if (self.style == lifeServeCellStyle) {
        NSArray *arr = @[@"shouye_qcfw",@"shouye_tcly",@"shouye_syxz",@"shouye_hqff",@"shouye_xxpx",@"shouye_yhfw",@"shouye_xinwen"];
        for (int i = 0; i < arr.count-1; i++) {
            HomeModelView *view = (HomeModelView *)[self.contentView viewWithTag:1000+i];
            view.imageV.image = [UIImage imageNamed:arr[i]];
        }
        self.posterImage.image = [UIImage imageNamed:[arr lastObject]];
    }
    // 新闻添加图片
    if (self.style == newCellStyle) {
        NSArray *arr = @[model.xinwenTupian1,model.xinwenTupian2,@"shouye_meishitou"];
        NSArray *titles = @[model.xinwenName1, model.xinwenName2];
        for (int i = 0; i < titles.count; i++) {
            HomeModelView *view = [self.contentView viewWithTag:2000+i];
            NSString *url = [NSString stringWithFormat:@"%@%@",serverAddress,arr[i]];
            [view.imageV sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"zhanweitouxiang"]];
            view.titleLab.text = titles[i];
        }
        self.posterImage.image = [UIImage imageNamed:[arr lastObject]];
    }
    // 周边畅游
    if (self.style == travelCellStyle) {
        NSArray *jiage = @[model.zhoubianJiage1,model.zhoubianJiage2,model.zhoubianJiage3];
        NSArray *names = @[model.zhoubianName1,model.zhoubianName2,model.zhoubianName3];
        NSArray *juli = @[model.zhoubianJuli1,model.zhoubianJuli2,model.zhoubianJuli3];
        NSArray *images = @[model.zhoubianTupian1,model.zhoubianTupian2,model.zhoubianTupian3];
        
        for (int i = 0; i < images.count; i++) {
            HomeModelView *view = (HomeModelView *)[self.contentView viewWithTag:3000+i];
            NSString *urlStr = [NSString stringWithFormat:@"%@%@",serverAddress,images[i]];
            [view.travelImage sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:@"zhanweitouxiang"]];
            view.travelImage.opaque = YES;
            view.travelNameLab.text = names[i];
            view.travelMoneyLab.text = [NSString stringWithFormat:@"%@",jiage[i]];
            view.distanceLab.text = juli[i];
        }
    }
    // 热门招聘
    if (self.style == hotJobCellStyle) {
        HomeModelView *liftView = (HomeModelView *)[self.contentView viewWithTag:4000];
        liftView.invitePost.text = model.zhaopinZhiwei1;
        liftView.companyName.text = model.zhaopinGongsi1;
        liftView.inviteLocation.text = model.zhaopinWeizhi1;
        liftView.inviteMoneyLab.text = model.zhaopinJiage1;
        
        HomeModelView *rightView = (HomeModelView *)[self.contentView viewWithTag:4001];
        rightView.invitePost.text = model.zhaopinZhiwei2;
        rightView.companyName.text = model.zhaopinGongsi2;
        rightView.inviteLocation.text = model.zhaopinWeizhi2;
        rightView.inviteMoneyLab.text = model.zhaopinJiage2;
        
    }
    // 二手置换
    if (self.style == secondCellStyle) {
        
        HomeModelView *liftView = (HomeModelView *)[self.contentView viewWithTag:5000];
        NSString *leftUrl = [NSString stringWithFormat:@"%@%@", serverAddress,model.ershouTupian1];
        [liftView.secondImage sd_setImageWithURL:[NSURL URLWithString:leftUrl] placeholderImage:[UIImage imageNamed:@"zhanweitouxiang"]];
        liftView.secondName.text = model.ershouName1;
        liftView.secondMoney.text = model.ershouJiage1;
        
        HomeModelView *rightView = (HomeModelView *)[self.contentView viewWithTag:5001];
        NSString *rightUrl = [NSString stringWithFormat:@"%@%@",serverAddress,model.ershouTupian2];
        [rightView.secondImage sd_setImageWithURL:[NSURL URLWithString:rightUrl] placeholderImage:[UIImage imageNamed:@"zhanweitouxiang"]];
        rightView.secondName.text = model.ershouName2;
        rightView.secondMoney.text = model.ershouJiage2;
    }
}


@end
