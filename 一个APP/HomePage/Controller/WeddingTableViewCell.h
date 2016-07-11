//
//  WeddingTableViewCell.h
//  一个APP
//
//  Created by 远古科技 on 16/7/1.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "weddingModel.h"
@interface WeddingTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *weddingImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *starImage;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UIImageView *fairImage;
@property (weak, nonatomic) IBOutlet UILabel *piceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *placeImage;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;


+ (WeddingTableViewCell *) createWeddingCell;

- (void)weddingModel:(weddingModel *)model;



@end
