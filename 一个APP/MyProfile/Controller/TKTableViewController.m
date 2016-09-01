//
//  TKTableViewController.m
//  一个APP
//
//  Created by 远古科技 on 16/8/26.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "TKTableViewController.h"
#import "TKTableViewCell.h"
#import "TKModel.h"

@interface TKTableViewController ()

@property (nonatomic, retain) NSMutableArray *TKArr;

@end

@implementation TKTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"查看退单";
    self.TKArr = [[NSMutableArray alloc] init];
    [self loadNewData];   
}

// 下拉刷新的方法
- (void)loadNewData{
    [self.TKArr removeAllObjects];
    NSString *url = @"waimai/userchakandingdan.action?";
    NSString *sandPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    sandPath = [sandPath stringByAppendingPathComponent:@"manager/userDic.plish"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:sandPath];
    dic = @{@"userId":dic[@"userId"]};
    
    [AFNetWorting postNetWortingWithUrlString:url params:dic controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
        NSArray *arr = responseObject;
        for (NSDictionary *dic in arr) {
            TKModel *model = [[TKModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            [self.TKArr addObject:model];
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
    return self.TKArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.TKArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static  NSString *reuse = @"reuse";
    TKTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [TKTableViewCell createCell];
        [cell TKMdel:self.TKArr[indexPath.row]];
    }
   return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 128;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}




@end
