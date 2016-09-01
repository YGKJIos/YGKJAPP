//
//  TravelTableViewCell.h
//  一个APP
//
//  Created by 远古科技 on 16/7/4.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TravelModel.h"
#import "BaseTableViewCell.h"
@interface TravelTableViewCell : BaseTableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *travelImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *starImage;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UILabel *introduceLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *placeImage;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;

- (void)TravelModel:(TravelModel *)model;

+ (TravelTableViewCell *) createTravelCell;
@end
