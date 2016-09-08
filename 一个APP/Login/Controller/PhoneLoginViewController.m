//
//  PhoneLoginViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/8/4.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "PhoneLoginViewController.h"
#import "RootTabBarController.h"

@interface PhoneLoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *phoneText;//手机号
@property (weak, nonatomic) IBOutlet UITextField *testField;//验证码
- (IBAction)loginBtn:(id)sender; // 登录按钮
- (IBAction)obtainTestBtn:(id)sender; // 获取验证码
- (IBAction)userLoginBtn:(id)sender; // 跳回用户名登录
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong)UIButton *codeBtn;
@property (nonatomic, copy)NSString *code;

@end

@implementation PhoneLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.phoneText.delegate = self;
    self.testField.delegate = self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(textFieldShouldReturn:)];
    [self.view addGestureRecognizer:tap];
}
// 回收键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.phoneText resignFirstResponder];
    [self.testField resignFirstResponder];
    return YES;
}

// 登录点击事件
- (IBAction)loginBtn:(id)sender {
    NSString *url = @"user/shoujihaologin.action?";
    NSDictionary *dic = @{@"userName":self.phoneText.text};
    /**
     *  调用网络请求
     *  URL 网络路径
     *  dic  拼接字段
     *  result  判断登录或者验证码 1为登录  0为验证码
     */
    [self afnetWoting:url params:dic result:1];
}
// 获取验证码
- (IBAction)obtainTestBtn:(id)sender {
    if (_phoneText.text.length == 11) {
        
        self.codeBtn = sender;
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(phoneCilckTestBtnAction) userInfo:nil repeats:YES];
        
        NSString *url = @"user/yanzhengma.action?";
        NSDictionary *dic = @{@"mobile":self.phoneText.text};
        /**
         *  调用网络请求
         *  URL 网络路径
         *  dic  拼接字段
         *  result  判断登录或者验证码 1为登录  0为验证码
         */
        [self afnetWoting:url params:dic result:0];
    }else if (_phoneText.text.length < 11 && _phoneText.text.length > 0)
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.labelText = @"手机号输入有误";
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud hide:YES];
        });
    }else{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.labelText = @"请输入手机号";
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud hide:YES];
        });
    }
}

static NSInteger num = 60;
- (void)phoneCilckTestBtnAction
{
    if (num <= 60 && num > 0) {
        self.codeBtn.enabled = NO;
        [self.codeBtn setBackgroundColor:[UIColor grayColor]];
        [self.codeBtn setTitleColor:[UIColor colorWithRed:198/255. green:198/255. blue:198/255. alpha:1] forState:UIControlStateNormal];
        NSString *title = [NSString stringWithFormat:@"重新获取(%lds)",num--];
        [self.codeBtn setTitle:title forState:UIControlStateDisabled];
    }else if (num == 0)
    {
        [self.codeBtn setBackgroundColor:[UIColor whiteColor]];
        UIColor *color = [UIColor colorWithRed:96/255. green:197 /255. blue:214/255. alpha:1];
        [self.codeBtn setTitleColor:color forState:UIControlStateNormal];
        self.codeBtn.enabled = YES;
        [self.codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        num = 60;
        [_timer setFireDate:[NSDate distantFuture]];
    }
}

- (IBAction)userLoginBtn:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
// 验证请求 和 登录请求
- (void)afnetWoting:(NSString *)url params:(NSDictionary *)dic result:(NSInteger)result
{
    [AFNetWorting postNetWortingWithUrlString:url params:dic controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([@"1" isEqualToString:responseObject[@"ok"]]) {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.labelText = @"请稍等···";
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if (result == 0) {
                    [hud hide:YES];
                    self.code = responseObject[@"Contrnt"];
                    [self.phoneText setUserInteractionEnabled:NO];
                }else
                {
                    if ([self.code isEqualToString:self.testField.text]) {
                        [hud hide:YES];
                        RootTabBarController *rootVC = [[RootTabBarController alloc]init];
                        [self presentViewController:rootVC animated:YES completion:nil];
                    }else
                    {
                        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                        hud.labelText = @"验证码输入错误";
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            [hud hide:YES];
                        });
                    }
                }
            });
        }else
        {
            if (result == 0) {
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                hud.labelText = @"验证码获取失败";
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [hud hide:YES];
                });
                
            }else{
                if (![self.code isEqualToString:self.testField.text]) {
                    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                    hud.labelText = @"验证码输入错误";
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [hud hide:YES];
                    });
                }else
                {
                    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                    hud.labelText = @"手机号未注册，请返回注册";
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [hud hide:YES];
                    });
                }
            }
        }

    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}



@end
