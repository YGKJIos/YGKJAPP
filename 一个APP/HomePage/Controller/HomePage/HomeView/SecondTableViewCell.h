//
//  SecondTableViewCell.h
//  一个APP
//
//  Created by 梁立彬 on 16/6/18.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol pushViewControllerSecondDelegate <NSObject>

- (void)SecondPushViewControllerNum:(NSInteger)num;

@end


@interface SecondTableViewCell : UITableViewCell

@property (nonatomic, weak)id<pushViewControllerSecondDelegate>delegate;
- (void)setSecondCellImage:(NSArray *)images;



@end
