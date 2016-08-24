//
//  SupermarketCollectionViewCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/27.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "SupermarketCollectionViewCell.h"

static NSString *bendi = @"http://192.168.1.88:8080/shangcheng";
static NSString *headUrl = @"http://139.129.209.189:8080/shangcheng/";

@implementation SupermarketCollectionViewCell
+ (SupermarketCollectionViewCell *)createMoiveCell
{
    SupermarketCollectionViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"SupermarketCollectionViewCell" owner:nil options:nil].lastObject;
    return cell;
}
- (void) ZGP_SuperMarketModel:(ZGP_SuperMarketModel *)model
{
    NSString *imageStr = [NSString stringWithFormat:@"%@%@", bendi, model.shangjiaTouxiang];
    [self.commodityImage sd_setImageWithURL:[NSURL URLWithString:imageStr]];
    // 商品名字
    self.describeLab.text = model.shangjiaName;
    // 商品重量
    self.qualityLab.text = @"500g";
    self.moneyLab.text = model.qisongjia;
  
}


- (void)awakeFromNib {
    // Initialization code
}

@end
