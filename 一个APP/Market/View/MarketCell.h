//
//  MarketCell.h
//  一个APP
//
//  Created by 梁立彬 on 16/6/6.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MarketModel.h"
#import "BaseTableViewCell.h"

@interface MarketCell : BaseTableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *shopImage;  // 商户图片
@property (weak, nonatomic) IBOutlet UILabel *shopNameLab; // 商户名字
@property (weak, nonatomic) IBOutlet UILabel *favorableLab;//
@property (weak, nonatomic) IBOutlet UILabel *priceLab; // 价钱
@property (weak, nonatomic) IBOutlet UILabel *upPriceLab; // 没减价之前的价钱
@property (weak, nonatomic) IBOutlet UIImageView *reducImage;
@property (weak, nonatomic) IBOutlet UILabel *singleLab;
@property (weak, nonatomic) IBOutlet UILabel *distanceLab;
@property (weak, nonatomic) IBOutlet UILabel *gradeLab;
@property (weak, nonatomic) IBOutlet UIImageView *xingImage;

// xib 创建cell
+ (MarketCell *)cellCreaterNibLoad;

- (void)marketModel:(MarketModel *)model;



@end
