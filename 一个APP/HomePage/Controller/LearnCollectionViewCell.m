//
//  LearnCollectionViewCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/4.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "LearnCollectionViewCell.h"
static NSString *yuming = @"http://192.168.1.88:8080/shangcheng/";
@implementation LearnCollectionViewCell


- (void)LearnModel:(LearnModel *)model
{
    [self.learnImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", yuming, model.shangjiaTouxiang]]];
    self.TongzhiLabel.text = model.shangjiaTongzhi;
    self.numLabel.text = [NSString stringWithFormat:@"%@分", model.shangjiaPingfen];
    self.placeLabel.text = model.shangjiaWeizhi;
    self.nameLabel.text = model.shangjiaName;
}

- (void)awakeFromNib {
    // Initialization code
}

@end
