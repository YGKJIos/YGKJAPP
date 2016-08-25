//
//  groupShopTableViewCell.h
//  一个APP
//
//  Created by 远古科技 on 16/8/24.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "groupShopModel.h"
@interface groupShopTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *shopMassgeLab;
@property (weak, nonatomic) IBOutlet UILabel *shopNumLab;
@property (weak, nonatomic) IBOutlet UILabel *shopPriceLab;
@property (weak, nonatomic) IBOutlet UILabel *shopName;


+ (groupShopTableViewCell *)createCell;

- (void)groupShopModel:(groupShopModel *)model;


@end
