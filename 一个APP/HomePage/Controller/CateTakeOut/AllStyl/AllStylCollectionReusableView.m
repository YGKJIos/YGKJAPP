//
//  AllStylCollectionReusableView.m
//  一个APP
//
//  Created by 远古科技 on 16/6/29.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "AllStylCollectionReusableView.h"

@implementation AllStylCollectionReusableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.headImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 20, 247, 30)];
        [self addSubview:self.headImage];
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}


@end
