//
//  MoiveTableViewCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/25.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "MoiveTableViewCell.h"

@implementation MoiveTableViewCell

+ (MoiveTableViewCell *)createMoiveCell
{
    MoiveTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"MoiveTableViewCell" owner:nil options:nil].lastObject;
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
