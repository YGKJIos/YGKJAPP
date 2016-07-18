//
//  TakePhotoTableViewCell.m
//  一个APP
//
//  Created by 远古科技 on 16/7/2.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "TakePhotoTableViewCell.h"
static NSString *yuming = @"http://192.168.1.88:8080/shangcheng/";
@implementation TakePhotoTableViewCell



+ (TakePhotoTableViewCell *) createTakePhotoCell
{
    TakePhotoTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"TakePhotoTableViewCell" owner:nil options:nil] lastObject];
    return cell;
}


- (void)PhotoModel:(PhotoModel *)model
{
    self.nameLabel.text = model.shangjiaName;
    [self.childImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", yuming, model.shangjiaTouxiang]]];
    self.numLabel.text = [NSString stringWithFormat:@"%@分", model.shangjiaPingfen];
    self.placeLabel.text = model.shangjiaWeizhi;
    self.writingLabel.text = model.shangjiaTongzhi;
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
