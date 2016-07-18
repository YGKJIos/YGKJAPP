//
//  LoginViewController.m
//  一个APP
//
//  Created by 远古科技 on 16/7/12.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "LoginViewController.h"
#import "RootTabBarController.h"
#import "fotgetViewController.h"
#import "postViewController.h"
@interface LoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *selectImage;
@property (weak, nonatomic) IBOutlet UIButton *remaberBtn;
@property (weak, nonatomic) IBOutlet UITextField *peopleTextField;
@property (weak, nonatomic) IBOutlet UITextField *mimaField;

@property (nonatomic, assign)BOOL select;

@end

@implementation LoginViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.select = YES;
    self.peopleTextField.delegate = self;
    self.mimaField.delegate = self;
    
    // 1.点击
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self.view addGestureRecognizer:tap];
    
}

// 触摸屏幕键盘回弹
- (void)tapAction:(UITapGestureRecognizer *)tap{
    
    [self.peopleTextField resignFirstResponder];
    [self.mimaField resignFirstResponder];
}


// 记住密码点击方法
- (IBAction)remaberBtn:(id)sender {
    if (self.select == YES) {
        self.selectImage.image = [UIImage imageNamed:@"jizhumima_xuanzhong"];
    } else if (self.select == NO)
    {
        self.selectImage.image = [UIImage imageNamed:@"jizhumima_weixuan"];
    }
    self.select = !self.select;
    
    NSLog(@"记住密码");
}
// 忘记密码点击方法
- (IBAction)forgetBtn:(id)sender {
    
    fotgetViewController *fotgetVC = [[fotgetViewController alloc] init];
    fotgetVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:fotgetVC animated:YES completion:^{
        
    }];
    
    NSLog(@"忘记密码");
}
// 登录按钮点击方法
- (IBAction)loginBtn:(id)sender {
    RootTabBarController *rootVC = [[RootTabBarController alloc] init];
    [self presentViewController:rootVC animated:YES completion:^{
        
    }];
 
    NSLog(@"登录");
}
// 微信登录点击方法
- (IBAction)wxBtn:(id)sender {
    NSLog(@"微信登录");
}
// 注册账户点击方法
- (IBAction)registerBtn:(id)sender {
    
    postViewController *postVC = [[postViewController alloc] init];
    postVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:postVC animated:YES completion:^{
        
    }];
    NSLog(@"注册账户");
}



// 点击 键盘回弹
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [self.peopleTextField resignFirstResponder];
    [self.mimaField resignFirstResponder];
    
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
