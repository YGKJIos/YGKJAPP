//
//  ShowAllTableViewCell.h
//  一个APP
//
//  Created by 梁立彬 on 16/7/24.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    showAllCellStyle,
    erorrCellStyle
}ShowAllAndErorrCellStyle;

@interface ShowAllAndErorrCell : UITableViewCell

- (void)setShowAllAndErorrCellStyle:(ShowAllAndErorrCellStyle)style;

@end
