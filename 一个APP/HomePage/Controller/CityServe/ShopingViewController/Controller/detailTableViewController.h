//
//  detailTableViewController.h
//  一个APP
//
//  Created by 远古科技 on 16/7/22.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MerchantInformationModel.h"

@interface detailTableViewController : UITableViewController

@property (nonatomic, strong)MerchantInformationModel *model;
@property (nonatomic, strong) NSString *num;


@end
