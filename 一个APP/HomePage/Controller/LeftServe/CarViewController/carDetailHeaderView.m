//
//  carDetailHeaderView.m
//  一个APP
//
//  Created by 远古科技 on 16/7/23.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "carDetailHeaderView.h"

@implementation carDetailHeaderView


+ (carDetailHeaderView *)greateHeaderView
{
    carDetailHeaderView *cell = [[[NSBundle mainBundle] loadNibNamed:@"carDetailHeaderView" owner:nil options:nil]lastObject];
    return cell;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
