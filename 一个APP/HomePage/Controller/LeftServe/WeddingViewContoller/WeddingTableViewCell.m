//
//  WeddingTableViewCell.m
//  一个APP
//
//  Created by 远古科技 on 16/7/1.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "WeddingTableViewCell.h"
static NSString *yuming = @"http://192.168.1.88:8080/shangcheng";
static NSString *headUrl = @"139.129.209.189:8080/shangcheng";
@implementation WeddingTableViewCell


+ (WeddingTableViewCell *) createWeddingCell
{
    WeddingTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"WeddingTableViewCell" owner:nil options:nil] lastObject];
    return cell;
}

- (void)weddingModel:(weddingModel *)model
{
    self.nameLabel.text = model.shangjiaName;
    self.numLabel.text = [NSString stringWithFormat:@"%@分", model.shangjiaPingfen];
    self.placeLabel.text = model.shangjiaWeizhi;
    [self.weddingImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", headUrl, model.shangjiaTouxiang]]];
    self.piceLabel.text = [NSString stringWithFormat:@"%@折起", model.shangjiaZhekou];
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
