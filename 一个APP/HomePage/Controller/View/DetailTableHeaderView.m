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


- (IBAction)phoneBtn:(id)sender {
    NSLog(@"%@",self.telephoneNum);
    NSMutableString *str = [NSMutableString stringWithFormat:@"telprompt://%@" , self.telephoneNum];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

+ (DetailTableHeaderView *)greateHeaderView
{
    DetailTableHeaderView *cell = [[[NSBundle mainBundle] loadNibNamed:@"DetailTableHeaderView" owner:nil options:nil]lastObject];
    return cell;
}
- (void)setHeaderModel:(MerchantInformationModel *)model
{
    self.shopHeadImage.image = [UIImage imageNamed:@"headerzhanweitu"];

    if (!model.shangjiaTouxiang) {
        NSString *str = [NSString stringWithFormat:@"%@%@",url,model.shangjiaTouxiang];
        [self.shopHeadImage sd_setImageWithURL:[NSURL URLWithString:str]];
    }
    
    self.shopName.text = model.shangjiaName;
    self.addressLab.text = model.shangjiaWeizhi;
    self.telephoneNum = model.shangjiaDianhua;
    
    
}

@end
