//
//  CateDetailsTableViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/25.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "CateDetailsTableViewController.h"
#import "carWashTableViewController.h"
#import "VoucherTableViewController.h"
#import "DetailTableHeaderView.h"  // 头部 商家信息
#import "groupTableViewCell.h"
#import "CarEvaluateTableViewCell.h"  // 评论 cell
#import "ShowAllAndErorrCell.h"   // 查看全部信息 或者 错误反馈
#import "voucherTableViewCell.h"
#import "TitleCellTableViewCell.h"
#import "ErrorInformationView.h" //报错页面
#import "SeeAllEvaluateTableViewController.h" // 查看全部评论
#import "MerchantInformationModel.h"

@interface CateDetailsTableViewController ()
@property (nonatomic, strong)NSMutableArray *dataArr;// 商家信息
@property (nonatomic, strong)NSMutableArray *TGArr; // 团购券数组
@property (nonatomic, strong)DetailTableHeaderView *header;

@end

@implementation CateDetailsTableViewController

-(NSMutableArray *)dataArr
{
    if (!_dataArr) {
        self.dataArr = [[NSMutableArray alloc]init];
    }
    return _dataArr;
}
-(NSMutableArray *)TGArr
{
    if (!_TGArr) {
        self.TGArr = [[NSMutableArray alloc]init];
    }
    return _TGArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    self.navigationItem.title = @"商家详情";
    self.tableView.backgroundColor = BGcolor(205, 205, 205);
    self.navigationItem.rightBarButtonItem = nil;
    [self.tableView setShowsVerticalScrollIndicator:NO];
}

