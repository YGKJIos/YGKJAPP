//
//  FictionTableViewCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/22.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "FictionTableViewCell.h"

@implementation FictionTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        NSArray *arr = @[@"wode_dfk",@"wode_dsy",@"wode_dpj",@"wode_tksh",];
        for (int i = 0; i < 4; i++) {
            
            if (i == 3) {
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                btn.frame = CGRectMake(30+(WIDTH/4-10)*i, 12, 65, 52);
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
                btn.frame = CGRectMake(30+(WIDTH/4-5)*i, 5, 45, 57);
                btn.tag = 1000+i;
                [btn setBackgroundImage:[UIImage imageNamed:arr[i]] forState:UIControlStateNormal];
                [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
                [self.contentView addSubview:btn];
                
//                [self addBtnRedLable:btn];
                UILabel *numLab = [[UILabel alloc]initWithFrame:CGRectMake(30, 0, 18, 18)];
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
}

- (void)addBtnRedLable:(UIButton *)btn
{
    UILabel *numLab = [[UILabel alloc]initWithFrame:CGRectMake(30, 0, 18, 18)];
    numLab.layer.masksToBounds = YES;
    numLab.layer.cornerRadius = 9;
    numLab.textColor = [UIColor whiteColor];
    numLab.font = [UIFont systemFontOfSize:11];
    numLab.text = @"2";
    numLab.textAlignment = NSTextAlignmentCenter;
    numLab.backgroundColor=BGcolor(255, 135, 145);
    [btn addSubview:numLab];
}

- (void)btnAction:(UIButton *)btn
{
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
