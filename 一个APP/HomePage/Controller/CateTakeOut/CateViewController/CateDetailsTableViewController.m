//
//  CateDetailsTableViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/25.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "CateDetailsTableViewController.h"
#import "carWashTableViewController.h"
#import "VoucherTableViewController.h"
#import "DetailTableHeaderView.h"  // 头部 商家信息
#import "groupTableViewCell.h"
#import "CarEvaluateTableViewCell.h"  // 评论 cell
#import "ShowAllAndErorrCell.h"   // 查看全部信息 或者 错误反馈
#import "voucherTableViewCell.h"
#import "TitleCellTableViewCell.h"
#import "ErrorInformationView.h" //报错页面

@interface CateDetailsTableViewController ()

@end

@implementation CateDetailsTableViewController

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
            TitleCellTableViewCell *titleCell = [TitleCellTableViewCell createSectionTitleCellNib];
            [titleCell setTitleImage:@"ms_pingjia" titleLab:@"评价 (1024)"];
            titleCell.selectionStyle = UITableViewCellSelectionStyleNone;
            return titleCell;
        }else if (indexPath.row == 1)
        {
            static NSString *reuse = @"reuse";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
            if (!cell) {
                cell = [CarEvaluateTableViewCell greateEvaluateCell];
            }
            return cell;
        }else
        {
            ShowAllAndErorrCell *cell = [[ShowAllAndErorrCell alloc]init];
            [cell setShowAllAndErorrCellStyle:showAllCellStyle];
            return cell;
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
        if (indexPath.row == 1) {
            return 154;
        }
        return 44;
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

#pragma mark - table点击方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        if (indexPath.row > 0) {
            
            VoucherTableViewController *washVC = [[VoucherTableViewController alloc] init];
            [self.navigationController pushViewController:washVC animated:YES];
        }
    }
    if (indexPath.section == 1) {
        if (indexPath.row >0 ) {
            NSLog(@"全部");
        }
    }
    if (indexPath.section == 2)
    {
        ErrorInformationView *errorView = [[ErrorInformationView alloc]initWithFrame:self.view.frame];
        [errorView showErrorView];
    }
}

@end
