//
//  OrderPersonTableViewCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/9.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "OrderPersonTableViewCell.h"

@implementation OrderPersonTableViewCell

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
        
        
        
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
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
   
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
