//
//  VoucherTableViewController.h
//  一个APP
//
//  Created by 梁立彬 on 16/7/23.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MerchantInformationModel.h"

@interface VoucherTableViewController : UITableViewController
@property (nonatomic, strong)MerchantInformationModel *model; // 传详情的model
@property (nonatomic, strong)NSMutableArray *shopArr;
@property (nonatomic, strong) NSString *num;
@end
