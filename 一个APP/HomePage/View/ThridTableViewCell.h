//
//  ThridTableViewCell.h
//  一个APP
//
//  Created by 梁立彬 on 16/6/18.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef  enum{
    lifeServeCellStyle,
    newCellStyle,
    hotJobCellStyle,
    travelCellStyle,
    secondCellStyle
}HomeTaleViewCellStyle;

@interface ThridTableViewCell : UITableViewCell


- (void)setThridCellImage:(NSArray *)images titles:(NSArray *)titles;
- (void)cellStyle:(HomeTaleViewCellStyle)Style;


@end
