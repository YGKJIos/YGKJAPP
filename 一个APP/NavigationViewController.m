//
//  NavigationViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/6.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "NavigationViewController.h"

@interface NavigationViewController ()

@end

@implementation NavigationViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.translucent = NO;
    NSDictionary *dic = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    // 导航栏 标题颜色
    self.navigationBar.titleTextAttributes = dic;
    // 导航栏 背景色
    self.navigationBar.barTintColor = BGcolor(34, 198, 220);
    
}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        
        /* 自动显示和隐藏tabbar */
        viewController.hidesBottomBarWhenPushed = YES;
        
        // 设置按钮
        UIBarButtonItem *leftItme = [UIBarButtonItem itemWithTarget:self action:@selector(leftBtnAction) image:@"meishi_fanghui" highImage:@"meishi_fanghui"];
        UIBarButtonItem *rightItme = [UIBarButtonItem itemWithTarget:self action:@selector(rightBtnAction) image:@"meishi_sousuo" highImage:@"meishi_sousuo"];
        viewController.navigationItem.rightBarButtonItem = rightItme;
        viewController.navigationItem.leftBarButtonItem = leftItme;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)leftBtnAction
{
    [self popViewControllerAnimated:YES];
}
- (void)rightBtnAction
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
