//
//  TakeOutRightTableCell.h
//  一个APP
//
//  Created by 梁立彬 on 16/7/6.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MerchantInformationModel.h"


@interface TakeOutRightTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImage;// 商家图片
@property (weak, nonatomic) IBOutlet UILabel *nameLab;// 商家名字
@property (weak, nonatomic) IBOutlet UILabel *sellNumLab;// 销售量
@property (weak, nonatomic) IBOutlet UILabel *pirceLab;//单价
@property (weak, nonatomic) IBOutlet UIButton *jiaBtn;// 添加
@property (weak, nonatomic) IBOutlet UIButton *jianBtn;// 减少
@property (weak, nonatomic) IBOutlet UILabel *numberLab;// 份数

- (void)addBtnClickAction:(NSIndexPath *)indexPath;
- (void)setTakeOutRightTableModel:(MerchantInformationModel *)model;


@end
