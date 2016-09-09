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
    self.tableView.tableFooterView = [[UIView alloc]init];
}

// 下拉刷新的方法
- (void)loadNewData{
    NSString *url = @"meishi/queryuserweishiyongtuangoujuan.action?";
    NSString *sandPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    sandPath = [sandPath stringByAppendingPathComponent:@"manager/userDic.plish"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:sandPath];
    dic = @{@"userId":dic[@"userId"]};
    
    [AFNetWorting postNetWortingWithUrlString:url params:dic controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
        [self.waitUseArr removeAllObjects];
        NSArray *arr = responseObject;
        for (NSDictionary *dic in arr) {
            waitUseModel *model = [[waitUseModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            [self.waitUseArr addObject:model];
        }
        if (self.waitUseArr.count == 0) {
            ZGPplaceholderImageView *placeholderImage = [[ZGPplaceholderImageView alloc] initWithFrame:self.view.frame];
            [self.view addSubview:placeholderImage];
        }
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.waitUseArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuse = @"reuse";
    waitUseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [waitUseTableViewCell createCell];
        [cell waitUseModel:self.waitUseArr[indexPath.section]];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 185;
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
