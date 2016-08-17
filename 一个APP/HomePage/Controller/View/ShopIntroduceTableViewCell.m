//
//  ShopIntroduceTableViewCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/23.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "ShopIntroduceTableViewCell.h"

@implementation ShopIntroduceTableViewCell

- (void)setShopInformationModel:(MerchantInformationModel *)model
{
    self.shopName.text = model.shangjiaName;
    self.addressLab.text = model.shangjiaWeizhi;
    self.phoneNum = model.shangjiaDianhua;
    [self.phoneBtn addTarget:self action:@selector(phoneBtnAction) forControlEvents:UIControlEventTouchUpInside];
}
- (void)phoneBtnAction
{
    UIWebView*callWebview =[[UIWebView alloc] init];
    NSString *phoneText = [NSString stringWithFormat:@"tel://%@",self.phoneNum];
    NSURL *telURL =[NSURL URLWithString:phoneText];// 貌似tel:// 或者 tel: 都行
    [callWebview loadRequest:[NSURLRequest requestWithURL:telURL]];
    
    //记得添加到view上
    [self.contentView addSubview:callWebview];
}

@end
