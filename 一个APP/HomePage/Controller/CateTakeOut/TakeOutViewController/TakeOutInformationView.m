//
//  InformationView.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/5.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "TakeOutInformationView.h"

@implementation TakeOutInformationView

+(TakeOutInformationView *)CreateInformationNib
{
    TakeOutInformationView *view = [[NSBundle mainBundle]loadNibNamed:@"TakeOutInformationView" owner:nil options:nil].lastObject;
    return view;
}


@end
