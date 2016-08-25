//
//  waitUseTableViewCell.h
//  一个APP
//
//  Created by 远古科技 on 16/8/23.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "waitUseModel.h"

@interface waitUseTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *foodNameLab;
@property (weak, nonatomic) IBOutlet UIImageView *waitBtn;
@property (weak, nonatomic) IBOutlet UIImageView *lookNumBtn;
@property (weak, nonatomic) IBOutlet UIImageView *foodImage;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (weak, nonatomic) IBOutlet UILabel *numLab;
@property (weak, nonatomic) IBOutlet UILabel *priceLab;




+ (waitUseTableViewCell *)createCell;

- (void)waitUseModel:(waitUseModel *)model;

@end
