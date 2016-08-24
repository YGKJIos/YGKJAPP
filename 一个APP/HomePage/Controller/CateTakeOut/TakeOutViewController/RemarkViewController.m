//
//  RemarkViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/13.
//  Copyright © 2016年 llb. All rights reserved.
//

// 备注页面
#import "RemarkViewController.h"

@interface RemarkViewController ()<UITextFieldDelegate>
@property (nonatomic, strong)UITextField *remarkText;
@end

@implementation RemarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.remarkText = [UITextField newAutoLayoutView];
    [self.view addSubview:_remarkText];
    _remarkText.placeholder = @"请写下自己的口味，需求等要求，已便商家备餐";
    [_remarkText autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:30];
    [_remarkText autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:30];
    [_remarkText autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
    [_remarkText autoSetDimension:ALDimensionHeight toSize:160];
    
    [_remarkText drawPlaceholderInRect:CGRectMake(0, 0, _remarkText.width, 20)];
    _remarkText.backgroundColor = BGcolor(235, 235, 235);
    _remarkText.layer.masksToBounds = YES;
    _remarkText.layer.cornerRadius = 5;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"fanhiu"] style:UIBarButtonItemStylePlain target:self action:@selector(fanhui)];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)fanhui
{
    [self.delegate passValue:_remarkText.text];
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"fahui");
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
