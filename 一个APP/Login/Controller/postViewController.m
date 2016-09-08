//
//  postViewController.m
//  一个APP
//
//  Created by 远古科技 on 16/7/14.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "postViewController.h"
#import "postsucceedViewController.h"
@interface postViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *yonghuField;
@property (weak, nonatomic) IBOutlet UITextField *zcshurumimaFielf;
@property (weak, nonatomic) IBOutlet UITextField *zcquerenField;
@property (weak, nonatomic) IBOutlet UITextField *zcPhoneField;
- (IBAction)testBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *zcyanzhengmaField;
@property (weak, nonatomic) IBOutlet UITextField *tuijianmaField;
@property (nonatomic, copy)NSString *testStr;
@property (nonatomic ,strong)NSTimer *timer;
@property (nonatomic, strong)UIButton *codeBtn;
@end

@implementation postViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.yonghuField.delegate = self;
    self.zcshurumimaFielf.delegate = self;
    self.zcquerenField.delegate = self;
    self.zcPhoneField.delegate = self;
    self.zcyanzhengmaField.delegate = self;
    self.tuijianmaField.delegate = self;
    // 1.点击
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(textFieldShouldReturn:)];
    [self.view addGestureRecognizer:tap];
}

// 返回按钮
- (IBAction)postBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

// 确认注册按钮
- (IBAction)secceedBtn:(id)sender {

    if ([self.testStr isEqualToString:self.zcyanzhengmaField.text] && [self.zcshurumimaFielf.text isEqualToString:self.zcquerenField.text]) {
        NSString *urlStr = @"user/zhuce.action?";
        NSDictionary *dic = @{@"userName":self.zcPhoneField.text,@"password":self.zcshurumimaFielf.text,@"userWangming":self.yonghuField.text};
        [AFNetWorting postNetWortingWithUrlString:urlStr params:dic controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
            if ([@"0"isEqualToString:responseObject[@"ok"]]) {
                [self addMBProgressText:@"注册失败"];
            }
            if ([@"1" isEqualToString:responseObject[@"ok"]]) {
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                hud.labelText = @"注册成功";
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    self.testStr = responseObject[@"Contrnt"];
                    postsucceedViewController *succeedVC = [[postsucceedViewController alloc] init];
                    succeedVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
                    [self presentViewController:succeedVC animated:YES completion:^{
                        
                    }];
                });
            }
            if ([@"2" isEqualToString:responseObject[@"ok"]]) {
                [self addMBProgressText:@"手机号已注册"];
            }
            if ([@"3" isEqualToString:responseObject[@"ok"]]) {
                
                [self addMBProgressText:@"用户名已重复"];
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
        }];
    }else
    {
        [self addMBProgressText:@"验证码或密码错误"];
    }
}

- (void)addMBProgressText:(NSString *)text
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = text;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [hud hide:YES];
    });
}

// 回收键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.yonghuField resignFirstResponder];
    [self.zcshurumimaFielf resignFirstResponder];
    [self.zcquerenField resignFirstResponder];
    [self.zcyanzhengmaField resignFirstResponder];
    [self.zcPhoneField resignFirstResponder];
    [self.tuijianmaField resignFirstResponder];
    [UIView animateWithDuration:0.2 animations:^{
        self.view.y = 0;
    }];
    return YES;
}
// 获取验证码的点击方法
- (IBAction)testBtn:(id)sender {
    if (self.zcPhoneField.text.length == 11 && self.yonghuField.text.length > 0) {
        self.codeBtn = sender;
        // 验证码计时
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(cilckTestBtnAction) userInfo:nil repeats:YES];
        NSString *url = @"user/yanzhengma.action?";
        NSDictionary *dic = @{@"mobile":self.zcPhoneField.text};
        [AFNetWorting postNetWortingWithUrlString:url params:dic controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
            if ([@"0"isEqualToString:responseObject[@"ok"]]) {
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                hud.labelText = @"获取验证码失败!";
            }else
            {
                self.testStr = responseObject[@"Contrnt"];
                // 关闭 交互
                self.zcPhoneField.userInteractionEnabled = NO;
                self.yonghuField.userInteractionEnabled = NO;
            }
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
        }];
    }else if (_zcPhoneField.text.length < 11 && _zcPhoneField.text.length > 0)
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.labelText = @"手机号输入有误";
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud hide:YES];
        });
    }else{
        [self addMBProgressText:@"请先输入电话号和用户名"];
    }
}

static NSInteger num = 60;
- (void)cilckTestBtnAction
{
    if (num <= 60 && num > 0) {
        self.codeBtn.enabled = NO;
        [self.codeBtn setBackgroundColor:[UIColor grayColor]];
        [self.codeBtn setTitleColor:[UIColor colorWithRed:198/255. green:198/255. blue:198/255. alpha:1] forState:UIControlStateNormal];
        NSString *title = [NSString stringWithFormat:@"重新获取(%lds)",num--];
        [self.codeBtn setTitle:title forState:UIControlStateDisabled];
    }else if (num == 0)
    {
        self.codeBtn.enabled = YES;
        [self.codeBtn setBackgroundColor:[UIColor whiteColor]];
        [self.codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        UIColor *color = [UIColor colorWithRed:96/255. green:197 /255. blue:214/255. alpha:1];
        [self.codeBtn setTitleColor:color forState:UIControlStateNormal];
        num = 60;
        [_timer setFireDate:[NSDate distantFuture]];
        
    }
    
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField == self.zcyanzhengmaField) {
        [UIView animateWithDuration:0.2 animations:^{
            self.view.y = -120;
        }];
    }
    return YES;
}


@end
