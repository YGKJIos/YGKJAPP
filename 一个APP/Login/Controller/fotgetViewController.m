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
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self.view addGestureRecognizer:tap];
}

- (IBAction)testingCode:(id)sender {
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
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];

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
                hud.labelText = @"网络异常修改失败";
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [hud hide:YES];
                });
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
        }];
        
    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"密码或者验证码有错误" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
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

// 触摸屏幕键盘回弹
- (void)tapAction:(UITapGestureRecognizer *)tap{
    
    [self.phoneField resignFirstResponder];
    [self.yanzhengmaField resignFirstResponder];
    [self.querenmimaField resignFirstResponder];
    [self.shurumimaField resignFirstResponder];
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
