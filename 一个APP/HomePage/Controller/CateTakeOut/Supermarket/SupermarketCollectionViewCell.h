//
//  SupermarketCollectionViewCell.h
//  一个APP
//
//  Created by 梁立彬 on 16/6/27.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZGP_SuperMarketModel.h"
#import "BaseCollectionViewCell.h"
@interface SupermarketCollectionViewCell :BaseCollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *commodityImage;
@property (weak, nonatomic) IBOutlet UILabel *describeLab;
@property (weak, nonatomic) IBOutlet UILabel *qualityLab;
@property (weak, nonatomic) IBOutlet UILabel *moneyLab;

+ (SupermarketCollectionViewCell *) createMoiveCell;

- (void)ZGP_SuperMarketModel:(ZGP_SuperMarketModel *) model;

@end
