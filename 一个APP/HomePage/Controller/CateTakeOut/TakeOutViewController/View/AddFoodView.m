//
//  AddFoodView.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/6.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "AddFoodView.h"

@implementation AddFoodView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *shopImage = [[UIImageView alloc]initWithFrame:CGRectMake(30, 12, 25, 25)];
        shopImage.image = [UIImage imageNamed:@"waimai_gouwuchehui"];
        [self addSubview:shopImage];
        
        UILabel *numLab = [[UILabel alloc]initWithFrame:CGRectMake(42.5, 8, 18, 18 )];
        numLab.textColor = [UIColor whiteColor];
        numLab.text = @"1";
        numLab.textAlignment = NSTextAlignmentCenter;
        numLab.font = [UIFont systemFontOfSize:14];
        numLab.layer.masksToBounds = YES;
        numLab.layer.cornerRadius = 9;
        numLab.backgroundColor = BGcolor(250, 83, 48);
        [self addSubview:numLab];
        
        UILabel *orderLab = [[UILabel alloc]initWithFrame:CGRectMake(shopImage.x+shopImage.width+10, 14.5, WIDTH - 145, 20)];
        orderLab.textColor = BGcolor(143, 143, 143);
        orderLab.text = @"您还未选择任何菜品";
        [self addSubview:orderLab];
        
        UILabel *orderMoneyLab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH-145, 0, 145, 49)];
        orderMoneyLab.backgroundColor = BGcolor(137, 137, 137);
        orderMoneyLab.textColor = [UIColor whiteColor];
        orderMoneyLab.text = @"15元起送价";
        orderMoneyLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:orderMoneyLab];
        
    }
    return self;
}


+ (AddFoodView *)CreateAddFoodView
{
   
    AddFoodView *view = [[NSBundle mainBundle]loadNibNamed:@"AddFoodView" owner:nil options:nil].lastObject;
    view.orderNum.layer.masksToBounds = YES;
    view.orderNum.layer.cornerRadius = view.orderNum.width/2;
//    view.orderNum.hidden = YES;
    
    return view;
}

- (void)setModel:(MerchantInformationModel *)model
{
    NSString *title = [NSString stringWithFormat:@"%@元起送价",model.qisongjia];
    [self.orderMoneyBtn setTitle:title forState:UIControlStateNormal];
    self.orderNum.hidden = YES;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
