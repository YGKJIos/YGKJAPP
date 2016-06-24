//
//  BaseViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/7.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "BaseViewController.h"
#import "PersonalCenterViewController.h"

@interface BaseViewController ()

@property (nonatomic, strong)PersonalCenterViewController *personalVC;
@property (nonatomic, assign)BOOL result;

@end

@implementation BaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加navigation 左右按钮
    
    _result = YES;
    [self addNavigationLeftAndRightBarButtonItme];
    
    _personalVC = [[PersonalCenterViewController alloc]init];
    _personalVC.view.frame = CGRectMake(-(self.view.width-80), 0, self.view.width-80, HEIGHT);
    [self addChildViewController:_personalVC];
    [self.view addSubview:_personalVC.view];
}

- (void)addNavigationLeftAndRightBarButtonItme
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(leftAction) image:@"gerenzhongxin" highImage:@""];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(rightAction) image:@"fangdajing1" highImage:@""];
}
- (void)rightAction
{
    NSLog(@"右边按钮");
}
- (void)leftAction
{
    if (_result) {
        
        [UIView animateWithDuration:0.25 animations:^{
            self.view.frame = CGRectMake(self.view.width - 80, 64, self.view.width, self.view.height);
            _personalVC.view.frame = CGRectMake(-(self.view.width - 80), 0, self.view.width-80, self.view.height-64);
        }];
        _result = !_result;
    }else
    {
        [UIView animateWithDuration:0.25 animations:^{
            self.view.frame = CGRectMake(0, 64, self.view.width, self.view.height);
            _personalVC.view.frame = CGRectMake(-(self.view.width - 80), 0, self.view.width-80, HEIGHT-64);
        }];
        _result = !_result;
    }
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"我是左边按钮");
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
