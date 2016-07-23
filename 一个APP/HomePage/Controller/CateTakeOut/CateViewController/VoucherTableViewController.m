//
//  VoucherTableViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/23.
//  Copyright © 2016年 llb. All rights reserved.
//

// 代金券页面
#import "VoucherTableViewController.h"
#import "GroupPurchaseView.h"  // headerView
#import "ConsumePromptTableViewCell.h" //消费提示
#import "ShopIntroduceTableViewCell.h" // 商家介绍
#import "FoodIntroduceTableViewCell.h" // 套餐介绍
#import "StarEvaluateTotalTableViewCell.h" // 评价cell

@interface VoucherTableViewController ()

@end

@implementation VoucherTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = BGcolor(198, 198, 198);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
        return 0;
    }
    if (section == 3) {
        return 2;
    }
    
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        StarEvaluateTotalTableViewCell *cell = [[StarEvaluateTotalTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    if (indexPath.section == 2) {
        ShopIntroduceTableViewCell *shopCell = [[NSBundle mainBundle]loadNibNamed:@"ShopIntroduceTableViewCell" owner:nil options:nil].lastObject;
        shopCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return shopCell;
    }
    if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            FoodIntroduceTableViewCell *foodCell = [[NSBundle mainBundle]loadNibNamed:@"FoodIntroduceTableViewCell" owner:nil options:nil].lastObject;
            foodCell.selectionStyle = UITableViewCellSelectionStyleNone;
            return foodCell;
        }else{
            UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            UILabel *textLab = [[UILabel alloc]initWithFrame:CGRectMake(30, 15, 120, 20)];
            textLab.textColor = BGcolor(65, 186, 206);
            textLab.text = @"查看图片详情";
            [cell.contentView addSubview:textLab];
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH-36, 19, 6, 12)];
            imageView.image = [UIImage imageNamed:@"djq_jiantoulan"];
            [cell.contentView addSubview:imageView];
            return cell;
        }
    }else
    {
        ConsumePromptTableViewCell *consumeCell = [[NSBundle mainBundle]loadNibNamed:@"ConsumePromptTableViewCell" owner:nil options:nil].lastObject;
        consumeCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return consumeCell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        return 46;
    }else if (indexPath.section == 2){
        return 132;
    }else if (indexPath.section == 3)
    {
        if (indexPath.row == 1) {
            return 50;
        }
        return 81;
    }else
    {
        return 536;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        
        GroupPurchaseView *groupView = [[NSBundle mainBundle]loadNibNamed:@"GroupPurchaseView" owner:nil options:nil].lastObject;
        groupView.frame = CGRectMake(0, 0, WIDTH, 0);
        groupView.backgroundColor = [UIColor whiteColor];
        self.tableView.tableHeaderView = groupView;
        return tableView.tableHeaderView;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 255;
    }
    return 5;
}
@end
