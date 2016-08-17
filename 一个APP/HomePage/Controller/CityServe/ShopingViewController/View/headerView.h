//
//  headerView.h
//  一个APP
//
//  Created by 远古科技 on 16/7/22.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MerchantInformationModel.h"

@interface headerView : UIView

// 评分
@property (weak, nonatomic) IBOutlet UILabel *gradeLab;
@property (weak, nonatomic) IBOutlet UIImageView *image;

+ (headerView *)greateHeaderView;
- (void)setModel:(MerchantInformationModel *)model;

@end
