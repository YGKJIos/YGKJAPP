//
//  SecondDetailTableViewCell.m
//  一个APP
//
//  Created by 远古科技 on 16/7/27.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "SecondDetailTableViewCell.h"

@implementation SecondDetailTableViewCell


+ (SecondDetailTableViewCell *)createCell
{
    SecondDetailTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"SecondDetailTableViewCell" owner:nil options:nil]lastObject];
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
