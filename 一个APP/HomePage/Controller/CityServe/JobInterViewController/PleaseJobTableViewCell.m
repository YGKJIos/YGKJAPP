//
//  PleaseJobTableViewCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/1.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "PleaseJobTableViewCell.h"
//static NSString *bendiyuming = @"http://192.168.1.88:8080/shangcheng";
//static NSString *headUrl = @"http://139.129.209.189:8080/shangcheng";

@implementation PleaseJobTableViewCell


+ (PleaseJobTableViewCell *)createJobCell
{
    PleaseJobTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"PleaseJobTableViewCell" owner:nil options:nil] lastObject];
    return cell;
}

- (void)JobModel:(PleaseJobModel *)model
{
    NSString *url = [NSString stringWithFormat:@"%@%@",serverAddress,model.shangjiaTouxiang];
    [self.headImage sd_setImageWithURL:[NSURL URLWithString:url]];
    self.nameLab.text = model.shangjiaName;
    self.informationLab.text = model.zhaopinZhiweimiaoshu;
    self.locationLab.text = model.shangjiaWeizhi;
    self.degreeLab.text = model.zhaopinXueli;
    self.yearLab.text = model.zhaopinGongzuojingyan;
    self.moenyLab.text = model.zhaopinXinzi;
    self.timeLab.text = [model.zhaopinFabushijian substringToIndex:9];
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
