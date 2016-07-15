//
//  EditingAddressViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/13.
//  Copyright © 2016年 llb. All rights reserved.
//

// 编辑 送货地址
#import "EditingAddressViewController.h"
#import "DeliverAdressTableViewCell.h"
#import "AddressAndMOdificationViewController.h"

@interface EditingAddressViewController ()<UITableViewDataSource,UITableViewDelegate,modifBtnPushAddressModifVCDelegate>

@end

@implementation EditingAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"送货地址";
    
    self.view.backgroundColor = [UIColor whiteColor];
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-64) style:UITableViewStylePlain];
    tableView.delegate =self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    
    UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 200)];
    footView.backgroundColor = [UIColor whiteColor];
    tableView.tableFooterView = footView;
    
    UILabel *promptLab = [UILabel newAutoLayoutView];
    [footView addSubview:promptLab];
    [promptLab autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [promptLab autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:40];
    [promptLab autoSetDimensionsToSize:CGSizeMake(WIDTH, 20)];
    promptLab.textAlignment = NSTextAlignmentCenter;
    promptLab.text = @"地址最多保留10个，如还需添加请修改";
    promptLab.textColor = BGcolor(188, 188, 188);
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"添加" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(rightButtonClickAction) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.size = CGSizeMake(40, 21);
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
}
- (void)rightButtonClickAction
{
    AddressAndMOdificationViewController *addressModifiVC = [[AddressAndMOdificationViewController alloc]init];
    [self.navigationController pushViewController:addressModifiVC animated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *addressID = @"addressID";
    DeliverAdressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:addressID];
    if (cell == nil) {
        cell = [[DeliverAdressTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:addressID];
        cell.delegate = self;
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 115;
}
- (void)modifBtnDelegate
{
    AddressAndMOdificationViewController *addressModifiVC = [[AddressAndMOdificationViewController alloc]init];
    [self.navigationController pushViewController:addressModifiVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
