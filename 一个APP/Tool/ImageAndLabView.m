//
//  ImageAndLabView.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/27.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "ImageAndLabView.h"

@implementation ImageAndLabView


+ (ImageAndLabView *)createViewNibWithImageArr:(NSArray *)images nameArr:(NSArray *)names
{
    ImageAndLabView *view = [[NSBundle mainBundle]loadNibNamed:@"ImageAndLabView" owner:nil options:nil].lastObject;
    
    
    return view;
}
- (void)setImages:(NSArray *)images names:(NSArray *)names
{
    for (int i = 0; i < images.count; i++) {
        [self.imageBtn setBackgroundImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        [self.imageBtn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
        self.nameLab.text = names[i];
    }
}

- (void)clickAction:(UIButton *)btn
{
    NSLog(@"你点击了---- ImageAndLabView");
}


@end
