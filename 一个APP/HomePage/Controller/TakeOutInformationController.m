//
//  TakeOutInformationController.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/5.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "TakeOutInformationController.h"
#import "TakeOutInformationView.h"
#import "TakeOutRightTableCell.h"
#import "ShoppingCartViewController.h" //购物车页面
#import "AddFoodView.h"

@interface TakeOutInformationController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)UIView *line;
@property (nonatomic, strong)UIButton *cateBtn;
@property (nonatomic, strong)UIButton *evaluateBtn;
@property (nonatomic, strong)UIButton *introduceBtn;
@property (nonatomic, strong)UITableView *leftTableView;
@property (nonatomic, strong)UITableView *rightTableView;
@property (nonatomic, strong)NSMutableArray *listArr; // 左边菜品
@property (nonatomic, strong)NSMutableArray *foodArr;// 右边菜品信息
@property (nonatomic, strong)UIButton *jianBtn; // 减少按钮
@property (nonatomic, strong)UIButton *jiaBtn; // 增加按钮
@property (nonatomic, strong)UILabel *numLab; // 显示份数的lab
@property (nonatomic, assign)NSInteger num; //点击增加 菜品份数计数
@property (nonatomic, strong)UIControl *control; // 蒙版
@property (nonatomic, assign)BOOL result;
@property (nonatomic, strong)AddFoodView *foodView;
@end

