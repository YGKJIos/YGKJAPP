//
//  PlaceOrderTableViewCell.m
//  一个APP
//
//  Created by 远古科技 on 16/8/10.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "PlaceOrderTableViewCell.h"
@implementation PlaceOrderTableViewCell

+(PlaceOrderTableViewCell *)createCell
{
    PlaceOrderTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"PlaceOrderTableViewCell" owner:nil options:nil]lastObject];
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
