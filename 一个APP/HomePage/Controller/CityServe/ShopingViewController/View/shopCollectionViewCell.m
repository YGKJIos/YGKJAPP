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
    
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",model.shangjiaWeizhi]];
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    // 表情图片
    attch.image = [UIImage imageNamed:@"gouwu_13"];
    attch.bounds = CGRectMake(0, 0, 8, 8);
    NSAttributedString *strA = [NSAttributedString attributedStringWithAttachment:attch];
    
    [attri insertAttributedString:strA atIndex:0];
    self.placeLabel.attributedText = attri;
    
    NSString *url = [NSString stringWithFormat:@"%@%@",serverAddress,model.shangjiaTouxiang];
    [self.shopImage sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"zhanwei"]];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

@end
