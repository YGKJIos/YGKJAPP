//
//  PayMentTableViewController.m
//  一个APP
//
//  Created by 远古科技 on 16/8/11.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "PayMentTableViewController.h"
#import "PaymentTableViewCell.h"
#import "AlipayTableViewCell.h"
#import "weixinObject.h"            // 微信支付
// 支付宝
#import <AlipaySDK/AlipaySDK.h>
#import "Order.h"
#import "DataSigner.h"
#import "ALiPaysuccessViewController.h" // 支付成功返回界面
@interface PayMentTableViewController ()<SelectBtnDelegate, ByValueDelegate>
@property (nonatomic, assign)BOOL select;
@property (nonatomic, strong) NSMutableArray *selectArr;
@end


@implementation PayMentTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"支付订单";
    self.tableView.backgroundColor = BGcolor(247, 247, 247);
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 117)];
    footerView.backgroundColor = BGcolor(247, 247, 247);
    self.tableView.tableFooterView = footerView;
    UIButton *sureBtn = [[UIButton alloc] init];
    sureBtn.frame = CGRectMake(60, 40, WIDTH - 120, 50);
    [sureBtn setBackgroundImage:[UIImage imageNamed:@"zf_qrzf"] forState:UIControlStateNormal];
    [sureBtn setTitle:@"确认支付" forState:UIControlStateNormal];
    [sureBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:sureBtn];
   
}

- (void)click:(UIButton *)btn
{
    // 利用_select 判断 (1:支付宝 0:微信)
    if (_select == 0) {
        // 微信支付
        // 随机产生订单号用于测试，正式使用请换成你从自己服务器获取的订单号
        NSString *orderno = [NSString stringWithFormat:@"%ld",time(0)];
        [weixinObject weixinPay:[self.str1 integerValue] order:orderno block:^(BOOL payRet) {
            
        }];
    }else if (_select == 1){
        // 支付宝支付
    }
     NSLog(@"%d", _select);
}


- (NSString *)generateTradeNO
{
    static int kNumber = 15;
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand((unsigned)time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else {
        return 2;
    }

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuse = @"reuse";
    PaymentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (indexPath.section == 0) {
        
        cell = [PaymentTableViewCell createCell];
        cell.delegate = self;
        cell.nameLab.text = self.str;
        cell.priceLab.text = [NSString stringWithFormat:@"¥%@", self.str1];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (indexPath.section == 1) {
        AlipayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
        if (indexPath.row == 1) {
            AlipayTableViewCell *weixinCell = [AlipayTableViewCell createCell];
            weixinCell.selectBtn.tag = 1000;
            [weixinCell.selectBtn addTarget:self action:@selector(actionWeixin:) forControlEvents:UIControlEventTouchUpInside];
            weixinCell.weixinImage.image = [UIImage imageNamed:@"zf_wx"];
            weixinCell.payNameLab.text = @"微信支付";
            weixinCell.delegate = self;
            cell = weixinCell;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        if (indexPath.row == 0) {
            AlipayTableViewCell *payCell = [AlipayTableViewCell createCell];
            payCell.selectBtn.tag = 1001;
            [payCell.selectBtn addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
            payCell.delegate = self;
            cell = payCell;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cell;
        }
    return cell;
}


// selectBtn点击方法
- (void)action:(UIButton *)btn
{
//    UIButton *weixinBtn = (UIButton *)[self.view viewWithTag:1000];
//    
//    if (self.select == YES) {
//        [btn setImage:[UIImage imageNamed:@"zhifudingdan_14"] forState:UIControlStateNormal];
//        [weixinBtn setImage:[UIImage imageNamed:@"zhifudingdan_09"] forState:UIControlStateNormal];
//    }
//    if (self.select == NO) {
//        [btn setImage:[UIImage imageNamed:@"zhifudingdan_09"] forState:UIControlStateNormal];
//    }
//    self.select = !self.select;
}

// 微信支付
- (void)actionWeixin:(UIButton *)btn
{
//    UIButton *alipayBtn = (UIButton *)[self.view viewWithTag:1001];
//    
//    if (self.select == YES) {
//        [btn setImage:[UIImage imageNamed:@"zhifudingdan_14"] forState:UIControlStateNormal];
//        [alipayBtn setImage:[UIImage imageNamed:@"zhifudingdan_09"] forState:UIControlStateNormal];
//    }
//    if (self.select == NO) {
//        [btn setImage:[UIImage imageNamed:@"zhifudingdan_09"] forState:UIControlStateNormal];
//    }
//    self.select = !self.select;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        UIButton *alipayBtn = (UIButton *)[self.view viewWithTag:1001];
        [alipayBtn setImage:[UIImage imageNamed:@"zhifudingdan_14"] forState:UIControlStateNormal];
        UIButton *weixinBtn = (UIButton *)[self.view viewWithTag:1000];
        [weixinBtn setImage:[UIImage imageNamed:@"zhifudingdan_09"] forState:UIControlStateNormal];
        self.select = YES;
    }
    if (indexPath.row == 1) {
        UIButton *weixinBtn = (UIButton *)[self.view viewWithTag:1000];
        [weixinBtn setImage:[UIImage imageNamed:@"zhifudingdan_14"] forState:UIControlStateNormal];
        UIButton *alipayBtn = (UIButton *)[self.view viewWithTag:1001];
        [alipayBtn setImage:[UIImage imageNamed:@"zhifudingdan_09"] forState:UIControlStateNormal];
        self.select = NO;
    }
}

@end
