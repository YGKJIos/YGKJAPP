//
//  FoodHomeCell.h
//  一个APP
//
//  Created by 梁立彬 on 16/6/20.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
@protocol FoodHomePushDelegate <NSObject>

- (void)foodHomePushDelegateMethod;

@end

@interface FoodHomeCell : UITableViewCell
@property (nonatomic, assign)id<FoodHomePushDelegate>delegate;
- (void)setFoodCellModel:(HomeModel *)model;



@end
