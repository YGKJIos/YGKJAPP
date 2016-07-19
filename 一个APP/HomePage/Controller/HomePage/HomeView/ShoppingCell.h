//
//  ShoppingCell.h
//  一个APP
//
//  Created by 梁立彬 on 16/6/21.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ShopingPushDelegate <NSObject>

- (void)shopingPushDelegateMethod;

@end

@interface ShoppingCell : UITableViewCell

@property (nonatomic, assign)id<ShopingPushDelegate>delegate;
- (void)setShoppingCellImage:(NSArray *)images;

@end
