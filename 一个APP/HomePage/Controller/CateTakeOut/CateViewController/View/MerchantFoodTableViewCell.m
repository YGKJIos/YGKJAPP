//
//  MerchantFoodTableViewCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/21.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "MerchantFoodTableViewCell.h"

@implementation MerchantFoodTableViewCell

+ (MerchantFoodTableViewCell *)CreateMerchantFoodNib
{
    MerchantFoodTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"MerchantFoodTableViewCell" owner:nil options:nil].lastObject;
    UIView *line = [[UIView alloc]init];
    line.x = cell.originalMoneyLab.x;
    line.y = cell.originalMoneyLab.y+6;
    line.width = 20;
    line.height = 1;
    line.backgroundColor = BGcolor(192, 192, 192);
    line.transform = CGAffineTransformMakeRotation(M_PI_4/2);
    [cell.contentView addSubview:line];
    return cell;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
