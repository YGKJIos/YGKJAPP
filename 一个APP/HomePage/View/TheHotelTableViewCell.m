//
//  TheHotelTableViewCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/25.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "TheHotelTableViewCell.h"

@implementation TheHotelTableViewCell

+ (TheHotelTableViewCell *)createTheHotelCell
{
    TheHotelTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"TheHotelTableViewCell" owner:nil options:nil].lastObject;
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
