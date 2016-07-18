//
//  AllStylCollectionViewCell.m
//  一个APP
//
//  Created by 远古科技 on 16/6/29.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "AllStylCollectionViewCell.h"

@implementation AllStylCollectionViewCell


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView{
    self.nanmeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, self.frame.size.width, 30)];
    [self addSubview:self.nanmeLabel];
    
    self.foodImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 60)];
    [self addSubview:self.foodImage];
    
}

- (void)setImages:(NSString *)image titles:(NSString *)title
{
    self.nanmeLabel.text = title;
    if (image == nil) {
        self.foodImage.image = [UIImage imageNamed:image];
        return;
    }
}


@end
