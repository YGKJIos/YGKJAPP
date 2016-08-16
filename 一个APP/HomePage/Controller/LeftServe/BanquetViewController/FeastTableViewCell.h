//
//  FeastTableViewCell.h
//  一个APP
//
//  Created by 远古科技 on 16/7/4.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MerchantInformationModel.h"

@interface FeastTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *feastImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *starImage;
@property (weak, nonatomic) IBOutlet UILabel *numlabel;
@property (weak, nonatomic) IBOutlet UILabel *introduceLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UIImageView *placeImage;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;

+ (FeastTableViewCell *) creactFeastCell;
- (void)setModel:(MerchantInformationModel *)model;

@end
