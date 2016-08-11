//
//  PlaceOrderFootView.m
//  一个APP
//
//  Created by 远古科技 on 16/8/11.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "PlaceOrderFootView.h"

@implementation PlaceOrderFootView

+ (PlaceOrderFootView *)createCell
{
    PlaceOrderFootView *cell = [[[NSBundle mainBundle] loadNibNamed:@"PlaceOrderFootView" owner:nil options:nil]lastObject];
    return cell;
}
// 确认订单按钮
- (IBAction)sureBtn:(id)sender {
    
}

@end
