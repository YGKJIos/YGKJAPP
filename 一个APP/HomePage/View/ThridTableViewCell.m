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
    }else if (Style == newCellStyle)
    {
        [self newStyle];  // 实事新闻
    }else if (Style == hotJobCellStyle)
    {
        [self hotJobStyle];  // 热门招聘
    }else if (Style == travelCellStyle)
    {
        [self travelStyle]; // 周边畅游
    }else if (Style == secondCellStyle){
        [self secondStyle]; // 二手置换
    }
}
// 周边畅游
- (void)travelStyle{
    for (int i = 0; i < 3; i++) {
        HomeModelView *view = [HomeModelView travelModelStyleView];
        view.origin = CGPointMake(30+i*(90+25), 10);
        [self.contentView addSubview:view];
    }
}
// 生活服务
- (void)lifeServeStyle
{
    int num = 0;
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 3; j++) {
            HomeModelView *view = [[HomeModelView alloc]initWithFrame:CGRectMake(22+j*(107+8), 25+i*(95+15), 107, 95)];
            [view ordinaryModelStyle];
            view.tag = 1000+(num++);
            [view setUserInteractionEnabled:YES];
            //                imageView.backgroundColor = [UIColor redColor];
            [self.contentView addSubview:view];
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImageViewAction:)];
            //                tap.numberOfTapsRequired = 1;
            [view addGestureRecognizer:tap];
        }
    }
//    NSLog(@"%f",self.contentView.frame.size.width);
    self.posterImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 250, 375, 120)];
    [self.contentView addSubview:self.posterImage];
}
// 时事新闻
- (void)newStyle
{
    int num = 0;

    for (int i = 0; i < 2; i++) {
        HomeModelView *view = [[HomeModelView alloc]initWithFrame:CGRectMake(30+i*(140+40), 10, 140, 100)];
        [view ordinaryModelStyle];
        view.tag = 1000+(num++);
        [view setUserInteractionEnabled:YES];
        //                imageView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:view];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImageViewAction:)];
        //                tap.numberOfTapsRequired = 1;
        [view addGestureRecognizer:tap];
        
    }
    self.posterImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 116, 375, 120)];
    [self.contentView addSubview:self.posterImage];
}
// 热门招聘
- (void)hotJobStyle
{
    HomeModelView *liftView = [HomeModelView inviteModelStyleView];
    liftView.origin = CGPointMake(WIDTH/2-165, 15);
    liftView.size = CGSizeMake(150, 60);
    [self.contentView addSubview:liftView];
    
    
    HomeModelView *rightView = [HomeModelView inviteModelStyleView];
    rightView.origin = CGPointMake(WIDTH/2+15, 15);
    [self.contentView addSubview:rightView];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, rightView.y+rightView.height+15, WIDTH, 120)];
    imageView.image = [UIImage imageNamed:@"shouye_ershou"];
    [self.contentView addSubview:imageView];
}
// 二手置换
- (void)secondStyle{
    HomeModelView *leftView = [HomeModelView secondHandModelStyle];
    leftView.origin = CGPointMake(WIDTH/2-180, 10);
    [self.contentView addSubview:leftView];
    
    HomeModelView *rightView = [HomeModelView secondHandModelStyle];
    rightView.origin = CGPointMake(leftView.x+leftView.width+20, 10);
    [self.contentView addSubview:rightView];
}

- (void)tapImageViewAction:(UITapGestureRecognizer *)tap
{
    NSLog(@"222");
}

-(void)setThridCellImage:(NSArray *)images titles:(NSArray *)titles
{
    for (int i = 0; i < images.count-1; i++) {
        HomeModelView *view = [self.contentView viewWithTag:1000+i];
        [view setModelImageViewName:images[i] title:titles[i]];
        
    }
    self.posterImage.image = [UIImage imageNamed:[images lastObject]];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
