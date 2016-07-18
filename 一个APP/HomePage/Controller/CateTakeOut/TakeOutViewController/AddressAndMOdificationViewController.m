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

@end

@implementation AddressAndMOdificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
- (void)rightButtonClickAction
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"正在保存";
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [hud removeFromSuperview];
        [self.navigationController popViewControllerAnimated:YES];
    });
}
- (void)ladyBtnCilckAction
{
    [self.ladyBtn setImage:[UIImage imageNamed:@"waimai_dingdan_xuanzhong"] forState:UIControlStateNormal];
    [self.manBtn setImage:[UIImage imageNamed:@"waimai_dingdan_weixuanzhong"] forState:UIControlStateNormal];
}
- (void)manBtnClickBtn
{
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
