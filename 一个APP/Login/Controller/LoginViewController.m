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
#import "PhoneLoginViewController.h"
#import "UserInfo.h"
#import "JPUSHService.h"
@interface LoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *remaberBtn;
@property (weak, nonatomic) IBOutlet UITextField *peopleTextField;
@property (weak, nonatomic) IBOutlet UITextField *mimaField;
@property (weak, nonatomic) IBOutlet UIButton *phoneLoginBtn;
@property (nonatomic, strong)NSDictionary *dic; // 用户名、密码的字典

@property (nonatomic, assign)BOOL select;

@end

@implementation LoginViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.select = NO;
    self.peopleTextField.delegate = self;
    self.mimaField.delegate = self;
    [self.phoneLoginBtn addTarget:self action:@selector(ClickPhoneLoginAction) forControlEvents:UIControlEventTouchUpInside];
    // 1.点击收回键盘
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(textFieldShouldReturn:)];
    [self.view addGestureRecognizer:tap];
}

// 记住密码点击方法
- (IBAction)remaberBtn:(id)sender {
    if (self.select == YES) {
        
        [self.remaberBtn setImage:[UIImage imageNamed:@"jizhumima_xuanzhong"] forState:UIControlStateNormal];;
        // 保存userId
        
    } else if (self.select == NO)
    {
        [self.remaberBtn setImage:[UIImage imageNamed:@"jizhumima_weixuan"] forState:UIControlStateNormal];
        // 清除userId
        
    }
    self.select = !self.select;
}

- (void)keepDataInSandBox:(NSString *)userId
{
    // 获取 沙盒
    NSString *sandBoxPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSFileManager *manager = [NSFileManager defaultManager];
    NSString *path = [sandBoxPath stringByAppendingPathComponent:@"manager"];
    [manager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    NSString *dicPath = [path stringByAppendingPathComponent:@"userDic.plish"];
    if (self.select == NO) {
        _dic = @{@"userWangming":self.peopleTextField.text,@"password":self.mimaField.text,@"status":@"NO",@"userId":userId};
        [_dic writeToFile:dicPath atomically:YES];
    }else
    {
        [manager removeItemAtPath:dicPath error:nil];
    }
}

// 忘记密码点击方法
- (IBAction)forgetBtn:(id)sender {
    
    fotgetViewController *fotgetVC = [[fotgetViewController alloc] init];
    fotgetVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:fotgetVC animated:YES completion:^{
        
    }];
}
// 登录按钮点击方法
- (IBAction)loginBtn:(id)sender {
    _dic = @{@"userWangming":self.peopleTextField.text,@"password":self.mimaField.text};
    NSString *url = @"user/wangminglogin.action?";
    [AFNetWorting postNetWortingWithUrlString:url params:_dic controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([@"0"isEqualToString:responseObject[@"ok"]]) {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.labelText = @"用户名或密码错误!";
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [hud hide:YES];
            });
        }else
        {
            self.select = NO;
            [self keepDataInSandBox:responseObject[@"userId"]];
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.labelText = @"登录中请稍后...";

            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [hud hide:YES];
                RootTabBarController *rootVC = [[RootTabBarController alloc]init];
                [self presentViewController:rootVC animated:YES completion:nil];
            });
            
            [[NSNotificationCenter defaultCenter] postNotificationName:kJPFNetworkDidLoginNotification object:nil userInfo:responseObject];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}
// 手机登录点击方法
- (void)ClickPhoneLoginAction{
    PhoneLoginViewController *phoneVC = [[PhoneLoginViewController alloc]init];
    [self presentViewController:phoneVC animated:YES completion:nil];
}

// 注册账户点击方法
- (IBAction)registerBtn:(id)sender {
    
    postViewController *postVC = [[postViewController alloc] init];
    postVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:postVC animated:YES completion:^{
        
    }];
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


@end
