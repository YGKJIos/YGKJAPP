//
//  voucherTableViewCell.h
//  一个APP
//
//  Created by 远古科技 on 16/7/25.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MerchantInformationModel.h"

@interface voucherTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *TGHeadImage;
@property (weak, nonatomic) IBOutlet UILabel *TGname;
@property (weak, nonatomic) IBOutlet UILabel *TGspecialMoney;
@property (weak, nonatomic) IBOutlet UILabel *TGOriginalMoney;
@property (weak, nonatomic) IBOutlet UIButton *payBtn;

+ (voucherTableViewCell *)greateCell;
- (void)setmodel:(MerchantInformationModel *)model;

@end
