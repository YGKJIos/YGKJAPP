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
@property (nonnull, strong) NSTimer *timer;

@end

@implementation PhoneLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.phoneText.delegate = self;
    self.testField.delegate = self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(textFieldShouldReturn:)];
    [self.view addGestureRecognizer:tap];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.phoneText resignFirstResponder];
    [self.testField resignFirstResponder];
    return YES;
}


- (IBAction)loginBtn:(id)sender {
    
    NSString *url = @"user/shoujihaologin.action?";
    NSDictionary *dic = @{@"userName":self.phoneText.text};
    [self afnetWoting:url params:dic result:1];
    
}

- (IBAction)obtainTestBtn:(id)sender {
    
    UIButton *btn = sender;
    btn.selected = NO;
    btn.tag = 1000;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(cilckTestBtnAction) userInfo:nil repeats:YES];
    
    NSString *url = @"user/yanzhengma.action?";
    NSDictionary *dic = @{@"mobile":self.phoneText.text};
    [self afnetWoting:url params:dic result:0];
}

static NSInteger num = 60;
- (void)cilckTestBtnAction
{
    UIButton *btn = (UIButton *)[self.view viewWithTag:1000];
  
        if (num <= 60 && num > 0) {
            [btn setUserInteractionEnabled:NO];
            [btn setBackgroundColor:[UIColor grayColor]];
            [btn setTitleColor:[UIColor colorWithRed:198/255. green:198/255. blue:198/255. alpha:1] forState:UIControlStateNormal];
            [btn setTitle:@"60s" forState:UIControlStateNormal];
            NSString *title = [NSString stringWithFormat:@"重新获取(%ld)",num--];
            [btn setTitle:title forState:UIControlStateNormal];
        }else if (num == 0)
        {
            [btn setUserInteractionEnabled:YES];
            [btn setBackgroundColor:[UIColor whiteColor]];
            [btn setTitle:@"获取验证码" forState:UIControlStateNormal];
            UIColor *color = [UIColor colorWithRed:96/255. green:197 /255. blue:214/255. alpha:1];
            [btn setTitleColor:color forState:UIControlStateNormal];
            num = 60;
            [_timer setFireDate:[NSDate distantFuture]];
            
        }
    
}

- (IBAction)userLoginBtn:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)afnetWoting:(NSString *)url params:(NSDictionary *)dic result:(NSInteger)result
{
    [AFNetWorting postNetWortingWithUrlString:url params:dic controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([@"1" isEqualToString:responseObject[@"ok"]]) {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.labelText = @"请稍等";
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if (result == 0) {
                    [hud hide:YES];
                }else
                {
                    RootTabBarController *rootVC = [[RootTabBarController alloc]init];
                    [self presentViewController:rootVC animated:YES completion:nil];
                }
            });
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}



@end
