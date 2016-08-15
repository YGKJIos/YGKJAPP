//
//  carDetailHeaderView.h
//  一个APP
//
//  Created by 远古科技 on 16/7/23.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MerchantInformationModel.h"

@interface DetailTableHeaderView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *shopHeadImage;
@property (weak, nonatomic) IBOutlet UILabel *shopName;
@property (weak, nonatomic) IBOutlet UILabel *grade;
@property (weak, nonatomic) IBOutlet UILabel *addressLab;
@property (nonatomic, copy) NSString *telephoneNum;

- (IBAction)phoneBtn:(id)sender;
+ (DetailTableHeaderView *)greateHeaderView;
- (void)setHeaderModel:(MerchantInformationModel *)model;



@end
