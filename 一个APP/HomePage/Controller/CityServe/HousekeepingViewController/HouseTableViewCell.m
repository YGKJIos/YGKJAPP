//
//  HouseTableViewCell.m
//  一个APP
//
//  Created by 远古科技 on 16/6/30.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "HouseTableViewCell.h"

//static NSString *bendi = @"http://192.168.1.88:8080/shangcheng/";
//static NSString *headUrl = @"http://139.129.209.189:8080/shangcheng";
@implementation HouseTableViewCell

+ (HouseTableViewCell *) createHouseCell
{
    HouseTableViewCell *houseCell = [[[NSBundle mainBundle]loadNibNamed:@"HouseTableViewCell" owner:nil options:nil]lastObject];
    return houseCell;
}


- (void) HouseModel:(MerchantInformationModel *)model
{
    NSString *imageUrl = [NSString stringWithFormat:@"%@%@", serverAddress, model.shangjiaTouxiang];
    [self.huoseImage sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"zhanwei"]];
    self.houseNameLabel.text = model.shangjiaName;
    self.sevLabel.text = [NSString stringWithFormat:@"服务范围：%@", model.fuwuFanwei];
    self.projectLabel.text = [NSString stringWithFormat:@"服务项目：%@", model.fuwuXiangmu];
    self.introduceLabel.text = [NSString stringWithFormat:@"详情介绍：%@", model.shangjiaTongzhi];
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
