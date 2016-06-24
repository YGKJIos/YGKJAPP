//
//  HomeTableViewCell.h
//  一个APP
//
//  Created by 梁立彬 on 16/6/17.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    fooderHomeTableViewCell,  //
    cityHomeTableViewCell,   // 同城服务cell
    imageHomeTableViewCell   // 生活服务
    
}HomeTableViewCellStyle;

@interface HomeTableViewCell : UITableViewCell

//@property (nonatomic, strong)NSArray *fooderArr;
//@property (nonatomic, strong)NSArray *cityArr;
//@property (nonatomic, strong)NSArray *lifeArr;
@property (nonatomic, assign)HomeTableViewCellStyle style;
- (void)setHomeCellModelView:(NSArray *)modelArr;

@end
