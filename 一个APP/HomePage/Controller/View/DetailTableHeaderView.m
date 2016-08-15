//
//  carDetailHeaderView.m
//  一个APP
//
//  Created by 远古科技 on 16/7/23.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "DetailTableHeaderView.h"

static NSString *url = @"http://139.129.209.189:8080/shangcheng";

@implementation DetailTableHeaderView


+ (DetailTableHeaderView *)greateHeaderView
{
    DetailTableHeaderView *cell = [[[NSBundle mainBundle] loadNibNamed:@"DetailTableHeaderView" owner:nil options:nil]lastObject];
    return cell;
}
- (void)setHeaderModel:(MerchantInformationModel *)model
{
    NSString *str = [NSString stringWithFormat:@"%@%@",url,model.shangjiaTouxiang];
    [self.shopHeadImage sd_setImageWithURL:[NSURL URLWithString:str]];
    self.shopName.text = model.shangjiaName;
    self.grade.text = [NSString stringWithFormat:@"%@分",model.shangjiaPingfen];
    self.addressLab.text = model.shangjiaWeizhi;
    self.telephoneNum = model.shangjiaDianhua;
}

- (IBAction)phoneBtn:(id)sender {
    
    NSMutableString *str = [NSMutableString stringWithFormat:@"telprompt://%@" , self.telephoneNum];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}
@end
