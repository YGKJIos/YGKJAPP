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
    CGFloat wid = (WIDTH -315) / 3;
    CGFloat boundsWid = 35 * WIDTH/375;
    for (int i = 0; i < 3; i++) {
        HomeModelView *view = [HomeModelView travelModelStyleView];
        [view setUserInteractionEnabled:YES];
        view.tag = 3000+i;
        view.origin = CGPointMake(boundsWid+i*(90+wid), 10);
        [self.contentView addSubview:view];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(thridTapImageViewAction:)];
        [view addGestureRecognizer:tap];
    }
}
// 生活服务
- (void)lifeServeStyle
{
    int num = 0;
    CGFloat wid = (WIDTH -365) / 3;
    CGFloat boundsWid = 30 * WIDTH/375;
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 3; j++) {
            HomeModelView *view = [[HomeModelView alloc]initWithFrame:CGRectMake(boundsWid+j*(107+wid), 25+i*(95+15), 107, 95)];
            [view ordinaryModelStyle];
            view.tag = 1000+(num++);
            [view setUserInteractionEnabled:YES];
            [self.contentView addSubview:view];
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(thridTapImageViewAction:)];
            [view addGestureRecognizer:tap];
        }
    }
    self.posterImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 250, WIDTH, 120)];
    [self.contentView addSubview:self.posterImage];
}
// 时事新闻
- (void)newStyle
{
    HomeModelView *leftView = [[HomeModelView alloc]initWithFrame:CGRectMake(WIDTH/2-160, 10, 140, 100)];
    [leftView ordinaryModelStyle];
    leftView.tag = 2000;
    [leftView setUserInteractionEnabled:YES];
    [self.contentView addSubview:leftView];

    UITapGestureRecognizer *leftTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(thridTapImageViewAction:)];
    [leftView addGestureRecognizer:leftTap];
    
    HomeModelView *rightView = [[HomeModelView alloc]initWithFrame:CGRectMake(WIDTH/2+20, 10, 140, 100)];
    [rightView ordinaryModelStyle];
    rightView.tag = 2001;
    [rightView setUserInteractionEnabled:YES];
    [self.contentView addSubview:rightView];
    
    UITapGestureRecognizer *rightTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(thridTapImageViewAction:)];
    [rightView addGestureRecognizer:rightTap];
    
    self.posterImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 116, WIDTH, 120)];
    [self.contentView addSubview:self.posterImage];
}
// 热门招聘
- (void)hotJobStyle
{
    HomeModelView *leftView = [HomeModelView inviteModelStyleView];
    leftView.tag = 4000;
    leftView.origin = CGPointMake(WIDTH/2-165, 15);
    leftView.size = CGSizeMake(150, 60);
    [self.contentView addSubview:leftView];
    
    HomeModelView *rightView = [HomeModelView inviteModelStyleView];
    rightView.tag = 4001;
    rightView.origin = CGPointMake(WIDTH/2+15, 15);
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
    leftView.origin = CGPointMake(WIDTH/2-180, 10);
    [self.contentView addSubview:leftView];
    
    HomeModelView *rightView = [HomeModelView secondHandModelStyle];
    leftView.tag = 5001;
    rightView.origin = CGPointMake(leftView.x+leftView.width+20, 10);
    
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
    NSLog(@"%ld",image.tag);
}

-(void)setThridCellImage:(NSArray *)images titles:(NSArray *)titles
{
    // 生活服务
    if (self.style == lifeServeCellStyle) {
        for (int i = 0; i < images.count-1; i++) {
            HomeModelView *view = [self.contentView viewWithTag:1000+i];
            [view setModelImageViewName:images[i] title:titles[i]];
        }
        self.posterImage.image = [UIImage imageNamed:[images lastObject]];
    }
    // 新闻添加图片
    if (self.style == newCellStyle) {
        for (int i = 0; i < images.count-1; i++) {
            HomeModelView *view = [self.contentView viewWithTag:2000+i];
            [view setModelImageViewName:images[i] title:titles[i]];
        }
        self.posterImage.image = [UIImage imageNamed:[images lastObject]];
    }
    // 周边畅游
    if (self.style == travelCellStyle) {
        for (int i = 0; i < images.count-1; i++) {
            HomeModelView *view = [self.contentView viewWithTag:3000+i];
            [view setModelImageViewName:images[i] title:titles[i]];
        }
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
