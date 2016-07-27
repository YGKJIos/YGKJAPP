//
//  SectionTitleTableViewCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/24.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "TitleCellTableViewCell.h"

@implementation TitleCellTableViewCell

+ (TitleCellTableViewCell *)createSectionTitleCellNib
{
    TitleCellTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"TitleCellTableViewCell" owner:nil options:nil].lastObject;
    return cell;
}

- (void)setTitleImage:(NSString *)image titleLab:(NSString *)text
{
    self.titleImage.image = [UIImage imageNamed:image];
    self.titleLab.text = text;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
