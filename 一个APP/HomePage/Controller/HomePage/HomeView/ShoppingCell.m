//
//  ShoppingCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/21.
//  Copyright © 2016年 llb. All rights reserved.
//

// 嗨购专场 的cell
#import "ShoppingCell.h"
#import "HomeModelView.h"
@interface ShoppingCell ()

@property (nonatomic, strong)UIImageView *leftImage;
@property (nonatomic, strong)UIImageView *rightImage;
@property (nonatomic, strong)UIButton *imgBtn;

@end

@implementation ShoppingCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGFloat wid = (WIDTH -(4 * 70)) / 5;
        UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(wid, 10, WIDTH - wid*2, 70* HEIGHT / 667)];
        bgView.backgroundColor = BGcolor(173, 224, 231);
        [self.contentView addSubview:bgView];
        
        self.leftImage = [UIImageView newAutoLayoutView];
        [bgView addSubview:self.leftImage];
        self.leftImage.userInteractionEnabled = YES;
        [self.leftImage autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:20* WIDTH/375];
        [self.leftImage autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
        [self.leftImage autoSetDimensionsToSize:CGSizeMake(121* WIDTH/375, 51*HEIGHT/667)];
        UITapGestureRecognizer *leftTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClickAction)];
        [self.leftImage addGestureRecognizer:leftTap];
        
        self.rightImage = [UIImageView newAutoLayoutView];
        self.rightImage.userInteractionEnabled = YES;
        [bgView addSubview:self.rightImage];
        [self.rightImage autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:20* WIDTH/375];
        [self.rightImage autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
        [self.rightImage autoSetDimensionsToSize:CGSizeMake(121*WIDTH/375, 51*HEIGHT/667)];
        UITapGestureRecognizer *rightTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClickAction)];
        [self.rightImage addGestureRecognizer:rightTap];
        
        for (int i = 0; i < 4; i++) {
            HomeModelView *view = [[HomeModelView alloc]initWithFrame:CGRectMake(wid + i * (70 + wid), bgView.y + bgView.height + 15, 70, 100)];
            [view ordinaryModelStyle];
            view.tag = 1000+i;
            [self.contentView addSubview:view];
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClickAction)];
            [view addGestureRecognizer:tap];
        }
        self.imgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.imgBtn.backgroundColor = arcColor;
        self.imgBtn.frame = CGRectMake(0, 215, WIDTH, 120);
        [self.contentView addSubview:self.imgBtn];
    }
    
    return self;
}

-(void)setShoppingCellImage:(NSArray *)images
{
    self.leftImage.image = [UIImage imageNamed:images[0]];
    self.rightImage.image = [UIImage imageNamed:images[1]];
    for (int i = 2; i < 6; i++) {
        HomeModelView *view = [self.contentView viewWithTag:1000+i-2];
        view.imageV.image = [UIImage imageNamed:images[i]];
        
    }
    [self.imgBtn setBackgroundImage:[UIImage imageNamed:[images lastObject]] forState:UIControlStateNormal];
    
}
- (void)tapClickAction
{
    [self.delegate shopingPushDelegateMethod];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
