//
//  SupermarketCollectionViewCell.h
//  一个APP
//
//  Created by 梁立彬 on 16/6/27.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SupermarketCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *commodityImage;
@property (weak, nonatomic) IBOutlet UILabel *describeLab;
@property (weak, nonatomic) IBOutlet UILabel *qualityLab;
@property (weak, nonatomic) IBOutlet UILabel *moneyLab;

@end
