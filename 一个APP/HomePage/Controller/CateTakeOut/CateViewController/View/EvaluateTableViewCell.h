//
//  EvaluateTableViewCell.h
//  一个APP
//
//  Created by 梁立彬 on 16/7/23.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EvaluateTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userHeadImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (weak, nonatomic) IBOutlet UILabel *contentLab;

+ (EvaluateTableViewCell *)CreateEvaluateCellNib;

@end
