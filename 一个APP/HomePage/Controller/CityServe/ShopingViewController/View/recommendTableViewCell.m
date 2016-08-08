//
//  recommendTableViewCell.m
//  一个APP
//
//  Created by 远古科技 on 16/7/23.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "recommendTableViewCell.h"

@implementation recommendTableViewCell

+ (recommendTableViewCell *) greateCell
{
    recommendTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"recommendTableViewCell" owner:nil options:nil]lastObject];
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
