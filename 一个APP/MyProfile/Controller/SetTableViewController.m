//
//  SetTableViewController.m
//  一个APP
//
//  Created by 远古科技 on 16/7/16.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "SetTableViewController.h"
#import "SetTableViewCell.h"
#import "SetNameTableViewCell.h"
#import "SetFooterView.h"
@interface SetTableViewController ()

@end

@implementation SetTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.frame = CGRectMake(0, 0, WIDTH, HEIGHT - 64);

    self.title = @"设置";
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    SetFooterView *cell = [[[NSBundle mainBundle]loadNibNamed:@"SetFooterView" owner:nil options:nil]lastObject];
    [cell.outBtn addTarget:self action:@selector(clickOutBtn) forControlEvents:UIControlEventTouchUpInside];
    self.tableView.tableFooterView = cell;
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

    return 7;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        SetTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"SetTableViewCell" owner:nil options:nil]lastObject];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if (indexPath.row == 1) {
        SetNameTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"SetNameTableViewCell" owner:nil options:nil]lastObject];
        cell.RightLabel.text = @"Loki";
        cell.RightLabel.textColor = BGcolor(175, 175, 175);
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if (indexPath.row == 2) {
        SetNameTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"SetNameTableViewCell" owner:nil options:nil]lastObject];
        cell.RightLabel.text = @"添加/修改";
        cell.leftLable.text = @"收货地址";
        cell.LeftImage.image = [UIImage imageNamed:@"shezhi_shouhuodizhi"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if (indexPath.row == 3) {
        SetNameTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"SetNameTableViewCell" owner:nil options:nil]lastObject];
        cell.RightLabel.text = @"更改";
        cell.leftLable.text = @"绑定手机";
        cell.LeftImage.image = [UIImage imageNamed:@"shezhi_bangdingshouji"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } 
    
    if (indexPath.row == 4) {
        SetNameTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"SetNameTableViewCell" owner:nil options:nil]lastObject];
        cell.RightLabel.text = @"2.25M";
        cell.leftLable.text = @"清空缓存";
        cell.LeftImage.image = [UIImage imageNamed:@"shezhi_qingkonghuancun"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if (indexPath.row == 5) {
        SetNameTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"SetNameTableViewCell" owner:nil options:nil]lastObject];
        cell.RightLabel.text = @"修改";
        cell.leftLable.text = @"修改密码";
        cell.LeftImage.image = [UIImage imageNamed:@"shezhi_xiugaimima"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if (indexPath.row == 6) {
        SetNameTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"SetNameTableViewCell" owner:nil options:nil]lastObject];
        cell.RightLabel.text = @"修改";
        cell.leftLable.text = @"安全";
        cell.LeftImage.image = [UIImage imageNamed:@"shezhi_anquan"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    static NSString *reuse = @"reuse";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuse];
    }
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"sdsdsdsdsdsdsd");
}

- (void)clickOutBtn
{
    NSLog(@"123");
}

@end
