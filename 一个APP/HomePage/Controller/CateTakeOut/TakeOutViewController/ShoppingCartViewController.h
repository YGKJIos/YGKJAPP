//
//  ShoppingCartViewController.h
//  一个APP
//
//  Created by 梁立彬 on 16/7/9.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MerchantInformationModel.h"

@interface ShoppingCartViewController : UIViewController
@property (nonatomic, strong)NSMutableArray *selectArr;
@property (nonatomic, strong)MerchantInformationModel *shopModel;

@end
