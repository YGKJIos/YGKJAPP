//
//  SmallAdvertisingCell.h
//  一个APP
//
//  Created by 梁立彬 on 16/7/16.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SmallAdvertisingModel.h"

@interface SmallAdvertisingCell : UITableViewCell

@property (nonatomic, strong)UIImageView *headImageView;
@property (nonatomic, strong)UILabel *userName;
@property (nonatomic, strong)UIButton *phoneBtn;
@property (nonatomic, strong)UILabel *contLab;
@property (nonatomic, strong)UIView *imgView;

- (void)setDataForCellWithModel:(SmallAdvertisingCell *)model;

@end
