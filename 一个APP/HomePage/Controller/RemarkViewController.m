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

@end

@implementation RemarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITextField *remarkText = [UITextField newAutoLayoutView];
    [self.view addSubview:remarkText];
    remarkText.placeholder = @"请写下自己的口味，需求等要求，已便商家备餐";
    [remarkText autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:30];
    [remarkText autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:30];
    [remarkText autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
    [remarkText autoSetDimension:ALDimensionHeight toSize:160];
    
    [remarkText drawPlaceholderInRect:CGRectMake(0, 0, remarkText.width, 20)];
    remarkText.backgroundColor = BGcolor(235, 235, 235);
    remarkText.layer.masksToBounds = YES;
    remarkText.layer.cornerRadius = 5;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
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
