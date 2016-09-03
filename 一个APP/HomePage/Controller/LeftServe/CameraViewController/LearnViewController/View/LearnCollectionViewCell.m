//
//  LearnCollectionViewCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/4.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "LearnCollectionViewCell.h"
//static NSString *yuming = @"http://139.129.209.189:8080/shangcheng/";
@implementation LearnCollectionViewCell


- (void)LearnModel:(LearnModel *)model
{
    NSString *imageUrl = [NSString stringWithFormat:@"%@%@", serverAddress, model.shangjiaTouxiang];
    [self.learnImage sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"zhanwei"]];
    self.TongzhiLabel.text = model.shangjiaTongzhi;
    self.numLabel.text = [NSString stringWithFormat:@"%@分", model.shangjiaPingfen];
    self.placeLabel.text = model.shangjiaWeizhi;
    self.nameLabel.text = model.shangjiaName;
}

- (void)awakeFromNib {
    // Initialization code
}

@end
