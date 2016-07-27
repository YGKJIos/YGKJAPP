//
//  voucherTableViewCell.m
//  一个APP
//
//  Created by 远古科技 on 16/7/25.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "voucherTableViewCell.h"

@implementation voucherTableViewCell

+ (voucherTableViewCell *)greateCell
{
    voucherTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"voucherTableViewCell" owner:nil options:nil]lastObject];
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
