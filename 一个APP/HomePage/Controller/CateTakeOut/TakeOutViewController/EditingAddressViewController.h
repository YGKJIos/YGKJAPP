//
//  EditingAddressViewController.h
//  一个APP
//
//  Created by 梁立彬 on 16/7/13.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MerchantInformationModel.h"

@protocol addressInformation <NSObject>

- (void)selectAddressInformation:(MerchantInformationModel *)model;

@end

@interface EditingAddressViewController : UIViewController
@property (nonatomic, assign)id<addressInformation>delegate;

@end
