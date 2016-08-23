//
//  PlaceOrderTableViewCell.m
//  一个APP
//
//  Created by 远古科技 on 16/8/10.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "PlaceOrderTableViewCell.h"
@implementation PlaceOrderTableViewCell

+(PlaceOrderTableViewCell *)createCell
{
    PlaceOrderTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"PlaceOrderTableViewCell" owner:nil options:nil]lastObject];
    return cell;
    
}

- (void)addGoods
{
    
    int num = [self.numLbl.text intValue] + 1;
    
    self.numLbl.text = [NSString stringWithFormat:@"%d", num];
    
    if (num == 1) {
        //该商品加入购物车之后，设置"数量""减号"的位置
        self.numLbl.frame = CGRectMake(self.addBtn.x - 23, self.addBtn.y, 23, self.addBtn.height);
        
        self.reduceBtn.frame = self.addBtn.frame;
        
        self.reduceBtn.x = self.numLbl.x - self.addBtn.width;
    }
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
