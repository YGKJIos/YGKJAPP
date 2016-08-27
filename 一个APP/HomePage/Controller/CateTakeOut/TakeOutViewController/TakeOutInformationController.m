//
//  TakeOutInformationController.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/5.
//  Copyright © 2016年 llb. All rights reserved.
//
//   外卖详情
#import "TakeOutInformationController.h"
#import "SubmitOrderViewController.h"
#import "TakeOutInformationView.h"
#import "TakeOutRightTableCell.h"
#import "ShoppingCartViewController.h" //购物车页面
#import "AddFoodView.h"

@interface TakeOutInformationController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)UIView *line;
@property (nonatomic, strong)UIButton *cateBtn; // 食品
@property (nonatomic, strong)UIButton *evaluateBtn; // 评论
@property (nonatomic, strong)UIButton *introduceBtn; // 介绍
//@property (nonatomic, strong)UITableView *leftTableView;
@property (nonatomic, strong)UITableView *rightTableView;
@property (nonatomic, strong)NSMutableArray *listArr; // 左边菜品
//@property (nonatomic, strong)NSMutableArray *allFoods; // 右边全部食品
@property (nonatomic, strong)NSMutableArray *foodArr;// 显示菜品信息
@property (nonatomic, strong)UIButton *jianBtn; // 减少按钮
@property (nonatomic, strong)UIButton *jiaBtn; // 增加按钮
@property (nonatomic, strong)UILabel *numLab; // 显示份数的lab
@property (nonatomic, assign)NSInteger num; //点击增加 菜品份数计数
@property (nonatomic, copy)NSString *titleText; // 右边tableView  sectionView
@property (nonatomic, assign)UIButton *textBtn;
@property (nonatomic, strong)AddFoodView *foodView;
@property (nonatomic, strong)NSMutableArray *selectArr;
@property (nonatomic, assign)BOOL result;

@end

@implementation TakeOutInformationController

