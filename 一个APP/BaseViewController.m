//
//  BaseViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/7.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "BaseViewController.h"
@interface BaseViewController ()
@property (nonatomic, assign)BOOL result;

@end

@implementation BaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加navigation 左右按钮
    
    _result = YES;
    [self addNavigationLeftAndRightBarButtonItme];
    
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