- (void)loadData
{
//    NSString *url = [NSString stringWithFormat:@"meishi/shangjiaxiangqing.action?shangjiaId=83"];
    NSString *url = [NSString stringWithFormat:@"meishi/shangjiaxiangqing.action?shangjiaId=%@",self.shopID];
    [AFNetWorting getNetWortingWithUrlString:url params:nil controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSArray *shopArr = [responseObject objectForKey:@"shangjiaXiangQing"];
        NSArray *TGArr = [responseObject objectForKey:@"shangjiaTuanGouJuan"];
        if (shopArr.count != 0)
        {
            MerchantInformationModel *model = [[MerchantInformationModel alloc]init];
            
            [model setValuesForKeysWithDictionary:shopArr[0]];
            [self.dataArr addObject:model];
        }
        if (TGArr.count != 0) {
            
            for (NSDictionary *dic in TGArr) {
                
                MerchantInformationModel *model = [[MerchantInformationModel alloc]init];
                
                [model setValuesForKeysWithDictionary:dic];
                [self.TGArr addObject:model];
            }
        }
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
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
//    if (section == 0) {
        return self.TGArr.count+1;
//    }
//    if (section == 1) {
//        return 3;
//    }
//    
//    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        self.header = [DetailTableHeaderView greateHeaderView];
        if (self.dataArr.count != 0) {
            [self.header setHeaderModel:self.dataArr[0]];
        }
        self.tableView.tableHeaderView = self.header;
    }
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            TitleCellTableViewCell *cell = [TitleCellTableViewCell createSectionTitleCellNib];
            NSString *str = [NSString stringWithFormat:@"团购券  (%ld)",self.TGArr.count];
            [cell setTitleImage:@"learn_tuangouquan" titleLab:str];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
//        else if (indexPath.row == self.TGArr.count+1)
//        {
//            ShowAllAndErorrCell *erorrCell = [[ShowAllAndErorrCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
//            [erorrCell setShowAllAndErorrCellStyle:showAllCellStyle];
//
//            return erorrCell;
//        }
        else
        {
            static NSString *reuse = @"reuse";
            voucherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
            cell = [voucherTableViewCell greateCell];
            cell.payBtn.tag = 1000+indexPath.row;
            [cell.payBtn addTarget:self action:@selector(payOrderClick:) forControlEvents:UIControlEventTouchUpInside];
            if (self.TGArr.count != 0) {
                
                MerchantInformationModel *model = self.TGArr[indexPath.row-1];
                [cell setmodel:model];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
    }
    // 评论 cell
//    if (indexPath.section == 1) {
//        if (indexPath.row == 0) {
//            TitleCellTableViewCell *titleCell = [TitleCellTableViewCell createSectionTitleCellNib];
//            [titleCell setTitleImage:@"ms_pingjia" titleLab:@"评价 (1024)"];
//            titleCell.selectionStyle = UITableViewCellSelectionStyleNone;
//            return titleCell;
//        }
//        else if (indexPath.row == 1)
//        {
//            static NSString *reuse = @"reuse";
//            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
//            if (!cell) {
//                cell = [CarEvaluateTableViewCell greateEvaluateCell];
//            }
//            return cell;
//        }else
//        {
//            ShowAllAndErorrCell *cell = [[ShowAllAndErorrCell alloc]init];
//            [cell setShowAllAndErorrCellStyle:showAllCellStyle];
//            return cell;
//        }
//        
//    }
    // 错误信息反馈
//    ShowAllAndErorrCell *erorrCell = [[ShowAllAndErorrCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
//    [erorrCell setShowAllAndErorrCellStyle:erorrCellStyle];
//    return erorrCell;
    return nil;
}

- (void)payOrderClick:(UIButton *)btn
{
    /*
     *点击获取prodcut实例并初始化订单信息
     */
    Product *product = [self.TGArr objectAtIndex:btn.tag-1000];
    
    NSString *partner = @"2016072001642380";
    NSString *seller = @"yuangukeji2016@163.com";
    NSString *privateKey = @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDDI6d306Q8fIfCOaTXyiUeJHkrIvYISRcc73s3vF1ZT7XN8RNPwJxo8pWaJMmvyTn9N4HQ632qJBVHf8sxHi/fEsraprwCtzvzQETrNRwVxLO5jVmRGi60j8Ue1efIlzPXV9je9mkjzOmdssymZkh2QhUrCmZYI/FCEa3/cNMW0QIDAQAB";
    
//    Order *order = [[Order alloc] init];
//    order.partner = partner;
//    order.sellerID = seller;
//    order.outTradeNO = @""; //订单ID（由商家自行制定）
//    order.subject = product.subject; //商品标题
//    order.body = product.body; //商品描述
//    order.totalFee = [NSString stringWithFormat:@"%.2f",product.price]; //商品价格
//    order.notifyURL =  @"http://www.xxx.com"; //回调URL
//    
//    order.service = @"mobile.securitypay.pay";
//    order.paymentType = @"1";
//    order.inputCharset = @"utf-8";
//    order.itBPay = @"30m";
//    order.showURL = @"m.alipay.com";
//    
//    //应用注册scheme,在AlixPayDemo-Info.plist定义URL types
//    NSString *appScheme = @"alisdkdemo";
//    
//    //将商品信息拼接成字符串
//    NSString *orderSpec = [order description];
//    NSLog(@"orderSpec = %@",orderSpec);
//    
//    //获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循RSA签名规范,并将签名字符串base64编码和UrlEncode
//    id<DataSigner> signer = CreateRSADataSigner(privateKey);
//    NSString *signedString = [signer signString:orderSpec];
//    
//    //将签名成功字符串格式化为订单字符串,请严格按照该格式
//    NSString *orderString = nil;
//    if (signedString != nil) {
//        orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
//                       orderSpec, signedString, @"RSA"];
//        
//        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
//            //【callback处理支付结果】
//            NSLog(@"reslut = %@",resultDic);
//        }];
//        
//    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 40;
        }
//        if (indexPath.row == self.TGArr.count+1) {
//            return 40;
//        }
        else
        {
            return 100;
        }
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 1) {
            return 154;
        }
        return 44;
    }
    if (indexPath.section == 2) {
        return 50;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{

    return 5;
}

#pragma mark - table点击方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        if (indexPath.row > 0) {
            VoucherTableViewController *TGVC = [[VoucherTableViewController alloc] init];
            TGVC.model = self.TGArr[indexPath.row-1];
            TGVC.shopArr = self.dataArr;
            [self.navigationController pushViewController:TGVC animated:YES];
        }
    }
//    if (indexPath.section == 1) {
//        if (indexPath.row >0 ) {
//            SeeAllEvaluateTableViewController *allEvaluateVC = [[SeeAllEvaluateTableViewController alloc]init];
//            [self.navigationController pushViewController:allEvaluateVC animated:YES];
//            NSLog(@"全部");
//            
//        }
//    }
//    if (indexPath.section == 2)
//    {
//        
//        ErrorInformationView *errorView = [[ErrorInformationView alloc]initWithFrame:self.view.frame];
//        [errorView showErrorView];
//    }
}

@end
