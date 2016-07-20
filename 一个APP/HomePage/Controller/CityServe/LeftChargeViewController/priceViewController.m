//
//  priceViewController.m
//  一个APP
//
//  Created by 远古科技 on 16/7/18.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "priceViewController.h"
#import "lifepriceViewController.h"
@interface priceViewController ()

@end

@implementation priceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
// 生活缴费 跳转放法
- (IBAction)lifePriceBtn:(id)sender {
    lifepriceViewController *lifeVC = [[lifepriceViewController alloc] init];
    [self.navigationController pushViewController:lifeVC animated:YES];
    
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
