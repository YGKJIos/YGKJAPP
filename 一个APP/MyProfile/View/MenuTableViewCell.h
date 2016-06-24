//
//  MenuTableViewCell.h
//  一个APP
//
//  Created by 梁立彬 on 16/6/22.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *MenuImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *balanceLab;

- (void)setMenuNotHaveSubLab;

@end
