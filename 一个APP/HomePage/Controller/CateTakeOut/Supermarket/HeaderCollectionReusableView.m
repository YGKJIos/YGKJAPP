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
        
    }
    return self;
}

- (void)setScrollViewImage:(NSArray *)images
{
    ScrollView *scroll = [ScrollView CreateScrollViewImages:images];
    
    [self addSubview:scroll];
}

@end
