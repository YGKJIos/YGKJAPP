//
//  GroupPurchaseView.h
//  一个APP
//
//  Created by 梁立彬 on 16/7/22.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MerchantInformationModel.h"

@interface GroupPurchaseView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *foodImage;
@property (weak, nonatomic) IBOutlet UILabel *moneyLab;
@property (weak, nonatomic) IBOutlet UILabel *sellTotal;
@property (weak, nonatomic) IBOutlet UILabel *TEMoney;
@property (weak, nonatomic) IBOutlet UIButton *panicBuyBtn;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;

- (void)setModel:(MerchantInformationModel *)model;

@end
