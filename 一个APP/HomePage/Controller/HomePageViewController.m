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

@property (nonatomic, strong)UIView *navigationView;

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

-(UIView *)navigationView
{
    if (!_navigationView) {
        self.navigationView = [[UIView alloc]init];
    }
    return _navigationView;
}
- (void)addNavigationView
{
    self.navigationView.frame = self.navigationController.navigationBar.bounds;
    [self.navigationController.navigationBar addSubview:self.navigationView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 60, 40);
    [button setTitle:@"恒运大厦" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    
    UIImageView *imageViewBtn = [[UIImageView alloc]initWithFrame:CGRectMake(button.width, button.height/2-4, 8, 8)];
    imageViewBtn.image = [UIImage imageNamed:@"xiangshang"];
    [button addSubview:imageViewBtn];
    [self.navigationView addSubview:button];
    
    // 搜索框
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.navigationController.navigationBar.frame.size.width/2 - 93, self.navigationController.navigationBar.frame.size.height/2-12, 186, 24)];
    // 打开用户交互
    [imageView setUserInteractionEnabled:YES];
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = 3;
    imageView.backgroundColor = [UIColor whiteColor];
    [self.navigationView addSubview: imageView];
    
    
    UILabel *searchLab = [[UILabel alloc]initWithFrame:CGRectMake(imageView.frame.size.width /2 - 40, 0, 80, imageView.frame.size.height)];
    searchLab.text = @"搜索";
    searchLab.font = [UIFont systemFontOfSize:14];
    searchLab.textAlignment = NSTextAlignmentCenter;
    searchLab.textColor = BGcolor(206, 205, 205);
    [imageView addSubview:searchLab];
    
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(18, imageView.height/2-7.5, 15, 15)];
    imageV.image = [UIImage imageNamed:@"shouye_sousuo"];
    [imageView addSubview:imageV];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(searchClick)];
    [imageView addGestureRecognizer:tap];
}

- (void)viewWillDisappear:(BOOL)animated{
    
    [self.navigationView setHidden:YES];
}
- (void)searchClick
{
    SearchViewController *searchVC = [[SearchViewController alloc]init];
    [self.navigationController pushViewController:searchVC animated:YES];
}
- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationView setHidden:NO];
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
