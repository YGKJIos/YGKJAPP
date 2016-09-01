//
//  SecondHandTableViewCell.m
//  一个APP
//
//  Created by 远古科技 on 16/6/30.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "SecondHandTableViewCell.h"
//static NSString *Second = @"http://192.168.1.88:8080/shangcheng";
//static NSString *headUrl = @"http://139.129.209.189:8080/shangcheng";

@implementation SecondHandTableViewCell


+ (SecondHandTableViewCell *) createSecondHandCell
{
    SecondHandTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"SecondHandTableViewCell" owner:nil options:nil]lastObject];
    return cell;
}

- (void) SecondModel:(MerchantInformationModel *)model
{
    self.nameLabel.text = model.shangjiaName;
    self.introduceLabel.text = model.shangjiaTongzhi;
    self.priceLabel.text = [NSString stringWithFormat:@"¥%@", model.ershouJiage];
    self.dayLabel.text = [NSString stringWithFormat:@"%@/%@m",model.ershouShijian,model.shangjiaJuli];
    [self.SecondHandImage sd_setImageWithURL:[NSURL  URLWithString:[NSString stringWithFormat:@"%@%@", serverAddress, model.shangjiaTouxiang]]];
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
