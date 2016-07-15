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
@property (weak, nonatomic) IBOutlet UITextField *zcyanzhengmaField;
@property (weak, nonatomic) IBOutlet UITextField *tuijianmaField;
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
    postsucceedViewController *succeedVC = [[postsucceedViewController alloc] init];
    succeedVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:succeedVC animated:YES completion:^{
        
    }];
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
