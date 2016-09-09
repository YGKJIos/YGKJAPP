//
//  ZGP_AddDetailsViewController.h
//  MerchantPort
//
//  Created by Tiny on 16/8/27.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PleaseJobModel.h"
#import "MerchantInformationModel.h"
@interface ZGP_AddDetailsViewController : UIViewController
@property (nonatomic, strong)PleaseJobModel *model;

@property (nonatomic, copy) NSString *telephoneNum;

- (void)setHeaderModel:(MerchantInformationModel *)model;

@end
