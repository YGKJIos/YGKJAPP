//
//  GameTableViewCell.m
//  一个APP
//
//  Created by 远古科技 on 16/6/27.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "GameTableViewCell.h"

@implementation GameTableViewCell


+ (GameTableViewCell *) createGameCell
{
    GameTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"GameTableViewCell" owner:nil options:nil] lastObject];
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
