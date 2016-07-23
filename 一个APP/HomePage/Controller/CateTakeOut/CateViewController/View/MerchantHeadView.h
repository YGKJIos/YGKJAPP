//
//  MerchantHeadView.h
//  一个APP
//
//  Created by 梁立彬 on 16/7/21.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MerchantHeadView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *merchantImage; //闪家图片
@property (weak, nonatomic) IBOutlet UILabel *merchantName; // 商家 名字
@property (weak, nonatomic) IBOutlet UILabel *locationLab; // 定位
@property (weak, nonatomic) IBOutlet UILabel *timeLab; // 营业时间
- (IBAction)telephoneBtn:(id)sender; // 电话
@property (weak, nonatomic) IBOutlet UILabel *gradeLab; // 评分


@end
