//
//  MenuTableViewCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/11.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "MenuOrderTableViewCell.h"


@implementation MenuOrderTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)setMenuArr:(NSArray *)arr
{
    for (int i = 0; i < arr.count; i++) {
        self.foodName = [UILabel newAutoLayoutView];
        [self.contentView addSubview:self.foodName];
        self.foodName.text = [arr[i] waimaishipinName];
        self.foodName.textColor = BGcolor(88, 88, 88);
        self.foodName.font = [UIFont systemFontOfSize:15];
        [self.foodName autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:30];
//        [self.foodName autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [self.foodName autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10+(20+5)*i];
        [self.foodName autoSetDimensionsToSize:CGSizeMake(120, 20)];
        
        self.numLab = [UILabel newAutoLayoutView];
        [self.contentView addSubview:self.numLab];
        self.numLab.text = @"1份";
        self.numLab.textColor = BGcolor(88, 88, 88);
        self.numLab.font = [UIFont systemFontOfSize:15];
        self.numLab.textAlignment = NSTextAlignmentCenter;
        [self.numLab autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [self.numLab autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10+(20+5)*i];
        [self.numLab autoSetDimensionsToSize:CGSizeMake(120, 20)];
        
        self.moneyLab = [UILabel newAutoLayoutView];
        [self.contentView addSubview:self.moneyLab];
        self.moneyLab.text = [arr[i] waimaishipinJiage];
        self.moneyLab.textAlignment = NSTextAlignmentRight;
        self.moneyLab.textColor = BGcolor(88, 88, 88);
        self.moneyLab.font = [UIFont systemFontOfSize:15];
        [self.moneyLab autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:30];
        [self.moneyLab autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10+(20+5)*i];
        [self.moneyLab autoSetDimensionsToSize:CGSizeMake(120, 20)];
    }
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
