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
@property (nonatomic, strong)UILabel *textLabel;
@property (nonatomic, strong)UITableView *tableView;

@end

@implementation ShoppingCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.shopModel.shangjiaName;
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-64-57) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    [self addHeardView:self.tableView];
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
    
    self.textLabel = [UILabel newAutoLayoutView];
    [view addSubview:self.textLabel];
    [self.textLabel autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:43];
    [self.textLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:9];
    [self.textLabel autoSetDimensionsToSize:CGSizeMake(18, 18)];
    self.textLabel.layer.masksToBounds = YES;
    self.textLabel.layer.cornerRadius = 9;
    self.textLabel.text = [NSString stringWithFormat:@"%ld",self.selectArr.count];
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    self.textLabel.backgroundColor = BGcolor(250, 83, 68);
    self.textLabel.textColor = [UIColor whiteColor];
    self.textLabel.font = [UIFont systemFontOfSize:12];
    
//    UIButton *deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [view addSubview:deleteBtn];
//    [deleteBtn setBackgroundImage:[UIImage imageNamed:@"waimai_qingchu"] forState:UIControlStateNormal];
//    [deleteBtn autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:30];
//    [deleteBtn autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:21];
//    [deleteBtn autoSetDimensionsToSize:CGSizeMake(82, 15.5)];
//    [deleteBtn addTarget:self action:@selector(delegateBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *boomLine = [[UIView alloc]initWithFrame:CGRectMake(0, 56, WIDTH, 1)];
    boomLine.backgroundColor = BGcolor(143, 143, 143);
    [view addSubview:boomLine];
 
}
//- (void)delegateBtnAction
//{
//    self.textLabel.hidden = YES;
//    [self.delegate deleteSelectShiPinDelegate:YES];
//    [self.tableView reloadData];
//}
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
    NSString *totalMoney = [self totalMoney:self.selectArr];
    moneyLab.text= [NSString stringWithFormat:@"应支付：¥%@",totalMoney];
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
    NSString *str = [self totalMoney:self.selectArr];
    if (str.integerValue < self.shopModel.qisongjia.integerValue) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.labelText = @"没有达到起送价~!";
        [hud show:YES];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            hud.hidden = YES;
        });
    }else{
        SubmitOrderViewController *submitVC = [[SubmitOrderViewController alloc]init];
        submitVC.selectArr = self.selectArr;
        submitVC.shopModel = self.shopModel;
        [self.navigationController pushViewController:submitVC animated:YES];
    }
}

#pragma mark - tableView代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.selectArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *shopID = @"shopID";
    ShoppingCartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:shopID];
    if (cell == nil) {
        cell = [[ShoppingCartTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:shopID];
    }
    MerchantInformationModel *model = self.selectArr[indexPath.row];
    cell.dishesLab.text = model.waimaishipinName;
    cell.moneyLab.text = [NSString stringWithFormat:@"¥%@",model.waimaishipinJiage];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

// 计算价钱
- (NSString *)totalMoney:(NSMutableArray *)arr
{
    CGFloat totalNum = 0;
    NSString *total = [NSString string];
    for (int i = 0; i < arr.count; i++) {
        MerchantInformationModel *model = arr[i];
       totalNum += model.waimaishipinJiage.floatValue;
        total = [NSString stringWithFormat:@"%0.2f",totalNum];
    }
    return total;
}


@end
