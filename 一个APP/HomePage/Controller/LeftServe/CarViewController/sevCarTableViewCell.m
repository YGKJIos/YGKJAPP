//
//  sevCarTableViewCell.m
//  一个APP
//
//  Created by 远古科技 on 16/7/2.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "sevCarTableViewCell.h"
static NSString *yuming = @"http://192.168.1.88:8080/shangcheng/";
@implementation sevCarTableViewCell

+ (sevCarTableViewCell *) createSevCarCell
{
    sevCarTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"sevCarTableViewCell" owner:nil options:nil] lastObject];
    return cell;
}

- (void)CarModel:(MerchantInformationModel *)model
{
    self.nameLabel.text = model.shangjiaName;
    self.numLabel.text = [NSString stringWithFormat:@"%@分", model.shangjiaPingfen];
    self.placeLabel.text = model.shangjiaWeizhi;
    [self.sevCarImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", yuming, model.shangjiaTouxiang]]];
    self.stylLabel.text = model.shangjiaTongzhi;
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
