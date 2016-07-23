//
//  MerchantFoodTableViewCell.h
//  一个APP
//
//  Created by 梁立彬 on 16/7/21..
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MerchantFoodTableViewCell : UITableViewCell
// 套餐图片
@property (weak, nonatomic) IBOutlet UIImageView *foodImage;
// 套餐名称
@property (weak, nonatomic) IBOutlet UILabel *foodNameLab;
@property (weak, nonatomic) IBOutlet UILabel *moneyLab;
// 原价
@property (weak, nonatomic) IBOutlet UILabel *originalMoneyLab;
// 已出售
@property (weak, nonatomic) IBOutlet UILabel *offerNumLab;

+ (MerchantFoodTableViewCell *)CreateMerchantFoodNib;

@end
