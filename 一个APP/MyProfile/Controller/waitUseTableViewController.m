//
//  waitUseTableViewController.m
//  一个APP
//
//  Created by 远古科技 on 16/8/23.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "waitUseTableViewController.h"
#import "waitUseTableViewCell.h"
#import "waitUseModel.h"
@interface waitUseTableViewController ()

@property (nonatomic, retain) NSMutableArray *waitUseArr;

@end

@implementation waitUseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"待使用";
    self.waitUseArr = [[NSMutableArray alloc] init];
    [self loadNewData];
}


// 下拉刷新的方法
- (void)loadNewData{
    [self.waitUseArr removeAllObjects];
    NSString *url = @"meishi/queryuserweishiyongtuangoujuan.action?";
    NSString *sandPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    sandPath = [sandPath stringByAppendingPathComponent:@"manager/userDic.plish"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:sandPath];
//          dic = @{@"userId":dic[@"userId"]};
    dic = @{@"userId":@"1"};
    
    [AFNetWorting postNetWortingWithUrlString:url params:dic controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
        NSArray *arr = responseObject;
        for (NSDictionary *dic in arr) {
            waitUseModel *model = [[waitUseModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            [self.waitUseArr addObject:model];
        }
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 5;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.waitUseArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuse = @"reuse";
    waitUseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [waitUseTableViewCell createCell];
        [cell waitUseModel:self.waitUseArr[indexPath.row]];
    }
    return cell;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 285;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 10;
//}

@end
