//
//  SetNameViewController.m
//  一个APP
//
//  Created by 远古科技 on 16/8/16.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "SetNameViewController.h"
@interface SetNameViewController ()<UITextFieldDelegate>

@end

@implementation SetNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改用户名";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor whiteColor]];
    self.nameField.text = self.str;
    self.nameField.delegate = self;
    // 手势
    // 1.点击
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self.view addGestureRecognizer:tap];

}

// 触摸屏幕键盘回弹
- (void)tapAction:(UITapGestureRecognizer *)tap{
    [self.nameField resignFirstResponder];
}

// 回收键盘方法
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)back:(UIButton *)btn
{
    NSLog(@"修改完成");
    // (3).设置代理人执行的协议方法
    [self.delegate bringStr:self.nameField.text];
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
