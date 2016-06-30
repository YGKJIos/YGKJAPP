//
//  HouseTableViewCell.m
//  一个APP
//
//  Created by 远古科技 on 16/6/30.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "HouseTableViewCell.h"

@implementation HouseTableViewCell

+ (HouseTableViewCell *) createHouseCell
{
    HouseTableViewCell *houseCell = [[[NSBundle mainBundle]loadNibNamed:@"HouseTableViewCell" owner:nil options:nil]lastObject];
    return houseCell;
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
