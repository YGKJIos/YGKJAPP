//
//  groupShopTableViewCell.m
//  一个APP
//
//  Created by 远古科技 on 16/8/24.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "groupShopTableViewCell.h"

static NSString *bendi = @"http://192.168.1.88:8080/shangcheng/";
static NSString *headUrl = @"http://139.129.209.189:8080/shangcheng/";

@implementation groupShopTableViewCell

+ (groupShopTableViewCell *)createCell
{
    groupShopTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"groupShopTableViewCell" owner:nil options:nil]lastObject];
    return cell;
}


- (void)groupShopModel:(groupShopModel *)model
{
    self.shopMassgeLab.text = model.tuangouShuoming;
    self.shopNumLab.text = model.usertuangoujuanYanzhengma;
    self.shopPriceLab.text = model.tuangouTejia;
    NSString *str = [NSString stringWithFormat:@"ssdsdsd%@", model.shangjiaName];
    self.shopName.text = str;
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
