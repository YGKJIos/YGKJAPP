//
//  InformationView.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/5.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "TakeOutInformationView.h"
static NSString *bendi = @"http://192.168.1.88:8080/shangcheng";

@implementation TakeOutInformationView

+(TakeOutInformationView *)CreateInformationNib
{
    TakeOutInformationView *view = [[NSBundle mainBundle]loadNibNamed:@"TakeOutInformationView" owner:nil options:nil].lastObject;
    return view;
}
- (void)setModel:(MerchantInformationModel *)model
{
    NSString *urlImage = [NSString stringWithFormat:@"%@%@",bendi,model.shangjiaTouxiang];
    [self.shopImage sd_setImageWithURL:[NSURL URLWithString:urlImage] placeholderImage:nil];
    self.sendSriceLab.text = [NSString stringWithFormat:@"起送价：%@",model.qisongjia];
    self.shipFeeLab.text = [NSString stringWithFormat:@"配送费：%@",model.peisongfei];
}


@end
