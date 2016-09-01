//
//  GameTableViewCell.h
//  一个APP
//
//  Created by 远古科技 on 16/6/27.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewCell.h"
#import "GameModel.h"
@interface GameTableViewCell : BaseTableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *placeImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *xingImage;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UILabel *jsLabel;
@property (weak, nonatomic) IBOutlet UILabel *rmbLabel;
@property (weak, nonatomic) IBOutlet UILabel *piceLabel;
@property (weak, nonatomic) IBOutlet UILabel *oldPiceLabel;
@property (weak, nonatomic) IBOutlet UILabel *adressLabel;


+ (GameTableViewCell *) createGameCell;

- (void)GameModel: (GameModel *) model;

@end
