//
//  FoodHomeCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/20.
//  Copyright © 2016年 llb. All rights reserved.
//

// 美食精选
#import "FoodHomeCell.h"
#import "HomeModelView.h"

static NSString *headUrl = @"http://192.168.1.88:8080/shangcheng";
@implementation FoodHomeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGFloat wid = (WIDTH -345) / 3;
        CGFloat boundsWid = 30 * WIDTH/375;
        for (int i = 0; i < 4; i++) {
            HomeModelView *view = [HomeModelView foodModelStyleView];
            view.frame = CGRectMake(boundsWid+i*(71+wid), 17,0,0);
            view.tag = 1000+i;
            [self.contentView addSubview:view];
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClickAction:)];
            [view addGestureRecognizer:tap];
        }
        
    }
    return self;
}

- (void)setFoodCellModel:(HomeModel *)model
{
    NSArray *tejiaArr = @[model.meishiTejia1,model.meishiTejia2,model.meishiTejia3,model.meishiTejia4];
    NSArray *jieshaoArr = @[model.meishiJieshao1,model.meishiJieshao2,model.meishiJieshao3,model.meishiJieshao4];
    NSArray *yuanjiaArr = @[model.meishiYuanjia1,model.meishiYuanjia2,model.meishiYuanjia3,model.meishiYuanjia4];
    NSArray *nameArr = @[model.meishiName1,model.meishiName2,model.meishiName3,model.meishiName4];
    NSArray *tupianArr = @[model.meishiTupian1,model.meishiTupian2,model.meishiTupian3,model.meishiTupian4];
    for (int i = 0; i < 4; i++) {
        HomeModelView *view = [self.contentView viewWithTag:1000+i];
        view.foodTitleLab.text = nameArr[i];
        NSString *url = [NSString stringWithFormat:@"%@%@",headUrl,tupianArr[i]];
        [view.foodImage sd_setImageWithURL:[NSURL URLWithString:url]];
        view.foodName.text = jieshaoArr[i];
        view.moneyLab.text = [NSString stringWithFormat:@"%@",tejiaArr[i]];
        view.costLab.text = yuanjiaArr[i];
    }
}


- (void)tapClickAction:(UITapGestureRecognizer *)tap
{
    [self.delegate foodHomePushDelegateMethod];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
