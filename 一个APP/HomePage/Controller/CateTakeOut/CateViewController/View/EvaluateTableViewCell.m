//
//  EvaluateTableViewCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/23.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "EvaluateTableViewCell.h"

@implementation EvaluateTableViewCell

+ (EvaluateTableViewCell *)CreateEvaluateCellNib
{
    EvaluateTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"EvaluateTableViewCell" owner:nil options:nil].lastObject;
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
