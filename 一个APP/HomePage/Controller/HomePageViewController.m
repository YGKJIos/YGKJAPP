//
//  HomePageViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/16.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "HomePageViewController.h"
#import "SearchViewController.h"
#import "HomePageTableViewController.h" // 首页内容

@interface HomePageViewController ()

//@property (nonatomic, strong)UIView *navigationView;

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置navigation 的样式
    [self addNavigationView];
    HomePageTableViewController *homeTabVC = [[HomePageTableViewController alloc]init];
    homeTabVC.tableView.y = 0;
    homeTabVC.tableView.height = HEIGHT;
    [self addChildViewController:homeTabVC];
    [self.view addSubview:homeTabVC.tableView];
}

//-(UIView *)navigationView
//{
//    if (!_navigationView) {
//        self.navigationView = [[UIView alloc]init];
//    }
//    return _navigationView;
//}
- (void)addNavigationView
{
//    self.navigationView.frame = self.navigationController.navigationBar.bounds;
//    [self.navigationController.navigationBar addSubview:self.navigationView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 60, 40);
    [button setTitle:@"恒运大厦" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = item;
    

    
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.width = 205;
    searchBtn.height = 26;
    [searchBtn addTarget:self action:@selector(searchClickAction) forControlEvents:UIControlEventTouchUpInside];
    [searchBtn setBackgroundImage:[UIImage imageNamed:@"chaoshi_sousuo"] forState:UIControlStateNormal];
    searchBtn.adjustsImageWhenHighlighted = NO;
    self.navigationItem.titleView = searchBtn;
    
}

- (void)viewWillDisappear:(BOOL)animated{
    
//    [self.navigationView setHidden:YES];
}
- (void)searchClickAction
{
    SearchViewController *searchVC = [[SearchViewController alloc]init];
    [self.navigationController pushViewController:searchVC animated:YES];
}
- (void)viewWillAppear:(BOOL)animated
{
//    [self.navigationView setHidden:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
