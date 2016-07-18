//
//  sevCarTableViewCell.h
//  一个APP
//
//  Created by 远古科技 on 16/7/2.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarModel.h"
@interface sevCarTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *sevCarImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *starImage;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UILabel *stylLabel;
@property (weak, nonatomic) IBOutlet UIImageView *sammlImage;
@property (weak, nonatomic) IBOutlet UIImageView *adressImage;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;


+ (sevCarTableViewCell *) createSevCarCell;

- (void)CarModel:(CarModel *) model;

@end
