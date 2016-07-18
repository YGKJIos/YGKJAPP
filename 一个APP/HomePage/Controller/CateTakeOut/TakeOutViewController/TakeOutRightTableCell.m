//
//  TakeOutRightTableCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/6.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "TakeOutRightTableCell.h"

@implementation TakeOutRightTableCell

static NSInteger num; //点击增加 菜品份数计数

- (void)setTakeOutRightTableModel:(TakeOutModel *)model
{
    
}

- (void)addBtnClickAction:(NSIndexPath *)indexPath
{
    num = 0;
    [self.jiaBtn addTarget:self action:@selector(addBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.jianBtn addTarget:self action:@selector(jianBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - 加、减按钮的点击方法
- (void)addBtnClick:(NSIndexPath *)indexPath
{
    ++num;
    if (num >= 1) {
        self.jianBtn.hidden = NO;
        self.numberLab.hidden = NO;
        self.numberLab.text = [NSString stringWithFormat:@"%ld",num];
    }
    
}
- (void)jianBtnClick:(NSIndexPath *)indexPath
{
    if (num <= 0) {
        return;
    }else{
        --num;
        self.numberLab.text = [NSString stringWithFormat:@"%ld",num];
        if (num == 0) {
            self.jianBtn.hidden = YES;
            self.numberLab.hidden = YES;
        }
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
