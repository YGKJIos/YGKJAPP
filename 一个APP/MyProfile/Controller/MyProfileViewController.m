//
//  MyProfileViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/16.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "MyProfileViewController.h"
#import "FictionTableViewCell.h"
#import "profileHeaderView.h"
#import "MenuTableViewCell.h"
#import "SetTableViewController.h"
#import "orderViewController.h"

@interface MyProfileViewController ()<UITableViewDataSource,UITableViewDelegate,orderDelegate>
@property (nonatomic, strong)NSArray *images;
@property (nonatomic, strong)NSArray *titles;

@end

@implementation MyProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self data];
    
    UIBarButtonItem *barBtn = [UIBarButtonItem itemWithTarget:self action:@selector(RightAction) image:@"shezhi" highImage:@""];
    self.navigationItem.rightBarButtonItem = barBtn;
    [self addTableView];
}
- (void)RightAction
{
    
    NSLog(@"daksjhdkajshdkjashdlkashdlkashdklahdkl");
    NSLog(@"wode_rightBarButtonItem");
}
- (void)addTableView{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-113) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = BGcolor(222, 222, 222);
    [self.view addSubview:tableView];
    tableView.showsVerticalScrollIndicator = NO;
    tableView.separatorInset = UIEdgeInsetsMake(0, 30, 0, 30);
    
    profileHeaderView *view = [profileHeaderView CreateProfileHeaderView];

    tableView.tableHeaderView = view;
    UIView *colorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 220)];
    colorView.backgroundColor = [UIColor whiteColor];
    tableView.tableFooterView = colorView;

}
- (void)data
{
    self.images = @[@"wode_youhui",@"wode_kefu",@"wode_kaidian",@"wode_tuijian"];
    self.titles = @[@"优惠劵",@"联系客服",@"我要开店", @"推荐码"];
}
// section
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    } else {
        
        return 5;
    }
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

// rows
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        FictionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fictionID"];
        if (cell==nil) {
            cell = [[FictionTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"fictionID"];
            cell.delegate = self;
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }

    
    MenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"menuId"];
    if (!cell) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"MenuTableViewCell" owner:nil options:nil].lastObject;
//        if (indexPath.section==1&&indexPath.row == 2) {
//            cell.balanceLab.text = @"0";
//        }
        cell.balanceLab.hidden = YES;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.MenuImage.image = [UIImage imageNamed:self.images[indexPath.row]];
        cell.nameLab.text = self.titles[indexPath.row];
        if (indexPath.section == 2) {
            cell.MenuImage.image = [UIImage imageNamed:self.images[indexPath.row+3]];
            cell.nameLab.text = self.titles[indexPath.row+3];
        }
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        return 48;
    }
    if (indexPath.section == 2) {
        return 157/3;
    }
    return 67;
}

- (void) orderDelegate
{
    orderViewController *orderVC = [[orderViewController alloc] init];
    
    [self.navigationController pushViewController:orderVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
