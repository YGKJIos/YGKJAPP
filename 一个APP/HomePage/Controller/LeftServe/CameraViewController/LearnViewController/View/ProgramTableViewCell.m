//
//  ProgramTableViewCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/25.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "ProgramTableViewCell.h"

@implementation ProgramTableViewCell

+ (ProgramTableViewCell *)createProgramCellNib
{
    ProgramTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"ProgramTableViewCell" owner:nil options:nil].lastObject;
    return cell;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)programBtn:(id)sender {
    
    UIButton *btn = sender;
    [btn setBackgroundImage:[UIImage imageNamed:@"learn_selectVote"] forState:UIControlStateNormal];
    
}
@end
