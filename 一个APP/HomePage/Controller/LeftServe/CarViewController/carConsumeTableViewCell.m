//
//  carConsumeTableViewCell.m
//  一个APP
//
//  Created by 远古科技 on 16/7/24.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "carConsumeTableViewCell.h"

@implementation carConsumeTableViewCell

+ (carConsumeTableViewCell *)greateCell
{
    carConsumeTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"carConsumeTableViewCell" owner:nil options:nil]lastObject];
    return cell;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
