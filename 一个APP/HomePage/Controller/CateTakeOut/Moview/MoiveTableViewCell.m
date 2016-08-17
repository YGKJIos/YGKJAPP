//
//  MoiveTableViewCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/25.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "MoiveTableViewCell.h"

static NSString *bendi = @"http://192.168.1.88:8080/shangcheng/";
static NSString *headUrl = @"http://139.129.209.189:8080/shangcheng/";

@implementation MoiveTableViewCell

+ (MoiveTableViewCell *)createMoiveCell
{
    MoiveTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"MoiveTableViewCell" owner:nil options:nil].lastObject;
    return cell;
}


- (void) MovieModel:(MovieModel *)model
{
    NSString *imageStr = [NSString stringWithFormat:@"%@%@", headUrl, model.dianyingTupian];
    [self.movieImage sd_setImageWithURL:[NSURL URLWithString:imageStr]];
    // 电影名称
    self.nameLabe.text = model.dianyingName;
    // 电影介绍
    self.jieshaoLabel.text = model.dianyingJianjie;
    NSString *stylStr = [NSString stringWithFormat:@"%@%@", headUrl, model.dianyingLeixing];
    [self.stylImage sd_setImageWithURL:[NSURL URLWithString:stylStr]];
    NSString *tuijianStr= [NSString stringWithFormat:@"%@%@", headUrl, model.dianyingRebo];
    [self.tuijianImage sd_setImageWithURL:[NSURL URLWithString:tuijianStr]];
    // 特价
    self.rmbshuLabel.text = [NSString stringWithFormat:@"¥%@", model.dianyingTejia];
    // 原价
    self.yjrmbLabel.text = [NSString stringWithFormat:@"¥%@", model.dianyingYuanjia];
    
    self.numLabel.text = model.dianyingPingfen;
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
