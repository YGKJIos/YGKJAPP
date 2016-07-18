//
//  ShoppingCartTableViewCell.h
//  一个APP
//
//  Created by 梁立彬 on 16/7/9.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>

// 购物车cell
@interface ShoppingCartTableViewCell : UITableViewCell

@property (nonatomic, strong)UILabel *dishesLab; //
@property (nonatomic, strong)UILabel *moneyLab;
@property (nonatomic, strong)UIButton *addBtn;
@property (nonatomic, strong)UIButton *reduceBtn;
@property (nonatomic, strong)UILabel *numLab;

@end
