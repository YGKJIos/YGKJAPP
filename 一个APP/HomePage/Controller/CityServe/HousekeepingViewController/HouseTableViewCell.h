//
//  HouseTableViewCell.h
//  一个APP
//
//  Created by 远古科技 on 16/6/30.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MerchantInformationModel.h"
#import "BaseTableViewCell.h"

@interface HouseTableViewCell : BaseTableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *huoseImage;
@property (weak, nonatomic) IBOutlet UILabel *houseNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *sevLabel;
@property (weak, nonatomic) IBOutlet UILabel *projectLabel;
@property (weak, nonatomic) IBOutlet UILabel *introduceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *phoneImage;

+ (HouseTableViewCell *) createHouseCell;

- (void)HouseModel:(MerchantInformationModel *) model;

@end
