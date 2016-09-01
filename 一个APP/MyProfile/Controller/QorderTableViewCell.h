//
//  QorderTableViewCell.h
//  一个APP
//
//  Created by 远古科技 on 16/8/25.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QorderModel.h"

@protocol QorderDelegate <NSObject>


@end

@interface QorderTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *tiameLab;

@property (weak, nonatomic) IBOutlet UILabel *bzLab;

@property (weak, nonatomic) IBOutlet UILabel *jiedanLab;

@property (weak, nonatomic) IBOutlet UIButton *sureBtn;


@property (nonatomic, assign) id<QorderDelegate>delegate;

+ (QorderTableViewCell *)createCell;
- (void)QorderModel:(QorderModel *)model;

@end
