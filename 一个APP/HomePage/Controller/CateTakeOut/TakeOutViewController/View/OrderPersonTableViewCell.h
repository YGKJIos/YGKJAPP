//
//  OrderPersonTableViewCell.h
//  一个APP
//
//  Created by 梁立彬 on 16/7/9.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MerchantInformationModel.h"

typedef NS_ENUM(NSInteger, OrderPersonCell){
    InformationOrderPersonCell,  // 订单信息
    PaymentOrderPersonCell,  // 选择支付方式
    MerchantSnackCell,    // 商家快餐名字
    MeunInformationCell,  // 菜单信息
    FavorableCell, // 优惠立减
    TotalCell, // 总计
    SurePayOrderCell // 确认下单
};

// 订单人信息
@interface OrderPersonTableViewCell : UITableViewCell

@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *sexLab;
@property (nonatomic, strong)UILabel *phoneNumLab;
@property (nonatomic, strong)UILabel *addressLab;

// 选择的食品
@property (nonatomic, strong)UILabel *totalText; // 订单统计
@property (nonatomic, strong)UILabel *waitPayLab; // 待支付总价
- (void)setTotalCell:(NSMutableArray *)selectArr; // 统计方法

// 确定下单按钮
@property (nonatomic, strong)UILabel *usePayLab;
@property (nonatomic, strong)UIButton *payBtn;
- (void)setUsePayCell:(NSMutableArray *)selectArr;

- (void)setOrderPersonCellStyle:(OrderPersonCell)orderPersonStyle model:(MerchantInformationModel *)model;

@end
