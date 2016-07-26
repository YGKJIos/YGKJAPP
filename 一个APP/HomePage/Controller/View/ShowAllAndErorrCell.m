//
//  ShowAllTableViewCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/24.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "ShowAllAndErorrCell.h"

@implementation ShowAllAndErorrCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

    }
    return self;
}

- (void)setShowAllAndErorrCellStyle:(ShowAllAndErorrCellStyle)style
{
    if (style == showAllCellStyle) {
        UIImageView *imageView = [UIImageView newAutoLayoutView];
        [self.contentView addSubview:imageView];
        [imageView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [imageView autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [imageView autoSetDimensionsToSize:CGSizeMake(51, 13)];
        imageView.image = [UIImage imageNamed:@"showAll"];
    }else if (style == erorrCellStyle)
    {
        UIImageView *imageView = [UIImageView newAutoLayoutView];
        [self.contentView addSubview:imageView];
        [imageView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [imageView autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [imageView autoSetDimensionsToSize:CGSizeMake(230, 30)];
        imageView.image = [UIImage imageNamed:@"ms_baocuo"];
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
