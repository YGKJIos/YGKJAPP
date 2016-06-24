//
//  AddressHeaderView.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/11.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "AddressHeaderView.h"
#import "SearchView.h"

@interface AddressHeaderView ()
@property (nonatomic, strong)SearchView *searchView;

@end

@implementation AddressHeaderView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createAddressHeaderView];
    }
    return self;
}

// 创建 tableview的headerView
- (void)createAddressHeaderView
{
    NSArray *arr = @[@"zuijin_lianxi",@"qunzu",@"xin_pengyou"];
//    NSArray *textArr = @[@"最近联系",@"群组" , @"新朋友"];
    self.searchView = [[SearchView alloc]initWithFrame:CGRectMake(15, 10, self.frame.size.width-30, 40)];
    [self.searchView setPlaceholderText:@"搜索"];
    [self addSubview:self.searchView];
    
    for (int i = 0; i < 3; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        if (i == 0) {
            button.frame = CGRectMake(self.frame.size.width/3*i+35, self.searchView.frame.size.height+40, 63, 74);
        }else{
            
            button.frame = CGRectMake(self.frame.size.width/3*i+44, self.searchView.frame.size.height+40, 50, 74);
        }
        [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundImage:[UIImage imageNamed:arr[i]] forState:UIControlStateNormal];
        [self addSubview:button];
        

    }
    UILabel *textLab = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height-2, self.frame.size.width, 1)];
    textLab.backgroundColor = BGcolor(230, 230, 230);
    [self addSubview:textLab];
}
- (void)buttonAction
{
    NSLog(@"buttonAction");
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
