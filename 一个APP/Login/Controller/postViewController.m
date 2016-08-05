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
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self.view addGestureRecognizer:tap];
}

// 触摸屏幕键盘回弹
- (void)tapAction:(UITapGestureRecognizer *)tap{
    
    [self.yonghuField resignFirstResponder];
    [self.zcPhoneField resignFirstResponder];
    [self.zcyanzhengmaField resignFirstResponder];
    [self.zcquerenField resignFirstResponder];
    [self.zcshurumimaFielf resignFirstResponder];
    [self.tuijianmaField resignFirstResponder];
}


// 返回按钮
- (IBAction)postBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}

// 确认注册按钮
- (IBAction)secceedBtn:(id)sender {

    if ([self.testStr isEqualToString:self.zcyanzhengmaField.text]) {
        NSString *urlStr = @"user/zhuce.action?";
        NSDictionary *dic = @{@"userName":self.zcPhoneField.text,@"password":self.zcshurumimaFielf.text,@"userWangming":self.yonghuField.text};
        [AFNetWorting postNetWortingWithUrlString:urlStr params:dic controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
            if ([@"0"isEqualToString:responseObject[@"ok"]]) {
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                hud.labelText = @"注册失败!";
            }else
            {
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                hud.labelText = @"验证中请稍后...";
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    self.testStr = responseObject[@"Contrnt"];
                    postsucceedViewController *succeedVC = [[postsucceedViewController alloc] init];
                    succeedVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
                    [self presentViewController:succeedVC animated:YES completion:^{
                        
                    }];
                });
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
        }];
    }else
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.labelText = @"注册失败!";
    }
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
    return YES;
}

- (IBAction)testBtn:(id)sender {
    UIButton *btn = sender;
    btn.selected = NO;
    btn.tag = 1000;
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
        }

    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
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





@end
