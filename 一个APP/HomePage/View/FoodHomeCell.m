//
//  FoodHomeCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/20.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "FoodHomeCell.h"
#import "HomeModelView.h"

@implementation FoodHomeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        for (int i = 0; i < 4; i++) {
            HomeModelView *view = [HomeModelView foodModelStyleView];
            view.frame = CGRectMake(20+i*(71+17), 17, 0, 0);
//            view.backgroundColor = [UIColor redColor];
//            [[HomeModelView alloc]initWithFrame:CGRectMake(27.5+i*(70+17), 17, 70, 70)];
            [self.contentView addSubview:view];
        }
        
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
