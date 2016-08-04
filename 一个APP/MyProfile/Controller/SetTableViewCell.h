//
//  SetTableViewCell.h
//  一个APP
//
//  Created by 远古科技 on 16/7/29.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *rightImage;


+ (SetTableViewCell *)createCell;

@end
