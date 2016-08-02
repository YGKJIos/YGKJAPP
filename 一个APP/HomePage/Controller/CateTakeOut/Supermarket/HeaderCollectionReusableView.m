//
//  HeaderCollectionReusableView.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/29.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "HeaderCollectionReusableView.h"

@implementation HeaderCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        NSArray *images = @[@"chaoshi_tu",@"chaoshi_tu",@"chaoshi_tu",@"chaoshi_tu",];
        ScrollView *scroll = [ScrollView CreateScrollViewImages:images];
        [self addSubview:scroll];
        
    }
    return self;
}


@end
