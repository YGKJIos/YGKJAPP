//
//  FoodHomeCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/20.
//  Copyright © 2016年 llb. All rights reserved.
//

// 美食精选
#import "FoodHomeCell.h"
#import "HomeModelView.h"

@implementation FoodHomeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGFloat wid = (WIDTH -345) / 3;
        CGFloat boundsWid = 30 * WIDTH/375;
        for (int i = 0; i < 4; i++) {
            HomeModelView *view = [HomeModelView foodModelStyleView];
            view.frame = CGRectMake(boundsWid+i*(71+wid), 17, 0, 0);
            [self.contentView addSubview:view];
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClickAction:)];
            [view addGestureRecognizer:tap];
            
        }
    }
    return self;
}

- (void)tapClickAction:(UITapGestureRecognizer *)tap
{
    [self.delegate foodHomePushDelegateMethod];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
