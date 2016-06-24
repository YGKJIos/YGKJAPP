//
//  profileHeaderView.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/21.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "profileHeaderView.h"

@implementation profileHeaderView


+ (profileHeaderView *)CreateProfileHeaderView{
    profileHeaderView *view = [[NSBundle mainBundle]loadNibNamed:@"profileHeaderView" owner:nil options:nil].lastObject;
    view.headImage.layer.masksToBounds = YES;
    view.headImage.layer.cornerRadius = view.headImage.width/2;
    return view;
}

- (void)setHeadImage:(NSString *)image name:(NSString *)name{
    
    self.headImage.image = [UIImage imageNamed:image];
    self.nameLab.text = name;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
