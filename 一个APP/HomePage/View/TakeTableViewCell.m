//
//  TakeTableViewCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/25.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "TakeTableViewCell.h"

@implementation TakeTableViewCell

+ (TakeTableViewCell *)CreateTakeOutCell
{
    TakeTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"TakeTableViewCell" owner:nil options:nil].lastObject;
    cell.xinLab.layer.masksToBounds = YES;
    cell.xinLab.layer.cornerRadius = 9;
    
    cell.jianLab.layer.masksToBounds = YES;
    cell.jianLab.layer.cornerRadius = 9;
    
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
