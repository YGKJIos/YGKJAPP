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
        self.foodName.text = @"香葱牛肉";
        self.foodName.textColor = BGcolor(88, 88, 88);
        self.foodName.font = [UIFont systemFontOfSize:15];
        [self.foodName autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:30];
        [self.foodName autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [self.foodName autoSetDimensionsToSize:CGSizeMake(120, 20)];
        
        self.numLab = [UILabel newAutoLayoutView];
        [self.contentView addSubview:self.numLab];
        self.numLab.text = @"香葱牛肉";
        self.numLab.textColor = BGcolor(88, 88, 88);
        self.numLab.font = [UIFont systemFontOfSize:15];
        [self.numLab autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:30];
        [self.numLab autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [self.numLab autoSetDimensionsToSize:CGSizeMake(120, 20)];
        
        self.moneyLab = [UILabel newAutoLayoutView];
        [self.contentView addSubview:self.moneyLab];
        self.moneyLab.text = @"¥10";
        self.moneyLab.textAlignment = NSTextAlignmentRight;
        self.moneyLab.textColor = BGcolor(88, 88, 88);
        self.moneyLab.font = [UIFont systemFontOfSize:15];
        [self.moneyLab autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:30];
        [self.moneyLab autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
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
