//
//  ShoppingCartViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/9.
//  Copyright © 2016年 llb. All rights reserved.
//  购物车页面。 

#import "ShoppingCartViewController.h"
#import "ShoppingCartTableViewCell.h"
#import "SubmitOrderViewController.h"

@interface ShoppingCartViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ShoppingCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-64-57) style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    [self addHeardView:tableView];
    [self addBottomView];
}
#pragma mark - 添加tableview 的头视图
- (void)addHeardView:(UITableView *)table;
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 56)];
    table.tableHeaderView = view;
    
    UIImageView *shopCartImage = [UIImageView newAutoLayoutView];
    shopCartImage.image = [UIImage imageNamed:@"waimai_gouwuchelan"];
    [view addSubview:shopCartImage];
    [shopCartImage autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:30];
    [shopCartImage autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:16];
    [shopCartImage autoSetDimensionsToSize:CGSizeMake(25, 25)];
    
    UILabel *textLabel = [UILabel newAutoLayoutView];
    [view addSubview:textLabel];
    [textLabel autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:43];
    [textLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:9];
    [textLabel autoSetDimensionsToSize:CGSizeMake(18, 18)];
    textLabel.layer.masksToBounds = YES;
    textLabel.layer.cornerRadius = 9;
    textLabel.text = @"2";
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.backgroundColor = BGcolor(250, 83, 68);
    textLabel.textColor = [UIColor whiteColor];
    textLabel.font = [UIFont systemFontOfSize:12];
    
    UIButton *deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [view addSubview:deleteBtn];
    [deleteBtn setBackgroundImage:[UIImage imageNamed:@"waimai_qingchu"] forState:UIControlStateNormal];
    [deleteBtn autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:30];
    [deleteBtn autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:21];
    [deleteBtn autoSetDimensionsToSize:CGSizeMake(82, 15.5)];
    [deleteBtn addTarget:self action:@selector(delegateBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *boomLine = [[UIView alloc]initWithFrame:CGRectMake(0, 56, WIDTH, 1)];
    boomLine.backgroundColor = BGcolor(143, 143, 143);
    [view addSubview:boomLine];
 
}
- (void)delegateBtnAction
{
    NSLog(@"deleta");
}
#pragma mark - 添加bottom view
- (void)addBottomView
{
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT-64-57, WIDTH, 57)];
    [self.view addSubview:bgView];
    
    UIView *bottomLine = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 1)];
    bottomLine.backgroundColor = BGcolor(143, 143, 143);
    [bgView addSubview:bottomLine];
    
    UILabel *moneyLab = [UILabel newAutoLayoutView];
    [bgView addSubview:moneyLab];
    moneyLab.text= @"¥15";
    moneyLab.font = [UIFont systemFontOfSize:20];
    moneyLab.textColor = BGcolor(250, 83, 68);
    [moneyLab autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [moneyLab autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:30];
    
    UIButton *certainBtn = [UIButton newAutoLayoutView];
    [bgView addSubview:certainBtn];
    [certainBtn autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:0];
    [certainBtn autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    [certainBtn autoSetDimensionsToSize:CGSizeMake(150, 57)];
    certainBtn.backgroundColor = BGcolor(65, 187, 207);
    [certainBtn addTarget:self action:@selector(certainBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [certainBtn setTitle:@"确认下单" forState:UIControlStateNormal];
    [certainBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

}
- (void)certainBtnAction
{
    SubmitOrderViewController *submitVC = [[SubmitOrderViewController alloc]init];
    [self.navigationController pushViewController:submitVC animated:YES];
}

#pragma mark - tableView代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *shopID = @"shopID";
    ShoppingCartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:shopID];
    if (cell == nil) {
        cell = [[ShoppingCartTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:shopID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
