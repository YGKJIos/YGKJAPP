//
//  AddressAndMOdificationViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/14.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "AddressAndMOdificationViewController.h"

@interface AddressAndMOdificationViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *ladyBtn;
@property (weak, nonatomic) IBOutlet UIButton *manBtn;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
@property (weak, nonatomic) IBOutlet UITextField *locationTextField;
@property (nonatomic, assign) NSInteger sex; // 1：男 | 0：女

@end

@implementation AddressAndMOdificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"添加地址";
    self.sex = 0;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.ladyBtn addTarget:self action:@selector(ladyBtnCilckAction) forControlEvents:UIControlEventTouchUpInside];
    [self.manBtn addTarget:self action:@selector(manBtnClickBtn) forControlEvents:UIControlEventTouchUpInside];
    self.nameTextField.delegate = self;
    self.phoneTextField.delegate = self;;
    self.addressTextField.delegate = self;
    self.locationTextField.delegate = self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClickAction:)];
    [self.view addGestureRecognizer:tap];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"保存" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(rightButtonClickAction) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.size = CGSizeMake(40, 21);
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
}
#pragma mark - 保存地址
- (void)rightButtonClickAction
{
    if ([self.nameTextField.text isEqualToString:@""] || [self.addressTextField.text isEqualToString:@""]) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"姓名或地址不能为空！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }else{
        NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
        path = [path stringByAppendingPathComponent:@"manager/userDic.plish"];
        NSDictionary *userdic = [NSDictionary dictionaryWithContentsOfFile:path];
        NSString *userID = [userdic objectForKey:@"userId"];
        
        //拼接 收货地址和名字
        NSString *nameStr = [self.nameTextField.text substringToIndex:1];
        NSDictionary *dic = [NSDictionary dictionary];
        if (self.sex == 0) {
            NSString *textStr = [NSString stringWithFormat:@"%@---%@女士",self.addressTextField.text,nameStr];
            dic = @{@"userId":userID,@"shouhuoDizhi":textStr};
        }else{
            NSString *textStr = [NSString stringWithFormat:@"%@---%@先生",self.addressTextField.text,nameStr];
            dic = @{@"userId":userID,@"shouhuoDizhi":textStr};
        }
        NSString *urlStr = @"user/addshouhuodizhi.action?";
        
        [AFNetWorting postNetWortingWithUrlString:urlStr params:dic controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
            if ([responseObject[@"ok"] isEqualToString:@"1"]) {
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                hud.labelText = @"正在保存";
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [hud removeFromSuperview];
                    [self.navigationController popViewControllerAnimated:YES];
                });
            }else{
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"保存地址失败" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
                [alert addAction:action];
                [self presentViewController:alert animated:YES completion:nil];
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
        }];
    }
    
   
}
- (void)ladyBtnCilckAction
{
    self.sex = 0;
    [self.ladyBtn setImage:[UIImage imageNamed:@"waimai_dingdan_xuanzhong"] forState:UIControlStateNormal];
    [self.manBtn setImage:[UIImage imageNamed:@"waimai_dingdan_weixuanzhong"] forState:UIControlStateNormal];
}
- (void)manBtnClickBtn
{
    self.sex = 1;
    [self.ladyBtn setImage:[UIImage imageNamed:@"waimai_dingdan_weixuanzhong"] forState:UIControlStateNormal];
    [self.manBtn setImage:[UIImage imageNamed:@"waimai_dingdan_xuanzhong"] forState:UIControlStateNormal];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)tapClickAction:(UITapGestureRecognizer *)tap
{
    [self.nameTextField resignFirstResponder];
    [self.phoneTextField resignFirstResponder];
    [self.addressTextField resignFirstResponder];
    [self.locationTextField resignFirstResponder];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