-(NSMutableArray *)foodArr
{
    if (!_foodArr) {
        self.foodArr = [[NSMutableArray alloc]init];
    }
    return _foodArr;
}
//-(NSMutableArray *)allFoods
//{
//    if (!_allFoods) {
//        self.allFoods = [[NSMutableArray alloc]init];
//    }
//    return _allFoods;
//}
-(NSMutableArray *)selectArr
{
    if (!_selectArr) {
        self.selectArr = [[NSMutableArray alloc]init];
    }
    return _selectArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.result = NO;
    self.num = 0;
    self.view.backgroundColor = [UIColor whiteColor];
    // 收藏按钮
//    UIBarButtonItem *rightItme = [UIBarButtonItem itemWithTarget:self action:@selector(rightBarButtonItemClickItme) image:@"wode_sctb" highImage:@"wode_sctb"];
    //    self.listArr = [NSMutableArray arrayWithObjects:@"食品",@"饮品",@"其他" ,nil];
    self.navigationItem.rightBarButtonItem = nil;
    TakeOutInformationView *headView = [TakeOutInformationView CreateInformationNib];
    headView.frame = CGRectMake(0, 0, WIDTH, 220);
    [headView setModel:self.model];
//    [headView.cateBtn addTarget:self action:@selector(cateBtnClick) forControlEvents:UIControlEventTouchUpInside];
//    [headView.evaluateBtn addTarget:self action:@selector(evaluateBtnClick) forControlEvents:UIControlEventTouchUpInside];
//    [headView.introduceBtn addTarget:self action:@selector(introduceBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.cateBtn = headView.cateBtn;
    self.evaluateBtn = headView.evaluateBtn;
    self.introduceBtn = headView.introduceBtn;
    self.line = headView.scrollLine;
    [self.view addSubview:headView];
    [self addTableView]; // 添加  左右 的tableView
    [self addFoodView];  // 添加 下面的 选择
    [self loadData];
}
- (void)rightBarButtonItemClickItme
{
    NSLog(@"点击收藏");
}
- (void)viewWillAppear:(BOOL)animated
{
    if (self.result) {
        [self loadData];
    }
    [super viewWillAppear:animated];
}
#pragma mark - 网络请求
- (void)loadData
{
    NSDictionary *dic = @{@"shangjiaId":self.model.shangjiaId};
    [AFNetWorting postNetWortingWithUrlString:@"waimai//querywaimaishipin.action?" params:dic controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
        for (NSDictionary *dic in responseObject) {
            MerchantInformationModel *model = [[MerchantInformationModel alloc]init];
            [model setValuesForKeysWithDictionary:dic];
            [self.foodArr addObject:model];
        }
        [self.rightTableView reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}
#pragma mark - 添加店铺的菜品
- (void)addTableView
{
//    self.leftTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 220, 114*WIDTH/375, HEIGHT-220-113) style:UITableViewStylePlain];
//    self.leftTableView.delegate = self;
//    self.leftTableView.dataSource = self;
//    self.leftTableView.showsVerticalScrollIndicator = NO;
//    [self.view addSubview:self.leftTableView];
//    [_leftTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"orderID"];
//    UIView *leftview = [[UIView alloc]init];
//    self.leftTableView.tableFooterView = leftview;
    
    self.rightTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 220, WIDTH, HEIGHT-220-113) style:UITableViewStylePlain];
    self.rightTableView.delegate = self;
    self.rightTableView.dataSource = self;
    
    [_rightTableView registerNib:[UINib nibWithNibName:@"TakeOutRightTableCell" bundle:nil] forCellReuseIdentifier:@"rightID"];
    self.rightTableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.rightTableView];
    
    UIView *rightview = [[UIView alloc]init];
    self.rightTableView.tableFooterView = rightview;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    if (self.leftTableView == tableView) {
//        return self.listArr.count;
//    }

    return self.foodArr.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    if (tableView == self.leftTableView) {
//        static NSString *orderID = @"orderID";
//        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:orderID];
//        cell.textLabel.text = self.listArr[indexPath.row];
//        return cell;
//    }else if(tableView == self.rightTableView){
        TakeOutRightTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rightID" forIndexPath:indexPath];
        if (self.foodArr.count > 0) {
            MerchantInformationModel *model = self.foodArr[indexPath.row];
            [cell setTakeOutRightTableModel:model];
            if (model.gwsz.integerValue == 0) {
                cell.numberLab.hidden = YES;
                cell.jianBtn.hidden = YES;
            } else {
                cell.numberLab.hidden = NO;
                cell.jianBtn.hidden = NO;
            }
        }
        cell.jianBtn.tag = 1000+indexPath.row;
        cell.jiaBtn.tag = 2000+indexPath.row;
        cell.numberLab.tag = 3000+indexPath.row;
        [cell.jiaBtn addTarget:self action:@selector(addBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell.jianBtn addTarget:self action:@selector(jianBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
}
#pragma mark - 加、减按钮的点击方法
- (void)addBtnClick:(UIButton *)btn
{
    NSInteger number = btn.tag-2000;
    MerchantInformationModel *model = self.foodArr[number];
    model.gwsz = [NSString stringWithFormat:@"%ld",model.gwsz.integerValue + 1];
    if (model.gwsz.integerValue > 0){
        self.foodView.orderNum.hidden = NO;
        UIButton *jianBtn = [self.view viewWithTag:number+1000];
        jianBtn.hidden = NO;
        UILabel *numlab = [self.view viewWithTag:number+3000];
        numlab.hidden = NO;
        numlab.text = [NSString stringWithFormat:@"%@",model.gwsz];
    } else {
        self.foodView.orderNum.hidden = NO;
        UIButton *jianBtn = [self.view viewWithTag:number+1000];
        jianBtn.hidden = NO;
        UILabel *numlab = [self.view viewWithTag:number+3000];
        numlab.hidden = NO;
        numlab.text = [NSString stringWithFormat:@"%@",model.gwsz];
    }
    [self.foodArr replaceObjectAtIndex:number withObject:model];
    [self.selectArr addObject:model];
    [self setFoodViewTotal];
}
- (void)jianBtnClick:(UIButton *)btn
{
    NSInteger number = btn.tag-1000;
    MerchantInformationModel *model = self.foodArr[number];
    model.gwsz = [NSString stringWithFormat:@"%ld",model.gwsz.integerValue - 1];
    if (model.gwsz.integerValue > 0){
        UIButton *jianBtn = [self.view viewWithTag:number+1000];
        jianBtn.hidden = NO;
        UILabel *numlab = [self.view viewWithTag:number+3000];
        numlab.hidden = NO;
        numlab.text = [NSString stringWithFormat:@"%@",model.gwsz];
    } else {
        UIButton *jianBtn = [self.view viewWithTag:number+1000];
        jianBtn.hidden = YES;
        UILabel *numlab = [self.view viewWithTag:number+3000];
        numlab.hidden = YES;
        numlab.text = [NSString stringWithFormat:@"%@",model.gwsz];
    }
    [self.foodArr replaceObjectAtIndex:number withObject:model];
    if (self.selectArr.count > 0) {
        [self.selectArr removeObjectAtIndex:model.gwsz.integerValue];
    }
    [self setFoodViewTotal];
}
- (void)setFoodViewTotal
{
    self.foodView.orderNum.text = [NSString stringWithFormat:@"%ld",self.selectArr.count];
    self.foodView.shoppingImage.image = [UIImage imageNamed:@"waimai_gouwuchelan"];
    self.foodView.orderMoneyBtn.backgroundColor = BGcolor(65, 186, 206);
    NSString *text = [self totalMoney:self.selectArr];
    if (text.floatValue < self.model.qisongjia.floatValue) {
        if (text.floatValue == 0) {
            self.foodView.orderNum.hidden = YES;
            self.foodView.shoppingImage.image = [UIImage imageNamed:@"waimai_gouwuchehui"];
            [self.foodView.orderMoneyBtn setBackgroundColor:[UIColor lightGrayColor]];
            [self.foodView.orderMoneyBtn setTitle:[NSString stringWithFormat:@"%@元起送价",self.model.qisongjia] forState:UIControlStateNormal];
        }else{
            [self.foodView.orderMoneyBtn setTitle:[NSString stringWithFormat:@"还差0.2%f元",self.model.qisongjia.floatValue-text.floatValue] forState:UIControlStateNormal];
        }
    }else{
        [self.foodView.orderMoneyBtn setTitle:@"确认下单" forState:UIControlStateNormal];
    }

}

#pragma mark - 添加选择菜品footView
- (void)addFoodView
{
    self.foodView = [AddFoodView CreateAddFoodView];
    [self.foodView setUserInteractionEnabled:YES];
    self.foodView.origin = CGPointMake(0, HEIGHT-113);
    self.foodView.width = WIDTH;
    self.foodView.height = 450;
    [self.foodView.orderMoneyBtn addTarget:self action:@selector(orderMoneyBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.foodView setModel:self.model];
    [self.view addSubview:self.foodView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClickAction:)];
    [self.foodView addGestureRecognizer:tap];
    
}
- (void)tapClickAction:(UITapGestureRecognizer *)tap
{
    if (self.foodView.orderNum.hidden) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.labelText = @"您还没有点餐哦~~!";
        [hud show:YES];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            hud.hidden = YES;
        });
    }else{
        ShoppingCartViewController *shopVC = [[ShoppingCartViewController alloc]init];
        shopVC.selectArr = self.selectArr;
        shopVC.shopModel = self.model;
        [self.navigationController pushViewController:shopVC animated:YES];
    }
}
- (void)deleteSelectShiPinDelegate:(BOOL)result
{
    self.result = result;
}
#pragma mark - tableView 点击方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    if (tableView == self.leftTableView) {
//        [self.foodArr removeAllObjects];
//        if (indexPath.row == 0) {
//            self.titleText= @"食品";
//            for (int i = 0; i < self.allFoods.count; i++) {
//                MerchantInformationModel *model = self.allFoods[i];
//                if([model.waimaishipinLeixing isEqualToString:@"0"]){
//                    [self.foodArr addObject:self.allFoods[i]];
//                }
//            }
//        }
//        if (indexPath.row == 1) {
//            self.titleText = @"饮品";
//            for (int i = 0; i < self.allFoods.count; i++) {
//                MerchantInformationModel *model = self.allFoods[i];
//                if ([model.waimaishipinLeixing isEqualToString:@"1"]){
//                [self.foodArr addObject:self.allFoods[i]];
//                }
//            }
//        }
//        if (indexPath.row == 2) {
//            self.titleText = @"其他";
//            for (int i = 0; i < self.allFoods.count; i++) {
//                MerchantInformationModel *model = self.allFoods[i];
//                if ([model.waimaishipinLeixing isEqualToString:@"2"]) {
//                    [self.foodArr addObject:self.allFoods[i]];
//                }
//            }
//        }
//        [self.rightTableView reloadData];
//    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
    headView.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(headView.centerX-50, headView.centerY-10, 100, 20)];
    titleLab.text = @"商品";
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.font = [UIFont systemFontOfSize:16];
    titleLab.textColor = BGcolor(198, 198, 198);
    [headView addSubview:titleLab];
    if (self.titleText != nil) {
        titleLab.text = self.titleText;
    }
    UIView *leftLine = [[UIView alloc]initWithFrame:CGRectMake(titleLab.x-40, headView.center.y, 40, 1)];
    leftLine.backgroundColor = BGcolor(65, 187, 206);
    [headView addSubview:leftLine];
    
    UIView *rightLine = [[UIView alloc]initWithFrame:CGRectMake(titleLab.x+titleLab.width, headView.centerY, 40, 1)];
    rightLine.backgroundColor = BGcolor(65, 187, 206);
    [headView addSubview:rightLine];
    return headView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 82;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (void)orderMoneyBtnClick:(UIButton *)btn
{
    if ([self.foodView.orderMoneyBtn.titleLabel.text isEqualToString:@"确认下单"]) {
        SubmitOrderViewController *subVC = [[SubmitOrderViewController alloc]init];
        subVC.selectArr = self.selectArr;
        subVC.shopModel = self.model;
        [self.navigationController pushViewController:subVC animated:YES];
    }else{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.labelText = @"没有达到起送价~!";
        [hud show:YES];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            hud.hidden = YES;
        });
    }
}

// 计算价钱
- (NSString *)totalMoney:(NSMutableArray *)arr
{
    if (arr.count > 0) {
        
        CGFloat totalNum = 0;
        NSString *total = [NSString string];
        for (int i = 0; i < arr.count; i++) {
            MerchantInformationModel *model = arr[i];
            totalNum += model.waimaishipinJiage.floatValue;
            total = [NSString stringWithFormat:@"0.2%f",totalNum];
        }
        return total;
    }else
    {
        return @"0";
    }
}


// 店内餐品 下划线 滑动的效果
//- (void)cateBtnClick
//{
//    [UIView animateWithDuration:0.2 animations:^{
//        self.line.centerX = self.cateBtn.centerX;
//    }];
//}
//// 评价点击方法
//- (void)evaluateBtnClick
//{
//    [UIView animateWithDuration:0.2 animations:^{
//        self.line.centerX = self.evaluateBtn.centerX;
//    }];
//}
//// 商家介绍点击方法
//- (void)introduceBtnClick
//{
//    [UIView animateWithDuration:0.2 animations:^{
//        self.line.centerX = self.introduceBtn.centerX;
//    }];
//}

@end
