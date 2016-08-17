//
//  ShopIntroduceTableViewCell.h
//  一个APP
//
//  Created by 梁立彬 on 16/7/23.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MerchantInformationModel.h"


@interface ShopIntroduceTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *shopName;
@property (weak, nonatomic) IBOutlet UILabel *addressLab;
@property (weak, nonatomic) IBOutlet UILabel *distanceLab;
@property (weak, nonatomic) IBOutlet UIButton *phoneBtn;
@property (nonatomic, copy)NSString *phoneNum;

- (void)setShopInformationModel:(MerchantInformationModel *)model;




@end
