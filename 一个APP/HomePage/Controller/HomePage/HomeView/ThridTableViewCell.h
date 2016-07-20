//
//  ThridTableViewCell.h
//  一个APP
//
//  Created by 梁立彬 on 16/6/18.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"

@protocol pushviewcontrollerThridDelegate <NSObject>

- (void)ThridPushViewControllerNum:(NSInteger)num;

@end

typedef  enum{
    lifeServeCellStyle,
    newCellStyle,
    hotJobCellStyle,
    travelCellStyle,
    secondCellStyle
}HomeTaleViewCellStyle;

@interface ThridTableViewCell : UITableViewCell


@property (nonatomic, weak) id<pushviewcontrollerThridDelegate> delegte;
@property (nonatomic, assign)HomeTaleViewCellStyle style;

- (void)setThridCellHomeModel:(HomeModel *)model;
- (void)cellStyle:(HomeTaleViewCellStyle)Style;

@end
