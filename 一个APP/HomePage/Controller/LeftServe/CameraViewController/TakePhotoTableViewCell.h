//
//  TakePhotoTableViewCell.h
//  一个APP
//
//  Created by 远古科技 on 16/7/2.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoModel.h"
@interface TakePhotoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *childImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *starImage;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UILabel *writingLabel;
@property (weak, nonatomic) IBOutlet UIImageView *phoneImage;
@property (weak, nonatomic) IBOutlet UIImageView *placeImage;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;

+ (TakePhotoTableViewCell *) createTakePhotoCell;

- (void)PhotoModel:(PhotoModel *) model;

@end
