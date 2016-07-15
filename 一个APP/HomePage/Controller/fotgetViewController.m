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

// 触摸屏幕键盘回弹
- (void)tapAction:(UITapGestureRecognizer *)tap{
    
    [self.phoneField resignFirstResponder];
    [self.yanzhengmaField resignFirstResponder];
    [self.querenmimaField resignFirstResponder];
    [self.shurumimaField resignFirstResponder];
}

// 返回按钮
- (IBAction)returnBtn:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}
// 确认按钮
- (IBAction)qrBtn:(id)sender {
    succeedViewController *succeedVC = [[succeedViewController alloc] init];
    succeedVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;    [self presentViewController:succeedVC animated:YES completion:^{
        
    }];
 
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
