//
//  shopCollectionViewCell.m
//  一个APP
//
//  Created by 远古科技 on 16/7/16.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "shopCollectionViewCell.h"
//static NSString *hearUrl = @"http://139.129.209.189:8080/shangcheng";

@implementation shopCollectionViewCell

- (void)setShopCollectionModel:(ShopServeModel *)model
{
    self.nameLabel.text = model.shangjiaName;
    self.jieshaoLabel.text = model.shangjiaTongzhi;
    self.placeLabel.text = model.shangjiaWeizhi;
    
    NSString *url = [NSString stringWithFormat:@"%@%@",serverAddress,model.shangjiaTouxiang];
    [self.shopImage sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"zhanwei"]];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

@end
