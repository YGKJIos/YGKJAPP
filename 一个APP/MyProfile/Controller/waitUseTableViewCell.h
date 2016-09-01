//
//  waitUseTableViewCell.h
//  一个APP
//
//  Created by 远古科技 on 16/8/23.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "waitUseModel.h"
#import "BaseTableViewCell.h"


@interface waitUseTableViewCell : BaseTableViewCell

@property (weak, nonatomic) IBOutlet UILabel *foodNameLab;
@property (weak, nonatomic) IBOutlet UILabel *numLab;
@property (weak, nonatomic) IBOutlet UILabel *quanLab;
@property (weak, nonatomic) IBOutlet UILabel *priceLab;
@property (weak, nonatomic) IBOutlet UILabel *qmLab;


+ (waitUseTableViewCell *)createCell;

- (void)waitUseModel:(waitUseModel *)model;

@end
