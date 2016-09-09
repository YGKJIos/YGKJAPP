//
//  groupShopTableViewController.m
//  一个APP
//
//  Created by 远古科技 on 16/8/24.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "groupShopTableViewController.h"
#import "groupShopTableViewCell.h"
#import "groupShopModel.h"
@interface groupShopTableViewController ()
@property (nonatomic, retain) NSMutableArray *ShopArr;
@end

@implementation groupShopTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"查看团购卷";
    self.ShopArr = [[NSMutableArray alloc] init];
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
        [self.ShopArr removeAllObjects];
        NSArray *arr = responseObject;
        for (NSDictionary *dic in arr) {
            groupShopModel *model = [[groupShopModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            [self.ShopArr addObject:model];
        }
        if (self.ShopArr.count == 0) {
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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuse = @"reuse";
    groupShopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [groupShopTableViewCell createCell];
        [cell groupShopModel:self.ShopArr[indexPath.section]];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 180;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.ShopArr.count;
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
