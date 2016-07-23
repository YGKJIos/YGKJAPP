//
//  EvaluateTableViewCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/23.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "StarEvaluateTotalTableViewCell.h"

@implementation StarEvaluateTotalTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _starImage = [[UIImageView alloc]initWithFrame:CGRectMake(30, 18, 62.5, 10)];
        _starImage.image = [UIImage imageNamed:@"xing"];
        [self.contentView addSubview:_starImage];
        
        _gradeLab = [[UILabel alloc]initWithFrame:CGRectMake(100, 13, 60, 20)];
        _gradeLab.textColor = BGcolor(245, 174, 58);
        _gradeLab.font = [UIFont systemFontOfSize:15];
        _gradeLab.text = @"4.8分";
        [self.contentView addSubview:_gradeLab];
        
        _evaluateTotalLab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH - 130, 13, 100, 20)];
        _evaluateTotalLab.textColor = BGcolor(59, 59, 59);
        _evaluateTotalLab.font = [UIFont systemFontOfSize:14];
        _evaluateTotalLab.textAlignment = NSTextAlignmentCenter;
        _evaluateTotalLab.text = @"222人评价";
        [self.contentView addSubview:_evaluateTotalLab];

    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
