//
//  AppraiseTableViewCell.m
//  一个APP
//
//  Created by 远古科技 on 16/8/8.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "AppraiseTableViewCell.h"

@implementation AppraiseTableViewCell

+ (AppraiseTableViewCell *)createCell
{
    AppraiseTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"AppraiseTableViewCell" owner:nil options:nil]lastObject];
    return cell;
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
