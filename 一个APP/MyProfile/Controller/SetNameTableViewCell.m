//
//  SetNameTableViewCell.m
//  一个APP
//
//  Created by 远古科技 on 16/7/29.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "SetNameTableViewCell.h"

@implementation SetNameTableViewCell


+ (SetNameTableViewCell *)createCell
{
    SetNameTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"SetNameTableViewCell" owner:nil options:nil]lastObject];
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
