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
static NSString *yuming = @"http://192.168.1.88:8080/shangcheng/";

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
    self.shopNameLab.text = model.shangjiaName;
    self.favorableLab.text = model.shangjiaTongzhi;
    NSString *priceStr = [NSString stringWithFormat:@"%@¥", model.shangjiaJiage];
    self.priceLab.text = priceStr;
    NSString *distanceStr = [NSString stringWithFormat:@"%@m",model.shangjiaJuli];
    self.distanceLab.text = distanceStr;
    NSString *str = [NSString stringWithFormat:@"%@%@", yuming, model.shangjiaTouxiang];
    [self.shopImage sd_setImageWithURL:[NSURL URLWithString:str]];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
