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
    
}







- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
