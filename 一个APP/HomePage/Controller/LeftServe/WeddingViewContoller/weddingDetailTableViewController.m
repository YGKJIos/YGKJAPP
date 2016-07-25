//
//  weddingDetailTableViewController.m
//  一个APP
//
//  Created by 远古科技 on 16/7/25.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "weddingDetailTableViewController.h"
#import "carDetailHeaderView.h"
#import "voucherTableViewCell.h"
#import "TitleCellTableViewCell.h"
#import "ShowAllAndErorrCell.h"
@interface weddingDetailTableViewController ()

@end

@implementation weddingDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 5;
    }
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            static NSString *reuse = @"reuse";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
            cell = [TitleCellTableViewCell createSectionTitleCellNib];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
         } else if (indexPath.row == 4)
         {
             ShowAllAndErorrCell *erorrCell = [[ShowAllAndErorrCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
             [erorrCell setShowAllAndErorrCellStyle:showAllCellStyle];
             return erorrCell;
         } else
         {
             static NSString *reuse = @"reuse";
             UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
             cell = [voucherTableViewCell greateCell];
             cell.selectionStyle = UITableViewCellSelectionStyleNone;
             return cell;
         }
        }
    return nil;
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 40;
        }
        if (indexPath.row == 4) {
            return 40;
        }
    }
    return 100;
}

@end
