//
//  evaluateTableViewCell.m
//  一个APP
//
//  Created by 远古科技 on 16/7/23.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "evaluateTableViewCell.h"

@implementation evaluateTableViewCell

+ (evaluateTableViewCell *)greateEvaluateCell
{
    evaluateTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"evaluateTableViewCell" owner:nil options:nil]lastObject];
    return cell;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
// 综合评价按钮
- (IBAction)evaluateBtn:(id)sender {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
