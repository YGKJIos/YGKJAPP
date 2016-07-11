//
//  MoiveTableViewCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/25.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "MoiveTableViewCell.h"

static NSString *movie = @"http://192.168.1.88:8080/shangcheng/";

@implementation MoiveTableViewCell

+ (MoiveTableViewCell *)createMoiveCell
{
    MoiveTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"MoiveTableViewCell" owner:nil options:nil].lastObject;
    return cell;
}


- (void) MovieModel:(MovieModel *)model
{
    NSString *imageStr = [NSString stringWithFormat:@"%@%@", movie, model.dianyingTupian];
    [self.movieImage sd_setImageWithURL:[NSURL URLWithString:imageStr]];
    self.nameLabe.text = model.dianyingName;
    self.jieshaoLabel.text = model.dianyingJianjie;
    NSString *stylStr = [NSString stringWithFormat:@"%@%@", movie, model.dianyingLeixing];
    [self.stylImage sd_setImageWithURL:[NSURL URLWithString:stylStr]];
    NSString *tuijianStr= [NSString stringWithFormat:@"%@%@", movie, model.dianyingRebo];
    [self.tuijianImage sd_setImageWithURL:[NSURL URLWithString:tuijianStr]];
    self.rmbshuLabel.text = [NSString stringWithFormat:@"¥%@", model.dianyingTejia];
    self.yjrmbLabel
    
    
    
    
    .text = [NSString stringWithFormat:@"¥%@", model.dianyingYuanjia];
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
