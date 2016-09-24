//
//  MovieShopTableViewCell.m
//  一个APP
//
//  Created by 远古科技 on 16/9/20.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "MovieShopTableViewCell.h"

@implementation MovieShopTableViewCell

+ (MovieShopTableViewCell *) createCell
{
    MovieShopTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"MovieShopTableViewCell" owner:self options:nil]lastObject];
    return cell;
}


- (void)MovieShopModel:(MovieShopModel *)model
{
    [self.MovieShopImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", serverAddress, model.shangjiaTouxiang]]];
    self.nameLab.text = model.shangjiaName;
    self.jieshaoLab.text = model.shangjiaTongzhi;
    self.addressLab.text = [NSString stringWithFormat:@"地址:%@", model.shangjiaWeizhi];
   
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
