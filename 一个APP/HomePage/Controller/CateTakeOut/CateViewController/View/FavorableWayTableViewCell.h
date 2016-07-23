//
//  FavorableWayTableViewCell.h
//  一个APP
//
//  Created by 梁立彬 on 16/7/21.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavorableWayTableViewCell : UITableViewCell

@property (nonatomic, strong)UIImageView *wayImage; // 特惠& 代金券 图片
@property (nonatomic, strong)UILabel *favorableLab; // 特惠& 代金券
@property (nonatomic, strong)UILabel *totalLab;

@end
