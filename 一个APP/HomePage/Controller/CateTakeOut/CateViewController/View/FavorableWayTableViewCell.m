//
//  FavorableWayTableViewCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/21.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "FavorableWayTableViewCell.h"

@implementation FavorableWayTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.wayImage = [UIImageView newAutoLayoutView];
        [self.contentView addSubview:self.wayImage];
        [self.wayImage autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:30];
        [self.wayImage autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [self.wayImage autoSetDimensionsToSize:CGSizeMake(13, 13)];
       
        self.favorableLab = [UILabel newAutoLayoutView];
        [self.contentView addSubview:self.favorableLab];
        [self.favorableLab autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:50];
        [self.favorableLab autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [self.favorableLab autoSetDimensionsToSize:CGSizeMake(120, 20)];
        self.favorableLab.textColor = BGcolor(65, 186, 206);
        self.favorableLab.font = [UIFont systemFontOfSize:15];
        
        self.totalLab = [UILabel newAutoLayoutView];
        [self.contentView addSubview:self.totalLab];
        self.totalLab.textAlignment = NSTextAlignmentRight;
        self.totalLab.textColor = BGcolor(192, 192, 192);
        self.totalLab.font = [UIFont systemFontOfSize:12];
        [self.totalLab autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:30];
        [self.totalLab autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [self.totalLab autoSetDimensionsToSize:CGSizeMake(120, 20)];
        
//        self.wayImage = [[UIImageView alloc]initWithFrame:CGRectMake(30, self.contentView.height/2-6.5, 13, 13)];
//        [self.contentView addSubview:self.wayImage];
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
