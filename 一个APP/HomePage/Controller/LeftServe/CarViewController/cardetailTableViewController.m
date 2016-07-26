//
//  cardetailTableViewController.m
//  一个APP
//
//  Created by 远古科技 on 16/7/23.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "cardetailTableViewController.h"
#import "DetailTableHeaderView.h"
#import "groupTableViewCell.h"
#import "CarEvaluateTableViewCell.h"
#import "ShowAllAndErorrCell.h"
#import "carWashTableViewController.h"
#import "voucherTableViewCell.h"
#import "TitleCellTableViewCell.h"
@interface cardetailTableViewController ()

@end

@implementation cardetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = BGcolor(205, 205, 205);
    self.navigationItem.rightBarButtonItem = nil;
    [self.tableView setShowsVerticalScrollIndicator:NO];
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
    if (section == 0) {
        return 5;
    }
    if (section == 1) {
        return 3;
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
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            TitleCellTableViewCell *cell = [TitleCellTableViewCell createSectionTitleCellNib];
            [cell setTitleImage:@"ms_pingjia" titleLab:@"评价 (1480)"];
            return cell;
        }if (indexPath.row == 1) {
            static NSString *reuse = @"reuse";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
            if (!cell) {
                cell = [CarEvaluateTableViewCell greateEvaluateCell];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }if (indexPath.row == 2) {
            ShowAllAndErorrCell *erorrCell = [[ShowAllAndErorrCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            [erorrCell setShowAllAndErorrCellStyle:showAllCellStyle];
            return erorrCell;
        }
    }
    ShowAllAndErorrCell *erorrCell = [[ShowAllAndErorrCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    [erorrCell setShowAllAndErorrCellStyle:erorrCellStyle];
    return erorrCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 40;
        }
        if (indexPath.row == 4) {
            return 40;
        }else
        {
            return 100;
        }
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            return 40;
        }
        if (indexPath.row == 1) {
            return 160;
        }
        if (indexPath.row == 2) {
            return 40;
        }
    }
    if (indexPath.section == 2) {
        return 50;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        DetailTableHeaderView *header = [DetailTableHeaderView greateHeaderView];
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
