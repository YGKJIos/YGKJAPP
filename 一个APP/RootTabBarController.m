//
//  TabBarViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/6.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "RootTabBarController.h"
#import "NavigationViewController.h"//
#import "AddressBookController.h"   // 通讯录
#import "DiscoverViewController.h"  //发现
#import "MarketViewController.h"   // 商家
#import "MessageViewController.h"  //消息
#import "HomePageViewController.h"  // 首页
#import "MyProfileViewController.h"  // 我的

@interface RootTabBarController ()

@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    HomePageViewController *homePage = [[HomePageViewController alloc]init];
    [self addChildVC:homePage originalImage:@"shangjia_hui-1" selectImage:@"shangjia_lan-1" title:@"首页"];
    
    
    MarketViewController *marketVC = [[MarketViewController alloc]init];
    [self addChildVC:marketVC originalImage:@"shangjia_hui" selectImage:@"shangjia" title:@"商家"];
    
    MyProfileViewController *profile = [[MyProfileViewController alloc]init];
    [self addChildVC:profile originalImage:@"wode_hui-1" selectImage:@"wode_lan-1" title:@"我的"];
    
//    MessageViewController *messageVC = [[MessageViewController alloc]init];
//    [self addChildVC:messageVC originalImage:@"xiaoxihui" selectImage:@"xiaoxi" title:@"消息"];
//    
//    AddressBookController *addressBookVC = [[AddressBookController alloc]init];
//    [self addChildVC:addressBookVC originalImage:@"tongxunlu" selectImage:@"tongxunlu_" title:@"通讯录"];
    
//    DiscoverViewController *discoverVC = [[DiscoverViewController alloc]init];
//    [self addChildVC:discoverVC originalImage:@"faxianhui" selectImage:@"faxian" title:@"发现"];
    
}
- (void)addChildVC:(UIViewController *)childVC originalImage:(NSString *)originalImage selectImage:(NSString *)selectImage title:(NSString *)title
{
    childVC.tabBarItem.image = [[UIImage imageNamed:originalImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    childVC.tabBarItem.title = title;
    NSMutableDictionary *titleDic = [NSMutableDictionary dictionary];
    titleDic[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [childVC.tabBarItem setTitleTextAttributes:titleDic forState:UIControlStateNormal];
    
    NSMutableDictionary *titleSelectDic = [NSMutableDictionary dictionary];
    titleSelectDic[NSForegroundColorAttributeName] = BGcolor(3, 198, 222);
    [childVC.tabBarItem setTitleTextAttributes:titleSelectDic forState:UIControlStateSelected];
    NavigationViewController *navigation = [[NavigationViewController alloc]initWithRootViewController:childVC];
    [self addChildViewController:navigation];
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
