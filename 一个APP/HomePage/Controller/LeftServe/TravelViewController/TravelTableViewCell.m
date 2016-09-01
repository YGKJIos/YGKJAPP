//
//  TravelTableViewCell.m
//  一个APP
//
//  Created by 远古科技 on 16/7/4.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "TravelTableViewCell.h"
//static NSString *yuming = @"http://139.129.209.189:8080/shangcheng/";
@implementation TravelTableViewCell

+ (TravelTableViewCell *) createTravelCell
{
    TravelTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"TravelTableViewCell" owner:nil options:nil] lastObject];
    return cell;
}

- (void)TravelModel:(TravelModel *)model
{
    self.nameLabel.text = model.shangjiaName;
    [self.travelImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", serverAddress, model.shangjiaTouxiang]]];
    self.numLabel.text = [NSString stringWithFormat:@"%@分", model.shangjiaPingfen];
    self.placeLabel.text = model.shangjiaWeizhi;
    self.priceLabel.text = [NSString stringWithFormat:@"¥%@", model.shangjiaJiage];
    self.introduceLabel.text = model.shangjiaTongzhi;
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
