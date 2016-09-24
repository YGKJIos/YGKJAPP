//
//  MovieShopTableViewCell.h
//  一个APP
//
//  Created by 远古科技 on 16/9/20.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieShopModel.h"
#import "BaseTableViewCell.h"
@interface MovieShopTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *MovieShopImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *jieshaoLab;
@property (weak, nonatomic) IBOutlet UILabel *addressLab;



+ (MovieShopTableViewCell *) createCell;

- (void)MovieShopModel:(MovieShopModel *)model;

@end


