//
//  GroupPurchaseView.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/22.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "GroupPurchaseView.h"
static NSString *url = @"http://139.129.209.189:8080/shangcheng";

@implementation GroupPurchaseView

-(void)setModel:(MerchantInformationModel *)model
{
    NSString *imageURl = [NSString stringWithFormat:@"%@%@",url,model.tuangouTouxiang];
    [self.foodImage sd_setImageWithURL:[NSURL URLWithString:imageURl]];
    // 特价
    NSString *TEmoney = [NSString stringWithFormat:@"¥%@",model.tuangouTejia];
    self.TEMoney.text = TEmoney;
    
    // 套餐
    NSString *nameText = [NSString stringWithFormat:@"%@: ¥%@",model.tuangouName,model.tuangouYuanjia];
    self.nameLab.text = nameText;
}

@end
