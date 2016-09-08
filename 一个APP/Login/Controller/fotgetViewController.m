//
//  fotgetViewController.m
//  一个APP
//
//  Created by 远古科技 on 16/7/13.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "fotgetViewController.h"
#import "succeedViewController.h"
@interface fotgetViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UITextField *yanzhengmaField;
@property (weak, nonatomic) IBOutlet UITextField *shurumimaField;
@property (weak, nonatomic) IBOutlet UITextField *querenmimaField;
@property (nonatomic, copy)NSString *code;
@property (nonatomic, strong) NSTimer *timer; // 计时器
@property (nonatomic, strong) UIButton *codeBtn;
- (IBAction)testingCode:(id)sender;
@end

@implementation fotgetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.phoneField.delegate = self;
    self.yanzhengmaField.delegate = self;
    self.shurumimaField.delegate = self;
    self.querenmimaField.delegate = self;
    
    // 手势
    // 1.点击
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(textFieldShouldReturn:)];
    [self.view addGestureRecognizer:tap];
}
// 获取验证码
- (IBAction)testingCode:(id)sender {
    if (_phoneField.text.length == 11) {
        self.codeBtn = sender;
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(fotgetCilckTestBtnAction) userInfo:nil repeats:YES];
        
        NSDictionary *dic = @{@"mobile":self.phoneField.text};
        NSString *url = @"user/yanzhengma.action?";
        [AFNetWorting postNetWortingWithUrlString:url params:dic controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
            if ([@"0"isEqualToString:responseObject[@"ok"]]) {
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                hud.labelText = @"获取验证码失败";
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [hud hide:YES];
                });
            }else
            {
                self.code = responseObject[@"Contrnt"];
                [self.phoneField setUserInteractionEnabled:NO];
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
        }];
        
    }else if (_phoneField.text.length < 11&&_phoneField.text.length > 0)
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.labelText = @"手机号输入有误";
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud hide:YES];
        });
    }else
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.labelText = @"请输入手机号";
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud hide:YES];
        });
    }
}
// 计时器方法
static NSInteger num = 60;
- (void)fotgetCilckTestBtnAction
{
    if (num <= 60 && num > 0) {
        [self.codeBtn setBackgroundColor:[UIColor grayColor]];
        [self.codeBtn setTitleColor:[UIColor colorWithRed:198/255. green:198/255. blue:198/255. alpha:1] forState:UIControlStateNormal];
        self.codeBtn.enabled = NO;
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
// 返回按钮
- (IBAction)returnBtn:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
// 确认按钮
- (IBAction)qrBtn:(id)sender {
    if (self.shurumimaField.text == self.querenmimaField.text && self.code == self.yanzhengmaField.text) {
        NSDictionary *dic = @{@"userName":self.phoneField.text,@"password":self.querenmimaField.text};
        NSString *url = @"user/xiugaimima.action?";
        [AFNetWorting postNetWortingWithUrlString:url params:dic controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
            if ([@"1"isEqualToString:responseObject[@"ok"]]) {
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                hud.labelText = @"修改成功";
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [hud hide:YES];
                    succeedViewController *succeedVC = [[succeedViewController alloc] init];
                    succeedVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
                    [self presentViewController:succeedVC animated:YES completion:^{
                        
                    }];
                });
            }else
            {
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                hud.labelText = @"修改失败";
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [hud hide:YES];
                });
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
        }];
        
    }else{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.labelText = @"密码或者验证码有错误";
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud hide:YES];
        });
    }
}

// 回收键盘方法
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.phoneField resignFirstResponder];
    [self.querenmimaField resignFirstResponder];
    [self.shurumimaField resignFirstResponder];
    [self.yanzhengmaField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
