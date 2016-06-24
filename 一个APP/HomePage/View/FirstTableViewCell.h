//
//  FirstTableViewCell.h
//  一个APP
//
//  Created by 梁立彬 on 16/6/18.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol pushViewControllerDelegate <NSObject>

- (void)pushViewController;

@end


@interface FirstTableViewCell : UITableViewCell

@property (nonatomic, assign)id<pushViewControllerDelegate>delegate;
- (void)setFirstCellImage:(NSArray *)images;

@end
