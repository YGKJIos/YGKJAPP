//
//  HouseTableViewCell.h
//  一个APP
//
//  Created by 远古科技 on 16/6/30.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HouseModel.h"
@interface HouseTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *huoseImage;
@property (weak, nonatomic) IBOutlet UILabel *houseNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *sevLabel;
@property (weak, nonatomic) IBOutlet UILabel *projectLabel;
@property (weak, nonatomic) IBOutlet UILabel *introduceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *phoneImage;



+ (HouseTableViewCell *) createHouseCell;

- (void)HouseModel: (HouseModel *) model;

@end
