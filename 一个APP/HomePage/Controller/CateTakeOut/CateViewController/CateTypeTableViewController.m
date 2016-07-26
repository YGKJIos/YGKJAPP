//
//  CateTypeTableViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/19.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "CateTypeTableViewController.h"
//#import "MerchantFoodTableViewController.h"
#import "CateDetailsTableViewController.h"
#import "ShopTableViewCell.h"

@interface CateTypeTableViewController ()

@end

@implementation CateTypeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"美食";
    self.navigationItem.rightBarButtonItem = nil;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cateID = @"cateID";
    ShopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cateID];
    if (cell == nil) {
        cell = [ShopTableViewCell createShopCell];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 115;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CateDetailsTableViewController *merchantVC = [[CateDetailsTableViewController alloc]init];
    [self.navigationController pushViewController:merchantVC animated:YES];
}



@end
