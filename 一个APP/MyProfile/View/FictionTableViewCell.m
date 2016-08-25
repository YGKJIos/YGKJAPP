//
//  FictionTableViewCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/22.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "FictionTableViewCell.h"
#import "orderViewController.h"
@implementation FictionTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        NSArray *arr = @[@"grzy_tgq",@"grzy_sy",@"grzy_dd",@"wode_tksh"];
        for (int i = 0; i < 4; i++) {
            
            if (i == 3) {
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                btn.frame = CGRectMake(35+(WIDTH/4-10)*i, 14, 60, 50);
                btn.tag = 1000+i;
                [btn setBackgroundImage:[UIImage imageNamed:arr[3]] forState:UIControlStateNormal];
                [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
                [self.contentView addSubview:btn];
                
                UILabel *numLab = [[UILabel alloc]initWithFrame:CGRectMake(38, -5, 18, 18)];
                numLab.layer.masksToBounds = YES;
                numLab.layer.cornerRadius = 9;
                numLab.textColor = [UIColor whiteColor];
                numLab.font = [UIFont systemFontOfSize:11];
                numLab.text = @"2";
                numLab.textAlignment = NSTextAlignmentCenter;
                numLab.backgroundColor=BGcolor(255, 135, 145);
                [btn addSubview:numLab];
            }else{
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                btn.frame = CGRectMake(30+(WIDTH/4-5)*i, 14, 40, 50);
                btn.tag = 1000+i;
                [btn setBackgroundImage:[UIImage imageNamed:arr[i]] forState:UIControlStateNormal];
//                [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
                if (btn.tag == 1000) {
                    [btn addTarget:self action:@selector(firstBtn:) forControlEvents:UIControlEventTouchUpInside];
                }
                if (btn.tag == 1001) {
                    [btn addTarget:self action:@selector(twoBtn:) forControlEvents:UIControlEventTouchUpInside];
                }
                if (btn.tag == 1002) {
                    [btn addTarget:self action:@selector(thirdBtn:) forControlEvents:UIControlEventTouchUpInside];
                }
                [self.contentView addSubview:btn];
                
//                [self addBtnRedLable:btn];
                UILabel *numLab = [[UILabel alloc]initWithFrame:CGRectMake(25, -5, 18, 18)];
                numLab.layer.masksToBounds = YES;
                numLab.layer.cornerRadius = 9;
                numLab.textColor = [UIColor whiteColor];
                numLab.font = [UIFont systemFontOfSize:11];
                numLab.text = @"2";
                numLab.textAlignment = NSTextAlignmentCenter;
                numLab.backgroundColor=BGcolor(255, 135, 145);
                [btn addSubview:numLab];
            }
        }
    }
    return self;
//    UIButton *firstBtn = (UIButton *)[self.contentView viewWithTag:1001];
//    [firstBtn addTarget:self action:@selector(firstAction:) forControlEvents:UIControlEventTouchUpInside];
//    [self.contentView addSubview:firstBtn];
}

- (void)addBtnRedLable:(UIButton *)btn
{
    UILabel *numLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 18, 18)];
    numLab.layer.masksToBounds = YES;
    numLab.layer.cornerRadius = 9;
    numLab.textColor = [UIColor whiteColor];
    numLab.font = [UIFont systemFontOfSize:11];
    numLab.text = @"2";
    numLab.textAlignment = NSTextAlignmentCenter;
    numLab.backgroundColor=BGcolor(255, 135, 145);
    [btn addSubview:numLab];
}



// 退款/售后
- (void)btnAction:(UIButton *)btn
{
    [self.firstDelegate firstDelegate];
}
// 待付款
- (void)firstBtn:(UIButton *)btn
{
    [self.delegate orderDelegate];
}
// 待使用
- (void)twoBtn:(UIButton *)btn
{
    [self.twoDelegate twoDelegate];
}
// 待评价
- (void)thirdBtn:(UIButton *)btn
{
    [self.thirdDelegate thirdDelegate];
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
