//
//  profileHeaderView.h
//  一个APP
//
//  Created by 梁立彬 on 16/6/21.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface profileHeaderView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;

+ (profileHeaderView *)CreateProfileHeaderView;

- (void)setHeadImage:(NSString *)image name:(NSString *)name;

@end
