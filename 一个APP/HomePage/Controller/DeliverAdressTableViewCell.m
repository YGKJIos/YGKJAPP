//
//  DeliverAdressTableViewCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/13.
//  Copyright © 2016年 llb. All rights reserved.
//

// 送货地址 cell
#import "DeliverAdressTableViewCell.h"

@implementation DeliverAdressTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.nameLabel = [UILabel newAutoLayoutView];
        self.nameLabel.text = @"顾小龙";
        self.nameLabel.textColor = BGcolor(78, 78, 78);
        [self.contentView addSubview:self.nameLabel];
        
        self.sexLab = [UILabel newAutoLayoutView];
        self.sexLab.text = @"男";
        self.sexLab.textColor = BGcolor(78, 78, 78);
        [self.contentView addSubview:self.sexLab];
        
        self.phoneNumLab = [UILabel newAutoLayoutView];
        self.phoneNumLab.text = @"1234565432";
        self.phoneNumLab.textColor = BGcolor(78, 78, 78);
        [self.contentView addSubview:self.phoneNumLab];
        
        self.addressLab = [UILabel newAutoLayoutView];
        self.addressLab.text = @"南岗区花园街恒运大厦A座1024";
        self.addressLab.textColor = BGcolor(78, 78, 78);
        [self.contentView addSubview:self.addressLab];
        
        [self.nameLabel autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:30];
        [self.nameLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15];
        [self.nameLabel autoSetDimensionsToSize:CGSizeMake(100, 20)];
        
        [self.sexLab autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.nameLabel withOffset:15];
        [self.sexLab autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15];
        [self.sexLab autoSetDimensionsToSize:CGSizeMake(50, 20)];
        
        [self.phoneNumLab autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.sexLab withOffset:15];
        [self.phoneNumLab autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15];
        [self.phoneNumLab autoSetDimensionsToSize:CGSizeMake(120, 20)];
        
        [self.addressLab autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:30];
        [self.addressLab autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:41];
        [self.addressLab autoSetDimensionsToSize:CGSizeMake(WIDTH, 20)];
        
        self.modifBtn = [UIButton newAutoLayoutView];
        [self.contentView addSubview:self.modifBtn];
        [self.modifBtn autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:30];
        [self.modifBtn autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:30];
        [self.modifBtn autoSetDimensionsToSize:CGSizeMake(20, 20)];
        [self.modifBtn setBackgroundImage:[UIImage imageNamed:@"waimai_songhuo_xiugai"] forState:UIControlStateNormal];
        [self.modifBtn addTarget:self action:@selector(modifBtnAction) forControlEvents:UIControlEventTouchUpInside];
        
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 75, WIDTH, 1)];
        lineView.backgroundColor = BGcolor(195, 195, 195);
        [self.contentView addSubview:lineView];
        
        self.deleteBtn = [UIButton newAutoLayoutView];
        [self.contentView addSubview:self.deleteBtn];
        [self.deleteBtn autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [self.deleteBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:lineView withOffset:10 relation:NSLayoutRelationEqual];
        [self.deleteBtn autoSetDimensionsToSize:CGSizeMake(100, 18)];
        [self.deleteBtn setBackgroundImage:[UIImage imageNamed:@"waimai_songhuo_shanchu"] forState:UIControlStateNormal];
        [self.deleteBtn addTarget:self action:@selector(deleteBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
- (void)modifBtnAction
{
    [self.delegate modifBtnDelegate];
}
- (void)deleteBtnAction
{
    NSLog(@"删除");
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
