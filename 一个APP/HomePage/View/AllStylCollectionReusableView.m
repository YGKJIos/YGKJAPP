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
        self.cookImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 50, 50)];
        self.cookImage.backgroundColor = [UIColor redColor];
        self.foodLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 5, 50, 50)];
//        self.foodLabel.backgroundColor = [UIColor greenColor];
        self.foodLabel.text = @"美食";
        self.LineLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 30, WIDTH - 240, 1)];
        self.LineLabel.backgroundColor = [UIColor blackColor];
        
        [self addSubview:self.cookImage];
        [self addSubview:self.foodLabel];
        [self addSubview:self.LineLabel];
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}


@end
