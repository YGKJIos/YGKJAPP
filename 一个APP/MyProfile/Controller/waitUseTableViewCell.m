//
//  waitUseTableViewCell.m
//  一个APP
//
//  Created by 远古科技 on 16/8/23.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "waitUseTableViewCell.h"

@implementation waitUseTableViewCell

+ (waitUseTableViewCell *)createCell
{
    waitUseTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"waitUseTableViewCell" owner:nil options:nil]lastObject];
    return cell;
}

- (void)waitUseModel:(waitUseModel *)model
{
    self.foodNameLab.text = model.shangjiaName;
    self.quanLab.text = model.tuangouShuoming;
    self.priceLab.text = [NSString stringWithFormat:@"¥%@",model.tuangouTejia];
    self.qmLab.text = model.usertuangoujuanYanzhengma;
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
