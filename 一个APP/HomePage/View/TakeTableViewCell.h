//
//  TakeTableViewCell.h
//  一个APP
//
//  Created by 梁立彬 on 16/6/25.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TakeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *foodImageView; // 店铺图片
@property (weak, nonatomic) IBOutlet UILabel *shopName; //店铺名称
@property (weak, nonatomic) IBOutlet UILabel *jianLab; // 减
@property (weak, nonatomic) IBOutlet UILabel *xinLab; // 新
@property (weak, nonatomic) IBOutlet UILabel *moneyLab; //起送价
@property (weak, nonatomic) IBOutlet UILabel *sendLab; // 配送费
@property (weak, nonatomic) IBOutlet UILabel *salesLab; // 销售

+ (TakeTableViewCell *)CreateTakeOutCell;


@end
