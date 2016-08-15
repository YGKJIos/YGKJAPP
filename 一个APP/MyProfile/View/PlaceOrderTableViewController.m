//
//  PlaceOrderTableViewController.m
//  一个APP
//
//  Created by 远古科技 on 16/8/9.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "PlaceOrderTableViewController.h"
#import "PlaceOrderTableViewCell.h"
#import "PhoneTableViewCell.h"
#import "PlaceOrderFootView.h"
@interface PlaceOrderTableViewController ()

@end

@implementation PlaceOrderTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"提交订单";
    self.tableView.backgroundColor = BGcolor(247, 247, 247);
    PlaceOrderFootView *cell = [PlaceOrderFootView createCell];
    cell.frame = CGRectMake(0, 0, WIDTH, 200);
    cell.backgroundColor = BGcolor(247, 247, 247);
    self.tableView.tableFooterView = cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuse = @"reuse";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (indexPath.section == 0) {
        cell = [PlaceOrderTableViewCell createCell];
    }
    if (indexPath.section == 1) {
        cell = [PhoneTableViewCell createCell];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 335;
    }
    return 65;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 10;
    }
    return 3;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        NSLog(@"sdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsd");
    }
}

@end
