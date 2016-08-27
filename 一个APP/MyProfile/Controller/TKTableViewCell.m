//
//  TKTableViewCell.m
//  一个APP
//
//  Created by 远古科技 on 16/8/26.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "TKTableViewCell.h"

@implementation TKTableViewCell

+ (TKTableViewCell *)createCell
{
    TKTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"TKTableViewCell" owner:nil options:nil]lastObject];
    return cell;
}

- (void)TKMdel:(TKModel *)model
{
    self.timeLab.text = model.waimaidingdanShijian;
    self.bzLab.text = model.waimaidingdanBeizhu;
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
