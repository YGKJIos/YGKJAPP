//
//  LearnGroupPurchaseTableViewCell.h
//  一个APP
//
//  Created by 梁立彬 on 16/7/24.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LearnGroupPurchaseTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *learnTitle;
@property (weak, nonatomic) IBOutlet UILabel *detailsLab;
@property (weak, nonatomic) IBOutlet UILabel *moneyLab;
@property (weak, nonatomic) IBOutlet UIButton *buyBtn;

+ (LearnGroupPurchaseTableViewCell *)createLearnGroupPurchaseCellNib;

@end
