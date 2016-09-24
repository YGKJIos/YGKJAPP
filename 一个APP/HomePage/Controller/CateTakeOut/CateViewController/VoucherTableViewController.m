//
//  VoucherTableViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/23.
//  Copyright © 2016年 llb. All rights reserved.
//

// 代金券页面
#import "VoucherTableViewController.h"
#import "GroupPurchaseView.h"  // headerView
#import "ConsumePromptTableViewCell.h" //消费提示
#import "ShopIntroduceTableViewCell.h" // 商家介绍
#import "FoodIntroduceTableViewCell.h" // 套餐介绍
#import "StarEvaluateTotalTableViewCell.h" // 评价cell
#import "TitleCellTableViewCell.h"
#import <AlipaySDK/AlipaySDK.h>
#import "Order.h"
#import "DataSigner.h"
#import "ALiPaysuccessViewController.h" // 支付成功返回界面
#import "PayMentTableViewController.h"
@interface VoucherTableViewController ()
@property (nonatomic, strong)NSMutableArray *foodArr;

@end

@implementation VoucherTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = [self.shopArr[0] shangjiaName];
    
    self.foodArr = [NSMutableArray arrayWithObjects:@"鱼丸",@"粗面",@"油面",@"鱼丸",@"鱼丸", nil];
    
    self.tableView.backgroundColor = BGcolor(225 , 225, 225);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
     self.navigationItem.rightBarButtonItem = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
        return 0;
    }
    if (section == 2) {
        return 2;
    }
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.section == 1) {
//        StarEvaluateTotalTableViewCell *cell = [StarEvaluateTotalTableViewCell greateCell];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        cell.evaluateLab.text = [self.shopArr[0] shangjiaPingfen];
//        return cell;
//    }
    if (indexPath.section == 1) {
        ShopIntroduceTableViewCell *shopCell = [[NSBundle mainBundle]loadNibNamed:@"ShopIntroduceTableViewCell" owner:nil options:nil].lastObject;
        shopCell.selectionStyle = UITableViewCellSelectionStyleNone;
        [shopCell setShopInformationModel:self.shopArr[0]];
        return shopCell;
    }
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            TitleCellTableViewCell *titleCell = [TitleCellTableViewCell createSectionTitleCellNib];
            [titleCell setTitleImage:@"djq_taocanjieshao2" titleLab:@"套餐介绍"];
            titleCell.selectionStyle = UITableViewCellSelectionStyleNone;
            return titleCell;
        }else{
            
            UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuse"];
            cell.textLabel.numberOfLines = 0;
            cell.textLabel.textColor = BGcolor(175, 175, 175);
            cell.textLabel.font = [UIFont systemFontOfSize:13];
            cell.textLabel.text = [NSString stringWithFormat:@"  %@", self.model.tuangouShuoming];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
            
        }
