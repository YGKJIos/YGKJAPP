//
//  MarketCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/6.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "MarketCell.h"
#define Xwidth self.shopNameLab.frame.origin.x + self.shopNameLab.frame.size.width
#define Xheight (self.shopNameLab.frame.origin.y + self.shopNameLab.frame.size.height ) /2

@implementation MarketCell
+(MarketCell *)cellCreaterNibLoad
{
    MarketCell *cell = [[NSBundle mainBundle]loadNibNamed:@"MarketCell" owner:nil options:nil].lastObject;
    return cell;
}

-(void)marketModel:(MarketModel *)model
{
    for (int i = 0; i < 5; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((Xwidth +5) +(i * 10), Xheight+10, 10, 10)];
        imageView.image = [UIImage imageNamed:@"xinghuang"];
        [self.contentView addSubview:imageView];
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
