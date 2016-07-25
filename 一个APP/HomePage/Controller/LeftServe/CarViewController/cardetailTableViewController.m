//
//  cardetailTableViewController.m
//  一个APP
//
//  Created by 远古科技 on 16/7/23.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "cardetailTableViewController.h"
#import "carDetailHeaderView.h"
#import "groupTableViewCell.h"
#import "CarEvaluateTableViewCell.h"
#import "ShowAllAndErorrCell.h"
#import "carWashTableViewController.h"
@interface cardetailTableViewController ()

@end

@implementation cardetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = BGcolor(205, 205, 205);
    self.navigationItem.rightBarButtonItem = nil;
    [self.tableView setShowsVerticalScrollIndicator:NO];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        static NSString *reuse = @"reuse";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
        if (!cell) {
            cell = [groupTableViewCell greateView];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if (indexPath.section == 1) {
        static NSString *reuse = @"reuse";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
        if (!cell) {
            cell = [CarEvaluateTableViewCell greateEvaluateCell];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if (indexPath.section == 2) {
        ShowAllAndErorrCell *erorrCell = [[ShowAllAndErorrCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        [erorrCell setShowAllAndErorrCellStyle:erorrCellStyle];
        return erorrCell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 220;
    }
    if (indexPath.section == 1) {
        return 220;
    }
    if (indexPath.section == 2) {
        return 50;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        carDetailHeaderView *header = [carDetailHeaderView greateHeaderView];
        tableView.tableHeaderView = header;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        carWashTableViewController *washVC = [[carWashTableViewController alloc] init];
        [self.navigationController pushViewController:washVC animated:YES];
    }
}

@end
