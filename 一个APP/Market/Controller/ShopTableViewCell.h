//
//  ShopTableViewCell.h
//  一个APP
//
//  Created by 远古科技 on 16/7/9.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopModel.h"

@interface ShopTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *shopImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *starImage;
@property (weak, nonatomic) IBOutlet UILabel *fenLabel;
@property (weak, nonatomic) IBOutlet UILabel *jieshaoLabel;
@property (weak, nonatomic) IBOutlet UILabel *danjiaLabel;
@property (weak, nonatomic) IBOutlet UILabel *juliLabel;
@property (weak, nonatomic) IBOutlet UIImageView *tehuiImage;

+ (ShopTableViewCell *) createShopCell;

- (void) ShopModel:(ShopModel *)model;
@end