@implementation TakeOutInformationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.result = YES;
    self.num = 0;
    self.view.backgroundColor = [UIColor whiteColor];
    self.listArr = [NSMutableArray arrayWithObjects:@"热销菜品",@"套餐",@"盖饭",@"炒菜",@"凉菜",@"饮品", nil];
    
    TakeOutInformationView *headView = [TakeOutInformationView CreateInformationNib];
    headView.frame = CGRectMake(0, 0, WIDTH, 220);
    [headView.cateBtn addTarget:self action:@selector(cateBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [headView.evaluateBtn addTarget:self action:@selector(evaluateBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [headView.introduceBtn addTarget:self action:@selector(introduceBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.cateBtn = headView.cateBtn;
    self.evaluateBtn = headView.evaluateBtn;
    self.introduceBtn = headView.introduceBtn;
    self.line = headView.scrollLine;
    [self.view addSubview:headView];
    [self addTableView];
    [self addFoodView];
}
#pragma mark - 网络请求


#pragma mark - 添加店铺的菜品
- (void)addTableView
{
    self.leftTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 220, 114*WIDTH/375, HEIGHT-220-113) style:UITableViewStylePlain];
    self.leftTableView.delegate = self;
    self.leftTableView.dataSource = self;
    self.leftTableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.leftTableView];
    
    UIView *leftview = [[UIView alloc]init];
    self.leftTableView.tableFooterView = leftview;
    
    self.rightTableView = [[UITableView alloc]initWithFrame:CGRectMake(114*WIDTH/375, 220, WIDTH -114*WIDTH/375 , HEIGHT-220-113) style:UITableViewStylePlain];
    self.rightTableView.delegate = self;
    self.rightTableView.dataSource = self;
    self.rightTableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.rightTableView];
    
    UIView *rightview = [[UIView alloc]init];
    self.leftTableView.tableFooterView = rightview;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.leftTableView == tableView) {
        return self.listArr.count;
    }
    else
    {
        return 10;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == self.leftTableView) {
        static NSString *orderID = @"orderID";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:orderID];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:orderID];
        }
        cell.detailTextLabel.text = self.listArr[indexPath.row];
        return cell;
    }
    else
    {
        static NSString *rightID = @"rightID";
        TakeOutRightTableCell *cell = [tableView dequeueReusableCellWithIdentifier:rightID];
        if (cell == nil) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"TakeOutRightTableCell" owner:nil options:nil].lastObject;
            cell.jianBtn.tag = 1000+indexPath.row;
            cell.jiaBtn.tag = 2000+indexPath.row;
            cell.numberLab.tag = 3000+indexPath.row;
            [cell.jiaBtn addTarget:self action:@selector(addBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell.jianBtn addTarget:self action:@selector(jianBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        }
        return cell;
    }
}
#pragma mark - 加、减按钮的点击方法
- (void)addBtnClick:(UIButton *)btn
{
    UITableViewCell * cell = (UITableViewCell *)[[btn superview] superview];
    NSIndexPath * path = [self.rightTableView indexPathForCell:cell];
    NSLog(@"index row%ld", [path row]);
    ++self.num;
    if (self.num >= 1) {
        UIButton *jianBtn = [self.view viewWithTag:path.row+1000];
        jianBtn.hidden = NO;
        UILabel *numlab = [self.view viewWithTag:path.row+3000];
        numlab.hidden = NO;
        numlab.text = [NSString stringWithFormat:@"%ld",self.num];
    }
}
- (void)jianBtnClick:(UIButton *)btn
{
    UITableViewCell * cell = (UITableViewCell *)[[btn superview] superview];
    NSIndexPath * path = [self.rightTableView indexPathForCell:cell];
    if (self.num <= 0) {
        return;
    }else{
        --self.num;
        UILabel *numlab = [self.view viewWithTag:path.row+3000];
        numlab.text = [NSString stringWithFormat:@"%ld",self.num];
        if (self.num == 0) {
            UIButton *jianBtn = [self.view viewWithTag:path.row+1000];
            jianBtn.hidden = YES;
            
            numlab.hidden = YES;
        }
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (tableView == self.rightTableView) {
        
        UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH -114*WIDTH/375, 40)];
        headView.backgroundColor = [UIColor whiteColor];
        
        UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(headView.centerX-50, headView.centerY-10, 100, 20)];
        titleLab.text = @"热销菜品";
        titleLab.textAlignment = NSTextAlignmentCenter;
        titleLab.font = [UIFont systemFontOfSize:16];
        titleLab.textColor = BGcolor(198, 198, 198);
        [headView addSubview:titleLab];
        
        UIView *leftLine = [[UIView alloc]initWithFrame:CGRectMake(titleLab.x-40, headView.center.y, 40, 1)];
        leftLine.backgroundColor = BGcolor(65, 187, 206);
        [headView addSubview:leftLine];
        
        UIView *rightLine = [[UIView alloc]initWithFrame:CGRectMake(titleLab.x+titleLab.width, headView.centerY, 40, 1)];
        rightLine.backgroundColor = BGcolor(65, 187, 206);
        [headView addSubview:rightLine];
        
        return headView;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.rightTableView) {
        return 82;
    }
    return 44;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (tableView == self.rightTableView) {
        return 40;
    }
    return 0;
}
#pragma mark - 添加选择菜品的View
- (void)addFoodView
{
    self.control = [[UIControl alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.control.backgroundColor = BGcolor(163, 163, 163);
    [self.control addTarget:self action:@selector(controlAction) forControlEvents:UIControlEventTouchUpInside];
    self.control.alpha = 0.4;
    self.control.hidden = YES;
    [self.view addSubview:self.control];
    
    self.foodView = [AddFoodView CreateAddFoodView];
    [self.foodView setUserInteractionEnabled:YES];
    self.foodView.origin = CGPointMake(0, HEIGHT-113);
    self.foodView.tag = 5000;
    self.foodView.width = WIDTH;
    self.foodView.height = 450;
//    foodView.backgroundColor = [UIColor blueColor];
    [self.foodView.orderMoneyBtn addTarget:self action:@selector(orderMoneyBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.foodView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClickAction:)];
    [self.foodView addGestureRecognizer:tap];
    
}
- (void)tapClickAction:(UITapGestureRecognizer *)tap
{
//    UIView *view = tap.view;
//    if (self.result) {
//        self.control.hidden = NO;
//        [UIView animateWithDuration:0.2 animations:^{
//            view.origin = CGPointMake(0, HEIGHT - 450);
//        }];
//    }else{
//        self.control.hidden = YES;
//        [UIView animateWithDuration:0.2 animations:^{
//            view.origin = CGPointMake(0, HEIGHT-113);
//        }];
//    }
//    self.result = !self.result;
    ShoppingCartViewController *shopVC = [[ShoppingCartViewController alloc]init];
    [self.navigationController pushViewController:shopVC animated:YES];
    
}
- (void)controlAction
{
    self.control.hidden = YES;
    UIView *view = [self.view viewWithTag:5000];
    [UIView animateWithDuration:0.2 animations:^{
        view.origin = CGPointMake(0, HEIGHT-113);
    }];
}
- (void)orderMoneyBtnClick:(UIButton *)btn
{
    NSLog(@"123");
}

// 店内餐品点击方法
- (void)cateBtnClick
{
    [UIView animateWithDuration:0.2 animations:^{
        self.line.centerX = self.cateBtn.centerX;
    }];
}
// 评价点击方法
- (void)evaluateBtnClick
{
    [UIView animateWithDuration:0.2 animations:^{
        self.line.centerX = self.evaluateBtn.centerX;
    }];
}
// 商家介绍点击方法
- (void)introduceBtnClick
{
    [UIView animateWithDuration:0.2 animations:^{
        self.line.centerX = self.introduceBtn.centerX;
    }];
}



@end
