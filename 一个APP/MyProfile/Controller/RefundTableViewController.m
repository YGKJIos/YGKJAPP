//
//  RefundTableViewController.m
//  一个APP
//
//  Created by 远古科技 on 16/7/30.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "RefundTableViewController.h"
#import "RefundTableViewCell.h"
#import "orderViewController.h"
@interface RefundTableViewController ()

@end

@implementation RefundTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"待付款";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   static NSString *reuse = @"reuse";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [RefundTableViewCell createCell];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 285;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *oneCell = [tableView cellForRowAtIndexPath: indexPath];
//    if (oneCell.accessoryType == UITableViewCellAccessoryNone) {
//        oneCell.accessoryType = UITableViewCellAccessoryCheckmark;
//        
//    } else
//        oneCell.accessoryType = UITableViewCellAccessoryNone;
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    orderViewController *orderVC = [[orderViewController alloc] init];
    [self.navigationController pushViewController:orderVC animated:YES];
}




@end
