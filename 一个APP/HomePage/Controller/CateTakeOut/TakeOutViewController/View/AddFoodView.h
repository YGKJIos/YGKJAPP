//
//  AddFoodView.h
//  一个APP
//
//  Created by 梁立彬 on 16/7/6.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MerchantInformationModel.h"

@interface AddFoodView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *shoppingImage;//购物车图片
@property (weak, nonatomic) IBOutlet UILabel *orderLab;// 选择菜品
@property (weak, nonatomic) IBOutlet UIButton *orderMoneyBtn;// 起送价
@property (weak, nonatomic) IBOutlet UILabel *orderNum;

+ (AddFoodView *)CreateAddFoodView;
- (void)setModel:(MerchantInformationModel *)model;

@end
