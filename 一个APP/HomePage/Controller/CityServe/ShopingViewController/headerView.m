//
//  headerView.m
//  一个APP
//
//  Created by 远古科技 on 16/7/22.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "headerView.h"

@implementation headerView


+ (headerView *)greateHeaderView
{
    headerView *head = [[[NSBundle mainBundle]loadNibNamed:@"headerView" owner:nil options:nil]lastObject];
    return head;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