//        else if(self.foodArr.count+1 == indexPath.row){
//            UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
//            cell.selectionStyle = UITableViewCellSelectionStyleNone;
//            
//            UILabel *textLab = [[UILabel alloc]initWithFrame:CGRectMake(30, 15, 120, 20)];
//            textLab.textColor = BGcolor(65, 186, 206);
//            textLab.text = @"查看图片详情";
//            [cell.contentView addSubview:textLab];
//            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH-36, 19, 6, 12)];
//            imageView.image = [UIImage imageNamed:@"djq_jiantoulan"];
//            [cell.contentView addSubview:imageView];
//            return cell;
//        }
//        else
//        {
//            FoodIntroduceTableViewCell *foodCell = [[NSBundle mainBundle]loadNibNamed:@"FoodIntroduceTableViewCell" owner:nil options:nil].lastObject;
//            foodCell.selectionStyle = UITableViewCellSelectionStyleNone;
//            foodCell.typeName.text = self.foodArr[indexPath.row-1];
//            return foodCell;
//        }
    }
    if ([self.num isEqualToString:@"1004"]) {
        static NSString *reuse = @"reuse";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuse];
        }
        return cell;
    }else{
    ConsumePromptTableViewCell *consumeCell = [[NSBundle mainBundle]loadNibNamed:@"ConsumePromptTableViewCell" owner:nil options:nil].lastObject;
    consumeCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return consumeCell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1){
        return 132;
    }else if (indexPath.section == 2)
    {
        if (indexPath.row == 0) {
            return 44;
        }
        if (indexPath.row == self.foodArr.count +1) {
            return 50;
        }
        return 60;
    }else
    {
        if ([self.num isEqualToString:@"1004"]) {
            return 0;
        }else
        {
            return 536;
        }
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        GroupPurchaseView *groupView = [[NSBundle mainBundle]loadNibNamed:@"GroupPurchaseView" owner:nil options:nil].lastObject;
        groupView.frame = CGRectMake(0, 0, WIDTH, 255);
        [groupView setModel:self.model];
        [groupView.panicBuyBtn addTarget:self action:@selector(choosePaymethod:) forControlEvents:UIControlEventTouchUpInside];
        groupView.backgroundColor = [UIColor whiteColor];
        return groupView;
    }
    return nil;
}
// 统一跳转到选择支付方式界面
- (void)choosePaymethod:(UIButton *)btn;
{
    PayMentTableViewController *pay = [[PayMentTableViewController alloc]init];

    pay.str = self.model.tuangouName;
    pay.str1 = self.model.tuangouTejia;
    pay.shuoming = self.model.tuangouShuoming;
    [self.navigationController pushViewController:pay animated:YES];
}
- (void)payOrderClick
{
    NSString *partner = @"2088421498633042";
    NSString *seller = @"yuangukeji2016@163.com";
    
    NSString *privateKey = @"MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBANtBtnXen67rs2qolD3ibUkuL5pJaxPhEl96I0ckPq0U0BoPHud/1sq8aDwwxTxBLN1cr9OsgRX8k0rhbgPuQj6Ma1qsSYL7hspXxFyiTMKe/QCZVK3iEE8v7prR+GS+IO3j/PxrXVg+9OzlzflwLUwhS7KXw4fMrr7/LKg19ZqfAgMBAAECgYEAixqu0ytR7h1V8CZSHs0H/vTReLZ5u9wA1xhbR2hkZ1UcDlxnhAIkWO2dyAo9KFRFTY/fcZExOKzNGiXZsZ644V9PZYiU4iHSEI2zOZegnxQvYIFKhV+itfJl2z8AtHWlLfzxPCwULhYpAC9FW9bm0DtWmXkTOqVeGd/KNI+5fkkCQQD1fnKlSx8I6MGhVpMGzGDzFiS0Nv4ns5uB9W/Yxf3sHXFKhLhlvuyLyGJrbtnAwfNya0spimIwA50pSXpekEX9AkEA5KPRcAXK97uHmkyRp2hgm4cTvyuldQvubbbiYK1XQnRCft09Mrdi2aqut1cuPRlgyOQIGSkcGhsNQnb+OVP3ywJBAOopotFnxkKJQajTG4rwh8lW5cvAaM0V1M8xfW4X7Qy7SMT7s6fZZWgvyzEOm0XxunT5Qshs5xtFVzN6ku6AT0ECQCSOBHgylObStrV2tHrdd0SmbgPMiKGUDMTBzqPCUwcu60q5OIWZSFagsVpit+PQ4OZ9fsX3CqUp2g7cU3z67c0CQQDNaUEAOB42Ybe6hBKcQChIoxkXxWIUwrQ19ObW/MMOTrvSyE7UsRa9ezdx2xQGUcwOq8AvGOnLgiziuOblJ51I";
    
    Order *order = [[Order alloc] init];
    order.partner = partner;
    order.sellerID = seller;
    order.outTradeNO = [self generateTradeNO]; //订单ID（由商家自行制定）
    order.subject = self.model.tuangouName; //商品标题
    order.body = self.model.tuangouShuoming; //商品描述
    order.totalFee = [NSString stringWithFormat:@"%@",self.model.tuangouTejia]; //商品价格
//    order.totalFee = @"0.01";
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
            if ([resultDic[@"resultStatus"] isEqualToString:@"9000"]) {
                NSString *sandBoxPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
                NSString *path = [sandBoxPath stringByAppendingPathComponent:@"manager/userDic.plish"];
                NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
                NSString *url = @"user/addusertuangoujuan.action?";
                NSDictionary *textDic = @{@"userId":dic[@"userId"],
                                          @"tuangoujuanId":self.model.tuangoujuanId,
                                          @"alipayNo":order.outTradeNO};
                [AFNetWorting postNetWortingWithUrlString:url params:textDic controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
                    if ([responseObject[@"ok"] isEqualToString:@"1"]) {
                        ALiPaysuccessViewController *success = [[ALiPaysuccessViewController alloc] init];
                        [self.navigationController pushViewController:success animated:YES];
                    }else{
                        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"生成订单失败请联系客服" preferredStyle:UIAlertControllerStyleAlert];
                        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
                        [alert addAction:cancel];
                        [self presentViewController:alert animated:YES completion:nil];
                    }
                } failure:^(NSURLSessionDataTask *task, NSError *error) {
                    
                }];
            }
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

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 255;
    }
    return 5;
}
@end
