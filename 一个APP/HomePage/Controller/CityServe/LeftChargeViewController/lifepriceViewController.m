//
//  lifepriceViewController.m
//  一个APP
//
//  Created by 远古科技 on 16/7/18.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "lifepriceViewController.h"

@interface lifepriceViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *priceField;

@end
@implementation lifepriceViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    self.priceField.delegate = self;
    
    // 手势
    // 点击
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [self.view addGestureRecognizer:tap];
}

// 点击 空白回收键盘方法
- (void)tapAction:(UITapGestureRecognizer *)tap
{
    [self.priceField resignFirstResponder];
}

// 点击return回收键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.priceField resignFirstResponder];
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
