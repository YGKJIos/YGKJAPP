//
//  LearnCollectionViewCell.h
//  一个APP
//
//  Created by 梁立彬 on 16/7/4.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LearnModel.h"
#import "BaseCollectionViewCell.h"

@interface LearnCollectionViewCell : BaseCollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *learnImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *starImage;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UILabel *TongzhiLabel;
@property (weak, nonatomic) IBOutlet UIImageView *placeImage;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;

- (void)LearnModel:(LearnModel *)model;

@end
