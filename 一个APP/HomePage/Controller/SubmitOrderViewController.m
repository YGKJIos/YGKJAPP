//
//  SubmitOrderViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/9.
//  Copyright © 2016年 llb. All rights reserved.
//

// 提交订单
#import "SubmitOrderViewController.h"
#import "OrderPersonTableViewCell.h"
#import "MenuOrderTableViewCell.h"
#import "RemarkViewController.h"
#import "EditingAddressViewController.h" // 送货地址

@interface SubmitOrderViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

@property (nonatomic, strong)NSArray *arr;
@property (nonatomic, strong)UIControl *control;
@property (nonatomic, strong)UIView *numPeopleView;

@end

@implementation SubmitOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arr = @[@"鱼丸粗面",@"墨鱼丸粗面",@"鱼丸油面"];
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-64) style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    UIView *view = [[UIView alloc]init];
    tableView.tableFooterView = view;
}

#pragma mark - tableView 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2) {
        return 2;
    }
    if (section == 3) {
        return 4;
    }
    if (section == 4) {
        return 2;
    }
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        OrderPersonTableViewCell *cell = [[OrderPersonTableViewCell alloc]init];
        [cell setOrderPersonCellStyle:InformationOrderPersonCell];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if (indexPath.section == 1) {
        OrderPersonTableViewCell *cell = [[OrderPersonTableViewCell alloc]init];
        [cell setOrderPersonCellStyle:PaymentOrderPersonCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            OrderPersonTableViewCell *cell = [[OrderPersonTableViewCell alloc]init];
            [cell setOrderPersonCellStyle:MerchantSnackCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        if (indexPath.row == 1) {
            MenuOrderTableViewCell *menuCell = [[MenuOrderTableViewCell alloc]init];
            [menuCell setMenuArr:self.arr];
            menuCell.selectionStyle = UITableViewCellSelectionStyleNone;
            return menuCell;
            
        }
        if (indexPath.row == 2) {
            OrderPersonTableViewCell *cell = [[OrderPersonTableViewCell alloc]init];
            [cell setOrderPersonCellStyle:FavorableCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        if (indexPath.row == 3) {
            OrderPersonTableViewCell *cell = [[OrderPersonTableViewCell alloc]init];
            [cell setOrderPersonCellStyle:TotalCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
    }
    if (indexPath.section == 4) {
        if (indexPath.row == 0) {
            UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"beizhuID"];
            cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        if (indexPath.row == 1) {
            OrderPersonTableViewCell *cell = [[OrderPersonTableViewCell alloc]init];
            [cell setOrderPersonCellStyle:SurePayOrderCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
    }
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"beizhuID"];
    cell.textLabel.text = @"备注";
    cell.detailTextLabel.text = @"选填（口味，菜品要求等）";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 75;
    }
    if (indexPath.section == 3) {
        if (indexPath.row == 1) {
            return (self.arr.count *30);
        }
    }
    return 49;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 10;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 &&indexPath.row==0) {
        EditingAddressViewController *editAddressVC = [[EditingAddressViewController alloc]init];
        [self.navigationController pushViewController:editAddressVC animated:YES];
    }
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            RemarkViewController *remarkVC = [[RemarkViewController alloc]init];
            remarkVC.title = @"备注";
            [self.navigationController pushViewController:remarkVC animated:YES];
        }
        if (indexPath.row == 1) {
            [self addNumberOfPeople];
        }
    }
}
#pragma mark -用餐人数
- (void)addNumberOfPeople
{
    self.control = [[UIControl alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    self.control.alpha = 0.4;
    self.control.backgroundColor = BGcolor(108, 108, 108);
    [self.control addTarget:self action:@selector(controlAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.control];
    
    self.numPeopleView = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT-200-64, WIDTH, 200)];
    self.numPeopleView.alpha = 1;
    self.numPeopleView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.numPeopleView];
    
    UILabel *textLab = [UILabel newAutoLayoutView];
    [self.numPeopleView addSubview:textLab];
    textLab.text = @"请输入用餐人数:";
    textLab.textAlignment = NSTextAlignmentRight;
    textLab.textColor = BGcolor(65, 186, 206);
    textLab.font = [UIFont systemFontOfSize:19];
    [textLab autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [textLab autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:WIDTH/2-144];
    [textLab autoSetDimensionsToSize:CGSizeMake(144, 20)];
    
    UITextField *numTextF = [UITextField newAutoLayoutView];
    [self.numPeopleView addSubview:numTextF];
    numTextF.backgroundColor = BGcolor(223, 223, 223);
    numTextF.text = @"1";
    numTextF.delegate = self;
    numTextF.layer.masksToBounds = YES;
    numTextF.keyboardType = UIKeyboardTypeNumberPad;
    numTextF.layer.cornerRadius = 5;
    numTextF.textAlignment = NSTextAlignmentCenter;
    [numTextF autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:textLab withOffset:5 relation:NSLayoutRelationEqual];
    [numTextF autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [numTextF autoSetDimensionsToSize:CGSizeMake(92, 30)];
    
    UILabel *people = [UILabel newAutoLayoutView];
    people.text = @"人";
    people.font = [UIFont systemFontOfSize:19];
    people.textColor = BGcolor(65, 186, 206);
    [self.numPeopleView addSubview:people];
    [people autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [people autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:numTextF withOffset:5 relation:NSLayoutRelationEqual];
    [people autoSetDimensionsToSize:CGSizeMake(20, 20)];
    
}
- (void)controlAction
{
    [self.control removeFromSuperview];
    [self.numPeopleView removeFromSuperview];
    
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    self.numPeopleView.frame = CGRectMake(0, HEIGHT-200-54-250, WIDTH, 200);
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
