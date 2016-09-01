//
//  shopCollectionViewCell.h
//  一个APP
//
//  Created by 远古科技 on 16/7/16.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopServeModel.h"
#import "BaseCollectionViewCell.h"

@interface shopCollectionViewCell : BaseCollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *dazheImage;
@property (weak, nonatomic) IBOutlet UIImageView *shopImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *jieshaoLabel;
@property (weak, nonatomic) IBOutlet UIImageView *placeImage;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;
- (void)setShopCollectionModel:(ShopServeModel *)model;


@end
