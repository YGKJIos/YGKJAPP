//
//  MenuTableViewCell.h
//  一个APP
//
//  Created by 梁立彬 on 16/7/11.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MerchantInformationModel.h"

@interface MenuOrderTableViewCell : UITableViewCell
@property (nonatomic, strong)UILabel *foodName;
@property (nonatomic, strong)UILabel *numLab;
@property (nonatomic, strong)UILabel *moneyLab;

- (void)setMenuArr:(NSArray *)arr;

@end
