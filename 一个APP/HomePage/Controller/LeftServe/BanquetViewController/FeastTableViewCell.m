//
//  FeastTableViewCell.m
//  一个APP
//
//  Created by 远古科技 on 16/7/4.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "FeastTableViewCell.h"

@implementation FeastTableViewCell


+ (FeastTableViewCell *) creactFeastCell
{
    FeastTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"FeastTableViewCell" owner:nil options:nil]lastObject];
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
