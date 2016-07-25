//
//  PlayerGroupCollectionReusableView.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/25.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "PlayerGroupCollectionReusableView.h"

@implementation PlayerGroupCollectionReusableView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.groupLab = [[UILabel alloc]initWithFrame:CGRectMake(30, 15, 159, 20)];
        [self addSubview:self.groupLab];
    }
    return self;
}

@end
