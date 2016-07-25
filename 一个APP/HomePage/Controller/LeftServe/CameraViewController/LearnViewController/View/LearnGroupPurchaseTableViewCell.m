//
//  LearnGroupPurchaseTableViewCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/24.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "LearnGroupPurchaseTableViewCell.h"

@implementation LearnGroupPurchaseTableViewCell

+ (LearnGroupPurchaseTableViewCell *)createLearnGroupPurchaseCellNib
{
    LearnGroupPurchaseTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"LearnGroupPurchaseTableViewCell" owner:nil options:nil].lastObject;
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
