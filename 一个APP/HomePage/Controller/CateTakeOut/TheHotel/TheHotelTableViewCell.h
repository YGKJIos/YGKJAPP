//
//  TheHotelTableViewCell.h
//  一个APP
//
//  Created by 梁立彬 on 16/6/25.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TheHotelModel.h"
#import "BaseTableViewCell.h"
@interface TheHotelTableViewCell : BaseTableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *hotelImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *tongzhiLab;






+ (TheHotelTableViewCell *)createTheHotelCell;

- (void) TheHotelModel:(TheHotelModel *)model;

@end
