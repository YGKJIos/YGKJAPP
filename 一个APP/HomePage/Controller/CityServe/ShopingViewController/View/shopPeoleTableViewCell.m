//
//  shopPeoleTableViewCell.m
//  一个APP
//
//  Created by 远古科技 on 16/7/22.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "shopPeoleTableViewCell.h"

@implementation shopPeoleTableViewCell


+ (shopPeoleTableViewCell *)greateCell
{
    shopPeoleTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"shopPeoleTableViewCell" owner:nil options:nil]lastObject];
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
