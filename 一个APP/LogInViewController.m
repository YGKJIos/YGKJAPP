//
//  LogInViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/1.
//  Copyright © 2016年 llb. All rights reserved.
//

// 登录页面
#import "LogInViewController.h"
#import "RootTabBarController.h"

@interface LogInViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userNameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
- (IBAction)loginBrn:(id)sender; // 登录
- (IBAction)registBtn:(id)sender; // 注册

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestData];
    self.userNameField.returnKeyType = UIReturnKeyNext;
    self.passwordField.returnKeyType = UIReturnKeyDone;
    self.passwordField.secureTextEntry = YES;
    self.userNameField.delegate = self;
    self.passwordField.delegate = self;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)requestData
{
    

}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (self.userNameField == textField) {
        NSLog(@"1");
        [self.passwordField becomeFirstResponder];
    }
    if (self.passwordField == textField) {
        NSLog(@"12");
        [self.passwordField resignFirstResponder];
    }
    
    return YES;
}


- (IBAction)loginBrn:(id)sender {
    
    NSString *url = @"user/login.action?";
    NSDictionary *dic = @{@"password":self.passwordField.text,@"userName":self.userNameField.text};
    // 测试
    //    NSDictionary *dic = @{@"password":@"asd",@"userName":@"123123123"};
    
    [AFNetWorting postNetWortingWithUrlString:url params:dic controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@" , responseObject);
        [self presentViewController:[[RootTabBarController alloc]init] animated:YES completion:^{
            
        }];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"失败");
        [self presentViewController:[[RootTabBarController alloc]init] animated:YES completion:^{
            
        }];
    }];
}

- (IBAction)registBtn:(id)sender {
}
@end
