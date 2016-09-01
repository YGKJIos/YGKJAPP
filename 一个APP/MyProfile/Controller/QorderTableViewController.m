//
//  QorderTableViewController.m
//  一个APP
//
//  Created by 远古科技 on 16/8/25.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "QorderTableViewController.h"
#import "QorderTableViewCell.h"
#import "QorderModel.h"
@interface QorderTableViewController ()<QorderDelegate>
@property (nonatomic, retain) NSMutableArray *orderArr;
@end

@implementation QorderTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"查看订单";
    self.orderArr = [[NSMutableArray alloc] init];
    [self loadNewData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 下拉刷新的方法
- (void)loadNewData{
    [self.orderArr removeAllObjects];

    NSString *url = @"waimai/userchakandingdan.action?";
    NSString *sandPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    sandPath = [sandPath stringByAppendingPathComponent:@"manager/userDic.plish"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:sandPath];
    dic = @{@"userId":dic[@"userId"]};
    
    [AFNetWorting postNetWortingWithUrlString:url params:dic controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@", responseObject);
        NSArray *arr = responseObject;
        for (NSDictionary *dic in arr) {
            QorderModel *model = [[QorderModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            [self.orderArr addObject:model];
        }
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.orderArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.orderArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuse = @"reuse";
    QorderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [QorderTableViewCell createCell];
        cell.delegate = self;
        [cell QorderModel:self.orderArr[indexPath.row]];
    }
    cell.sureBtn.tag = 1000+indexPath.row;
    [cell.sureBtn addTarget:self action:@selector(sureBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
- (void)sureBtnAction:(UIButton *)btn
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否确定退单" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
    [self.tableView reloadData];
    
    QorderModel *model = self.orderArr[btn.tag - 1000];
    NSLog(@"%ld" , btn.tag-1000);
    NSDictionary *dic = @{@"waimaidingdanId":model.waimaidingdanId};
    NSString *url = @"user/xiugaimima.action?";
    [AFNetWorting postNetWortingWithUrlString:url params:dic controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject[@"ok"] isEqualToString:@"0"]) {
            [self HUDLabelText:@"退款失败"];
        }
        if ([responseObject[@"ok"] isEqualToString:@"1"]) {
            [self HUDLabelText:@"退款成功详情请联系客服"];
        }
        if ([responseObject[@"ok"] isEqualToString:@"2"]) {
            [self HUDLabelText:@"商家以接单"];
        }
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}
- (void)HUDLabelText:(NSString *)text
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = text;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        hud.hidden = YES;
    });
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 158;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
