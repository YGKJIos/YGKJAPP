//
//  SecondHandTableViewCell.h
//  一个APP
//
//  Created by 远古科技 on 16/6/30.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondHandTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *SecondHandImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *niceImage;
@property (weak, nonatomic) IBOutlet UILabel *introduceLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UIImageView *phoneImage;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;



+ (SecondHandTableViewCell *) createSecondHandCell;


@end
