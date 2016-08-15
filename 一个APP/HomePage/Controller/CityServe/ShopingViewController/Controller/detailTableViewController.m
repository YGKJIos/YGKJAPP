//
//  detailTableViewController.m
//  一个APP
//
//  Created by 远古科技 on 16/7/22.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "detailTableViewController.h"
#import "ShopIntroduceTableViewCell.h"
#import "headerView.h"
#import "MerchantInformationModel.h"
#import "activeTableViewCell.h"
#import "recommendTableViewCell.h"
@interface detailTableViewController ()

@end

@implementation detailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.model.shangjiaName;
    self.tableView.backgroundColor = BGcolor(205, 205, 205);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        static NSString *reuse = @"reuse";
        ShopIntroduceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
        if (!cell) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"ShopIntroduceTableViewCell" owner:nil options:nil].lastObject;
        }
        [cell setShopInformationModel:self.model];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if (indexPath.section == 1) {
        static NSString *reuse = @"reuse";
        activeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
        if (!cell) {
            cell = [activeTableViewCell greateCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.contentLab.text = self.model.shangjiaTongzhi;
        return cell;
    }
//    if (indexPath.section == 2) {
//        static NSString *reuse = @"reuse";
//        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
//        if (!cell) {
//            cell = [recommendTableViewCell greateCell];
//            cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        }
//        return cell;
//    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 130;
    }
    if (indexPath.section == 1) {
        return 140;
    }
//    if (indexPath.section == 2) {
//        return 240;
//    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        headerView *header = [headerView greateHeaderView];
        [header setModel:self.model];
        tableView.tableHeaderView = header;
    }
    return nil;
}



@end
