//
//  FeastTableViewCell.m
//  一个APP
//
//  Created by 远古科技 on 16/7/4.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "FeastTableViewCell.h"

static NSString *headUrl = @"http://139.129.209.189:8080/shangcheng";

@implementation FeastTableViewCell


+ (FeastTableViewCell *) creactFeastCell
{
    FeastTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"FeastTableViewCell" owner:nil options:nil]lastObject];
    return cell;
}
- (void)setModel:(MerchantInformationModel *)model
{
    if (model != nil) {
        NSString *url = [NSString stringWithFormat:@"%@%@" , headUrl,model.shangjiaTouxiang];
        [self.feastImage sd_setImageWithURL:[NSURL URLWithString:url]];
        
        self.nameLabel.text = model.shangjiaName;
        self.numlabel.text = model.shangjiaPingfen;
        self.introduceLabel.text = model.shangjiaTongzhi;
        self.placeLabel.text = model.shangjiaWeizhi;
        
    }
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
