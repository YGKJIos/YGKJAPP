//
//  QorderTableViewCell.m
//  一个APP
//
//  Created by 远古科技 on 16/8/25.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "QorderTableViewCell.h"

@implementation QorderTableViewCell

+ (QorderTableViewCell *)createCell
{
    QorderTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"QorderTableViewCell" owner:nil options:nil]lastObject];
    return cell;
}

- (void)QorderModel:(QorderModel *)model
{
    
    self.tiameLab.text = model.waimaidingdanShijian;
    self.bzLab.text = model.waimaidingdanBeizhu;
    if ([model.waimaidingdanZhuangtai isEqualToString:@"1"]) {
        self.jiedanLab.text = @"已接单";
        [self.sureBtn setTitle:@"确认收货" forState:UIControlStateNormal];
    }else
    {
        self.jiedanLab.text = @"未接单";
        [self.sureBtn setTitle:@"退单" forState:UIControlStateNormal];
    }
    
//    if ([model.waimaidingdanId isEqualToString:@"0"] && [model.waimaidingdanZhuangtai isEqualToString:@"0"] ) {
////        [self.sureBtn addTarget:self action:@selector(Action:) forControlEvents:UIControlEventTouchUpInside];
//    }
//    if ([model.waimaidingdanZhuangtai isEqualToString:@"1"] && [model.waimaidingdanZhuangtai isEqualToString:@"0"]) {
////        [self.sureBtn addTarget:self action:@selector(Action1:) forControlEvents:UIControlEventTouchUpInside];
//    }
//    if ([model.waimaidingdanZhuangtai isEqualToString:@"2"] && [model.waimaidingdanZhuangtai isEqualToString:@"0"]) {
////        [self.sureBtn addTarget:self action:@selector(Action2:) forControlEvents:UIControlEventTouchUpInside];
//        self.jiedanLab.text = @"已接单";
//        [self.sureBtn setTitle:@"确认收货" forState:UIControlStateNormal];
//    }
    
}

//- (void)Action:(UIButton *)btn
//{
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"退款失败" preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
//    [alert addAction:cancelAction];
//    [self presentViewController:alert animated:YES completion:^{
//        
//    }];
//}
//
//- (void)Action1:(UIButton *)btn
//{
//    
//}
//- (void)Action2:(UIButton *)btn
//{
//    
//}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
