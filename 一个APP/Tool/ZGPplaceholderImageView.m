//
//  ZGPplaceholderImageView.m
//  一个APP
//
//  Created by Tiny on 16/8/20.
//  Copyright © 2016年 祝高鹏. All rights reserved.
//

#import "ZGPplaceholderImageView.h"

@implementation ZGPplaceholderImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatSubView];
    }
    return self;
}

- (void)creatSubView
{
    _placeholderImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    _placeholderImage.image = [UIImage imageNamed:@"zhanwei.png"];
    [self addSubview:_placeholderImage];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
