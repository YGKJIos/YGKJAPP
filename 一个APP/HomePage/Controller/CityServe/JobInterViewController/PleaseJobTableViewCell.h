//
//  PleaseJobTableViewCell.h
//  一个APP
//
//  Created by 梁立彬 on 16/7/1.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PleaseJobModel.h"
#import "BaseTableViewCell.h"
@interface PleaseJobTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *informationLab;
@property (weak, nonatomic) IBOutlet UILabel *locationLab;
@property (weak, nonatomic) IBOutlet UILabel *degreeLab;
@property (weak, nonatomic) IBOutlet UILabel *yearLab;
@property (weak, nonatomic) IBOutlet UILabel *moenyLab;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (weak, nonatomic) IBOutlet UIImageView *fuliImage;
@property (weak, nonatomic) IBOutlet UIImageView *fuliImage2;
@property (weak, nonatomic) IBOutlet UIImageView *fuliImage3;

+ (PleaseJobTableViewCell *)createJobCell;

- (void) JobModel:(PleaseJobModel *)model;

@end
