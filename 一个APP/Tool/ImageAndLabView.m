//
//  ImageAndLabView.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/27.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "ImageAndLabView.h"

@implementation ImageAndLabView


+ (ImageAndLabView *)createViewNib
{
    ImageAndLabView *view = [[NSBundle mainBundle]loadNibNamed:@"ImageAndLabView" owner:nil options:nil].lastObject;
    
    
    return view;
}
- (void)setImages:(NSString *)image names:(NSString *)name
{
    [self.imageBtn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [self.imageBtn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    self.nameLab.text = name;
    
}

- (void)clickAction:(UIButton *)btn
{
    [self.delegate imageAndLableViewPush];
}


@end
