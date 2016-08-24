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
#import "MerchantInformationModel.h"
#import "DeliverAdressTableViewCell.h"
// 支付宝
#import <AlipaySDK/AlipaySDK.h>
#import "Order.h"
#import "DataSigner.h"

@interface SubmitOrderViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,addressInformation>

@property (nonatomic, strong)NSArray *arr;
@property (nonatomic, strong)UIControl *control;
@property (nonatomic, strong)UIView *numPeopleView;
@property (nonatomic, strong)MerchantInformationModel *model;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)UITextField *manNumText; // 填写用餐人数
@end

@implementation SubmitOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"提交订单";
    self.arr = @[@"鱼丸粗面",@"墨鱼丸粗面",@"鱼丸油面"];
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-64) style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
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
        [cell setOrderPersonCellStyle:InformationOrderPersonCell model:self.model];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if (indexPath.section == 1) {
        OrderPersonTableViewCell *cell = [[OrderPersonTableViewCell alloc]init];
        [cell setOrderPersonCellStyle:PaymentOrderPersonCell model:nil];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            OrderPersonTableViewCell *cell = [[OrderPersonTableViewCell alloc]init];
            [cell setOrderPersonCellStyle:MerchantSnackCell model:nil];
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
            [cell setOrderPersonCellStyle:FavorableCell model:nil];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        if (indexPath.row == 3) {
            OrderPersonTableViewCell *cell = [[OrderPersonTableViewCell alloc]init];
            [cell setOrderPersonCellStyle:TotalCell model:nil];
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
            [cell setOrderPersonCellStyle:SurePayOrderCell model:nil];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell.payBtn addTarget:self action:@selector(surePayOrder) forControlEvents:UIControlEventTouchUpInside];
            return cell;
        }
    }
    if (indexPath.section == 2 && indexPath.row == 1) {
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"beizhuID"];
        cell.textLabel.text = @"用餐人数";
        cell.detailTextLabel.text = @"方便商家为您配送餐具";
        if (self.manNumText.text != nil) {
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%@位用餐人数",self.manNumText.text];
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
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
        editAddressVC.delegate = self;
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
    [self.tableView reloadData];
    [self.control removeFromSuperview];
    [self.numPeopleView removeFromSuperview];
    
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    self.numPeopleView.frame = CGRectMake(0, HEIGHT-200-54-250, WIDTH, 200);
    return YES;
}

// 编辑地址回调代理
- (void)selectAddressInformation:(MerchantInformationModel *)model
{
    self.model = model;
    [self.tableView reloadData];
}

#pragma mark - 支付宝支付
- (void)surePayOrder
{
    NSLog(@"lijixiadan");
    /*
     *点击获取prodcut实例并初始化订单信息
     */
//    MerchantInformationModel *model = [self.TGArr objectAtIndex:sender.tag-1001];
    
    NSString *partner = @"2088421498633042";
    NSString *seller = @"yuangukeji2016@163.com";
    NSString *privateKey = @"MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBANtBtnXen67rs2qolD3ibUkuL5pJaxPhEl96I0ckPq0U0BoPHud/1sq8aDwwxTxBLN1cr9OsgRX8k0rhbgPuQj6Ma1qsSYL7hspXxFyiTMKe/QCZVK3iEE8v7prR+GS+IO3j/PxrXVg+9OzlzflwLUwhS7KXw4fMrr7/LKg19ZqfAgMBAAECgYEAixqu0ytR7h1V8CZSHs0H/vTReLZ5u9wA1xhbR2hkZ1UcDlxnhAIkWO2dyAo9KFRFTY/fcZExOKzNGiXZsZ644V9PZYiU4iHSEI2zOZegnxQvYIFKhV+itfJl2z8AtHWlLfzxPCwULhYpAC9FW9bm0DtWmXkTOqVeGd/KNI+5fkkCQQD1fnKlSx8I6MGhVpMGzGDzFiS0Nv4ns5uB9W/Yxf3sHXFKhLhlvuyLyGJrbtnAwfNya0spimIwA50pSXpekEX9AkEA5KPRcAXK97uHmkyRp2hgm4cTvyuldQvubbbiYK1XQnRCft09Mrdi2aqut1cuPRlgyOQIGSkcGhsNQnb+OVP3ywJBAOopotFnxkKJQajTG4rwh8lW5cvAaM0V1M8xfW4X7Qy7SMT7s6fZZWgvyzEOm0XxunT5Qshs5xtFVzN6ku6AT0ECQCSOBHgylObStrV2tHrdd0SmbgPMiKGUDMTBzqPCUwcu60q5OIWZSFagsVpit+PQ4OZ9fsX3CqUp2g7cU3z67c0CQQDNaUEAOB42Ybe6hBKcQChIoxkXxWIUwrQ19ObW/MMOTrvSyE7UsRa9ezdx2xQGUcwOq8AvGOnLgiziuOblJ51I";
    
    Order *order = [[Order alloc] init];
    order.partner = partner;
    order.sellerID = seller;
    order.outTradeNO = [self generateTradeNO]; //订单ID（由商家自行制定）
//    order.subject = model.shangjiaName; //商品标题
//    order.body = model.tuangouShuoming; //商品描述
//    order.totalFee = [NSString stringWithFormat:@"%@",model.tuangouTejia]; //商品价格
//    order.subject = model.shangjiaName; //商品标题
//    order.body = model.tuangouShuoming; //商品描述
//    order.totalFee = [NSString stringWithFormat:@"%@",model.tuangouTejia]; //商品价格
    order.notifyURL =  @"http://139.129.209.189:8080/shangcheng/notify_url.jsp"; //回调URL
    
    order.service = @"mobile.securitypay.pay";
    order.paymentType = @"1";
    order.inputCharset = @"utf-8";
    order.itBPay = @"30m";
    order.showURL = @"m.alipay.com";
    
    //应用注册scheme,在AlixPayDemo-Info.plist定义URL types
    NSString *appScheme = @"alisdkdemo";
    
    //将商品信息拼接成字符串
    NSString *orderSpec = [order description];
    NSLog(@"orderSpec = %@",orderSpec);
    
    //获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循RSA签名规范,并将签名字符串base64编码和UrlEncode
    id<DataSigner> signer = CreateRSADataSigner(privateKey);
    NSString *signedString = [signer signString:orderSpec];
    
    //将签名成功字符串格式化为订单字符串,请严格按照该格式
    NSString *orderString = nil;
    if (signedString != nil) {
        orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",orderSpec, signedString, @"RSA"];
        
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            //【callback处理支付结果】
            NSLog(@"reslut = %@",resultDic);
        }];
    }
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

@end
