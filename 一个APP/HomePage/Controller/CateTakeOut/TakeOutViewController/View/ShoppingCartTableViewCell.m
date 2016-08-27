//
//  ShoppingCartTableViewCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/9.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "ShoppingCartTableViewCell.h"

@implementation ShoppingCartTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.dishesLab = [UILabel newAutoLayoutView];
        self.dishesLab.textColor = BGcolor(143, 143, 143);
        self.dishesLab.font = [UIFont systemFontOfSize:17];
//        self.dishesLab.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.dishesLab];
        [self.dishesLab autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:30];
        [self.dishesLab autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:13];
        [self.dishesLab autoSetDimensionsToSize:CGSizeMake(200, 20)];
        
        self.moneyLab = [UILabel newAutoLayoutView];
        self.moneyLab.text = @"¥20";
        self.moneyLab.textColor = BGcolor(143, 143, 143);
        self.moneyLab.font = [UIFont systemFontOfSize:17];
        self.moneyLab.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.moneyLab];
        [self.moneyLab autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:13];
        [self.moneyLab autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:30];
        [self.moneyLab autoSetDimensionsToSize:CGSizeMake(50, 20)];
        
//        self.reduceBtn = [UIButton newAutoLayoutView];
//        [self.contentView addSubview:self.reduceBtn];
//        [self.reduceBtn setBackgroundImage:[UIImage imageNamed:@"waimai_jian"] forState:UIControlStateNormal];
//        [self.reduceBtn autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
//        [self.reduceBtn autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:85];
//        [self.reduceBtn autoSetDimensionsToSize:CGSizeMake(25, 25)];
//        [self.reduceBtn addTarget:self action:@selector(reduceBtnAction) forControlEvents:UIControlEventTouchUpInside];
//        
//        self.numLab = [UILabel newAutoLayoutView];
//        self.numLab.textColor = BGcolor(143, 143, 143);
//        self.numLab.text = @"1";
//        self.numLab.font = [UIFont systemFontOfSize:17];
//        self.numLab.textAlignment = NSTextAlignmentCenter;
//        [self.contentView addSubview:self.numLab];
//        [self.numLab autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
//        [self.numLab autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:55];
//        [self.numLab autoSetDimensionsToSize:CGSizeMake(30, 20)];
//        
//        self.addBtn = [UIButton newAutoLayoutView];
//        [self.contentView addSubview:self.addBtn];
//        [self.addBtn setBackgroundImage:[UIImage imageNamed:@"waimai_jia"] forState:UIControlStateNormal];
//        [self.addBtn autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
//        [self.addBtn autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:30];
//        [self.addBtn autoSetDimensionsToSize:CGSizeMake(25, 25)];
//        [self.addBtn addTarget:self action:@selector(addBtnAction) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

- (void)reduceBtnAction
{
    NSLog(@"减少一份");
}
- (void)addBtnAction
{
    NSLog(@"加了一份");
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
