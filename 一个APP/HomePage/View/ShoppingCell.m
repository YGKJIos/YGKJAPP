//
//  ShoppingCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/21.
//  Copyright © 2016年 llb. All rights reserved.
//

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
        
        UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(25, 5, WIDTH-50, 70)];
        bgView.backgroundColor = BGcolor(173, 224, 231);
        [self.contentView addSubview:bgView];
        
        self.leftImage = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH/2-161, 10, 121, 51)];
        self.leftImage.image = [UIImage imageNamed:@"shouye_xpfs"];
        [bgView addSubview:self.leftImage];
        
        self.rightImage = [[UIImageView alloc]initWithFrame:CGRectMake(self.leftImage.x+self.leftImage.width+35, 10, 121, 51)];
        self.rightImage.image = [UIImage imageNamed:@"shouye_ppmz"];
        [bgView addSubview:self.rightImage];
        
        for (int i = 0; i < 4; i++) {
            HomeModelView *view = [[HomeModelView alloc]initWithFrame:CGRectMake(25+(70+15)*i, bgView.y+bgView.height+10, 70, 110)];
            [view ordinaryModelStyle];
            view.tag = 1000+i;
            [self.contentView addSubview:view];
        }
    }
    self.imgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.imgBtn.backgroundColor = arcColor;
    self.imgBtn.frame = CGRectMake(0, 200, WIDTH, 120);
    [self.contentView addSubview:self.imgBtn];
    return self;
}

-(void)setShoppingCellImage:(NSArray *)images
{
    self.leftImage.image = [UIImage imageNamed:images[0]];
    self.rightImage.image = [UIImage imageNamed:images[1]];
    for (int i = 2; i < 6; i++) {
        HomeModelView *view = [self.contentView viewWithTag:1000+i-2];
        [view setModelImageViewName:images[i] title:@""];
        
    }
    [self.imgBtn setBackgroundImage:[UIImage imageNamed:[images lastObject]] forState:UIControlStateNormal];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
