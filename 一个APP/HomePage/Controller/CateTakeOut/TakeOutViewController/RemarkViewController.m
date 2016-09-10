//
//  RemarkViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/13.
//  Copyright © 2016年 llb. All rights reserved.
//

// 备注页面
#import "RemarkViewController.h"

@interface RemarkViewController ()<UITextFieldDelegate>
@property (nonatomic, strong)UITextField *remarkText;
@end

@implementation RemarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.remarkText = [UITextField newAutoLayoutView];
    [self.view addSubview:_remarkText];
    _remarkText.placeholder = @"请写下自己的口味，需求等要求，已便商家备餐";
    [_remarkText autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:30];
    [_remarkText autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:30];
    [_remarkText autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
    [_remarkText autoSetDimension:ALDimensionHeight toSize:160];
    
    [_remarkText drawPlaceholderInRect:CGRectMake(0, 0, _remarkText.width, 20)];
    _remarkText.backgroundColor = BGcolor(235, 235, 235);
    _remarkText.layer.masksToBounds = YES;
    _remarkText.layer.cornerRadius = 5;
    UIBarButtonItem *leftItem = [UIBarButtonItem itemWithTarget:self action:@selector(fanhui) image:@"meishi_fanghui" highImage:@"meishi_fanghui"];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.width = 40;
    rightBtn.height = 40;
    [rightBtn setTitle:@"完成" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(chenggong) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)chenggong
{
    [self.delegate passValue:_remarkText.text];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)fanhui
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
