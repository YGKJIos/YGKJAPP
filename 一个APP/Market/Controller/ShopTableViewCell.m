//
//  ShopTableViewCell.m
//  一个APP
//
//  Created by 远古科技 on 16/7/9.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "ShopTableViewCell.h"

static NSString *shangcheng = @"http://192.168.1.88:8080/shangcheng/";

@implementation ShopTableViewCell

+ (ShopTableViewCell *) createShopCell
{
    ShopTableViewCell *cell = [[NSBundle mainBundle] loadNibNamed:@"ShopTableViewCell" owner:nil options:nil][0];
    return cell;
}
+ (ShopTableViewCell *)createCateTableViewCellNib
{
    ShopTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"ShopTableViewCell" owner:nil options:nil][1];
    return cell;
}

- (void) ShopModel:(ShopModel *)model
{
    self.nameLabel.text = model.shangjiaName;
    self.fenLabel.text = model.shangjiaPingfen;
    self.jieshaoLabel.text =  model.shangjiaTongzhi;
    self.juliLabel.text = [NSString stringWithFormat:@"%@m", model.shangjiaJuli];;
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
