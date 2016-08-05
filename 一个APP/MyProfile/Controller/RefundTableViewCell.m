//
//  RefundTableViewCell.m
//  一个APP
//
//  Created by 远古科技 on 16/7/30.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "RefundTableViewCell.h"

@implementation RefundTableViewCell


+ (RefundTableViewCell *)createCell
{
    RefundTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"RefundTableViewCell" owner:nil options:nil]lastObject];
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
