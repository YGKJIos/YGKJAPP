//
//  headerView.m
//  一个APP
//
//  Created by 远古科技 on 16/7/22.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "headerView.h"
static NSString *headUrl = @"http://139.129.209.189:8080/shangcheng";

@implementation headerView


+ (headerView *)greateHeaderView
{
    headerView *head = [[[NSBundle mainBundle]loadNibNamed:@"headerView" owner:nil options:nil]lastObject];
    return head;
}

- (void)setModel:(MerchantInformationModel *)model
{
    NSString *url = [NSString stringWithFormat:@"%@%@",headUrl,model.shangjiaTouxiang];
    [self.image sd_setImageWithURL:[NSURL URLWithString:url]];
    self.gradeLab.text = [NSString stringWithFormat:@"%@分",model.shangjiaPingfen];
}

@end
