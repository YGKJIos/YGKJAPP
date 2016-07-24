//
//  MerchantFoodTableViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/21.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "MerchantFoodTableViewController.h"
#import "VoucherTableViewController.h" // 代金券VC
#import "MerchantHeadView.h"
#import "FavorableWayTableViewCell.h" // 标签cell
#import "MerchantFoodTableViewCell.h" // 美食cell
#import "EvaluateTableViewCell.h" // 评价cell
#import "ErrorInformationView.h"

@interface MerchantFoodTableViewController ()

@end

@implementation MerchantFoodTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = nil;
    
    self.tableView.backgroundColor = BGcolor(194, 194, 194);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return 1;
    }
    return 5;
}
#pragma mark - 添加美食商家 头部View
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        MerchantHeadView *headView = [[NSBundle mainBundle]loadNibNamed:@"MerchantHeadView" owner:nil options:nil].lastObject;
        headView.frame = CGRectMake(0, 0, WIDTH, 195);
    return self.tableView.tableHeaderView = headView;
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 3) {
        return 1;
    }
    if (section == 2) {
        return 4;
    }
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0) {
            FavorableWayTableViewCell *favorableCell = [[FavorableWayTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
            favorableCell.wayImage.image = [UIImage imageNamed:@"ms_tehui"];
            favorableCell.favorableLab.text = @"特惠套餐";
            favorableCell.totalLab.text = @"(共4个)";
            favorableCell.selectionStyle = UITableViewCellSelectionStyleNone;
            return favorableCell;
        }
        MerchantFoodTableViewCell *cell = [MerchantFoodTableViewCell CreateMerchantFoodNib];
        cell.foodImage.image =[UIImage imageNamed:@"meishi_06"];
        cell.foodNameLab.text = @"GG套餐";
        cell.moneyLab.text = @"999";
        cell.originalMoneyLab.text = @"111";
        cell.offerNumLab.text = @"出售24";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.section == 1)
    {
        if (indexPath.row == 0) {
            FavorableWayTableViewCell *favorableCell = [[FavorableWayTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
            favorableCell.wayImage.image = [UIImage imageNamed:@"ms_tehui"];
            favorableCell.favorableLab.text = @"代金券";
            favorableCell.totalLab.text = @"(共22个)";
            favorableCell.selectionStyle = UITableViewCellSelectionStyleNone;
            return favorableCell;
        }
        MerchantFoodTableViewCell *cell = [MerchantFoodTableViewCell CreateMerchantFoodNib];
        cell.foodImage.image =[UIImage imageNamed:@"meishi_06"];
        cell.foodNameLab.text = @"GG套餐";
        cell.moneyLab.text = @"999";
        cell.originalMoneyLab.text = @"111";
        cell.offerNumLab.text = @"出售24";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            FavorableWayTableViewCell *favorableCell = [[FavorableWayTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
            favorableCell.wayImage.image = [UIImage imageNamed:@"ms_tehui"];
            favorableCell.favorableLab.text = @"综合评价";
            favorableCell.totalLab.text = @"(999人评价)";
            favorableCell.selectionStyle = UITableViewCellSelectionStyleNone;
            return favorableCell;
        }
        if (indexPath.row == 3) {
            UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(WIDTH/2 - 60, 5, 120, 40);
            [button setTitle:@"查看全部评论" forState:UIControlStateNormal];
            UIColor *color = BGcolor(65, 186, 206);
            [button setTitleColor:color forState:UIControlStateNormal];
            [button addTarget:self action:@selector(evaluateBtnAction) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:button];
            return cell;
        }
        EvaluateTableViewCell *cell = [EvaluateTableViewCell CreateEvaluateCellNib];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

    }
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(WIDTH/2 - 115, 30, 230, 30);
    [button setBackgroundImage:[UIImage imageNamed:@"ms_baocuo"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(errorBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:button];
    return cell;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        if (indexPath.section == 3) {
            return 90;
        }
        return 40;
    }
    if (indexPath.section == 2) {
        if (indexPath.row > 0) {
            if (indexPath.row == 3) {
                return 50;
            }
            return 117;
        }
    }
    return 90;
}
- (void)evaluateBtnAction
{
    NSLog(@"评论");
}
- (void)errorBtnAction
{
    ErrorInformationView *errorView = [[ErrorInformationView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [errorView showErrorView];
    
}
#pragma mark - tableView点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
    }
    if (indexPath.section == 1) {
        VoucherTableViewController *voucherVC = [[VoucherTableViewController alloc]init];
        [self.navigationController pushViewController:voucherVC animated:YES];
    }
    if (indexPath.section == 2) {
        
    }
    if (indexPath.section == 3) {
        
    }
}

@end
