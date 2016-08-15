//
//  voucherTableViewCell.m
//  一个APP
//
//  Created by 远古科技 on 16/7/25.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "voucherTableViewCell.h"

@implementation voucherTableViewCell

- (IBAction)payBtn:(id)sender {
}

+ (voucherTableViewCell *)greateCell
{
    voucherTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"voucherTableViewCell" owner:nil options:nil]lastObject];
    return cell;
}

- (void)setmodel:(MerchantInformationModel *)model
{
    NSString *str = [NSString stringWithFormat:@"http://139.129.209.189:8080/shangcheng%@",model.tuangouTouxiang];
    [self.TGHeadImage sd_setImageWithURL:[NSURL URLWithString:str]];
    self.TGname.text = model.tuangouName;
    self.TGspecialMoney.text = [NSString stringWithFormat:@"¥%@",model.tuangouTejia];
    self.TGOriginalMoney.text = [NSString stringWithFormat:@"原价%@",model.tuangouYuanjia];
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
