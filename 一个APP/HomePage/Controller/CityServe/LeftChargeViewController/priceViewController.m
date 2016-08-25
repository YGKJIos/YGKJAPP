//
//  priceViewController.m
//  一个APP
//
//  Created by 远古科技 on 16/7/18.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "priceViewController.h"
#import "lifepriceViewController.h"
#import "gasViewController.h"
#import "powerViewController.h"
#import "waterViewController.h"
#import "carViewController.h"
@interface priceViewController ()

@end

@implementation priceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
// 固话缴费 跳转放法
- (IBAction)lifePriceBtn:(id)sender {
    lifepriceViewController *lifeVC = [[lifepriceViewController alloc] init];
    [self.navigationController pushViewController:lifeVC animated:YES];
    
}

// 燃气缴费跳转方法
- (IBAction)gasBtn:(id)sender {
    gasViewController *gasVC = [[gasViewController alloc] init];
    [self.navigationController pushViewController:gasVC animated:YES];
}
// 电费跳转方法
- (IBAction)powerBtn:(id)sender {
    powerViewController *powerVC = [[powerViewController alloc] init];
    [self.navigationController pushViewController:powerVC animated:YES];
}
// 水费跳转放法
- (IBAction)waterBtn:(id)sender {
    waterViewController *waterVC = [[waterViewController alloc] init];
    [self.navigationController pushViewController:waterVC animated:YES];
}
// 违章费跳转
- (IBAction)carBtn:(id)sender {
    carViewController *carVC = [[carViewController alloc] init];
    [self.navigationController pushViewController:carVC animated:YES];
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
