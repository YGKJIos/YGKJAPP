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
@interface QorderTableViewController ()
@property (nonatomic, retain) NSMutableArray *orderArr;
@end

@implementation QorderTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    //          dic = @{@"userId":dic[@"userId"]};
    dic = @{@"userId":@"1"};
    
    [AFNetWorting postNetWortingWithUrlString:url params:dic controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
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
        [cell QorderModel:self.orderArr[indexPath.row]];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 158;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}


@end
