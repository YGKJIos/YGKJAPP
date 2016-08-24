//
//  InformationView.h
//  一个APP
//
//  Created by 梁立彬 on 16/7/5.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MerchantInformationModel.h"

@interface TakeOutInformationView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *shopImage;// 商家图片

@property (weak, nonatomic) IBOutlet UIButton *cateBtn;//餐品
@property (weak, nonatomic) IBOutlet UIButton *evaluateBtn;//评价
@property (weak, nonatomic) IBOutlet UIButton *introduceBtn;// 商家介绍

@property (weak, nonatomic) IBOutlet UIView *scrollLine;

+ (TakeOutInformationView *)CreateInformationNib;
- (void)setModel:(MerchantInformationModel *)model;

@end
