//
//  TheHotelTableViewCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/25.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "TheHotelTableViewCell.h"

//static NSString *hotel = @"http://192.168.1.88:8080/shangcheng/";
//static NSString *hearUrl = @"http://139.129.209.189:8080/shangcheng/";

@implementation TheHotelTableViewCell

+ (TheHotelTableViewCell *)createTheHotelCell
{
    TheHotelTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"TheHotelTableViewCell" owner:nil options:nil].lastObject;
    return cell;
}

- (void)TheHotelModel:(TheHotelModel *) model
{
    NSString *imageStr = [NSString stringWithFormat:@"%@%@", serverAddress, model.shangjiaTouxiang];
    [self.hotelImage sd_setImageWithURL:[NSURL URLWithString:imageStr] placeholderImage:[UIImage imageNamed:@"zhanwei"]];
    self.nameLabel.text = model.shangjiaName;
    self.numLabel.text = [NSString stringWithFormat:@"%@分", model.shangjiaPingfen];
    self.priceLabel.text = [NSString stringWithFormat:@"¥%@", model.shangjiaJiage];
    self.distanceLabel.text = [NSString stringWithFormat:@"%@m", model.shangjiaJuli];

}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
