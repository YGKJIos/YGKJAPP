//
//  ChangePasswordViewController.m
//  一个APP
//
//  Created by 远古科技 on 16/8/17.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "ChangePasswordViewController.h"

@interface ChangePasswordViewController ()<UITextFieldDelegate>

@end

@implementation ChangePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.passWordField.delegate = self;
    self.surePassWordField.delegate = self;
    self.title = @"更改密码";
    // 手势
    // 1.点击
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self.view addGestureRecognizer:tap];

}

// 触摸屏幕键盘回弹
- (void)tapAction:(UITapGestureRecognizer *)tap{
    [self.passWordField resignFirstResponder];
    [self.surePassWordField resignFirstResponder];
}

// 回收键盘方法
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

// 确认提交
- (IBAction)submitBtn:(id)sender {
    if (self.passWordField.text != self.surePassWordField.text) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"两次输入的密码不相同" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:cancelAction];
        [self presentViewController:alert animated:YES completion:^{
            
        }];
    }
    NSString *temp = [self.passWordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *temp1 = [self.surePassWordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ([temp length] == 0 & [temp1 length] == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入密码" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:cancelAction];
        [self presentViewController:alert animated:YES completion:^{
            
        }];
    }
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
