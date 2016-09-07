//
//  GameTableViewCell.m
//  一个APP
//
//  Created by 远古科技 on 16/6/27.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "GameTableViewCell.h"

//static NSString *game = @"http://139.129.209.189:8080/shangcheng/";
@implementation GameTableViewCell


+ (GameTableViewCell *) createGameCell
{
    GameTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"GameTableViewCell" owner:nil options:nil] lastObject];
    return cell;
}


- (void) GameModel:(GameModel *)model
{
    NSString *imageUrl = [NSString stringWithFormat:@"%@%@",serverAddress, model.shangjiaTouxiang];
    [self.placeImage sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"zhanwei"]];
    self.nameLabel.text = model.shangjiaName;
    self.piceLabel.text = [NSString stringWithFormat:@"¥%@", model.shangjiaJiage];
    self.numLabel.text = [NSString stringWithFormat:@"%@分", model.shangjiaPingfen];
    self.jsLabel.text = model.shangjiaTongzhi;
    self.adressLabel.text = [NSString stringWithFormat:@"%@m", model.shangjiaJuli];
    
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
