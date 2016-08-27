//
//  TKTableViewCell.h
//  一个APP
//
//  Created by 远古科技 on 16/8/26.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TKModel.h"
@interface TKTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (weak, nonatomic) IBOutlet UILabel *bzLab;





+ (TKTableViewCell *)createCell;

- (void)TKMdel:(TKModel *)model;

@end
