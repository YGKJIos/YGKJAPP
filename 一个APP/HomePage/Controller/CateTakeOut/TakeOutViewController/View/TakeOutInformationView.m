//
//  InformationView.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/5.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "TakeOutInformationView.h"
static NSString *bendi = @"http://192.168.1.88:8080/shangcheng";

@implementation TakeOutInformationView

+(TakeOutInformationView *)CreateInformationNib
{
    TakeOutInformationView *view = [[NSBundle mainBundle]loadNibNamed:@"TakeOutInformationView" owner:nil options:nil].lastObject;
    return view;
}
- (void)setModel:(TakeOutModel *)model
{
    
}


@end
