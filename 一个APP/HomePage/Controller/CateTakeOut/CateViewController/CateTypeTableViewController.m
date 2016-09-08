//
//  CateTypeTableViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/19.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "CateTypeTableViewController.h"
#import "CateDetailsTableViewController.h"
#import "MarketCell.h"
#import "MarketModel.h"

@interface CateTypeTableViewController ()
@property (nonatomic, strong)NSMutableArray *MarkeArr;
@property (nonatomic, strong)NSMutableArray *fenleiArr;

@end

@implementation CateTypeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.MarkeArr = [[NSMutableArray alloc]init];
    self.fenleiArr = [NSMutableArray array];
    self.navigationItem.rightBarButtonItem = nil;
    [self loadNewData];
}

// 下拉刷新的方法
- (void)loadNewData{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_header endRefreshing];
        NSString *url = @"meishi/querymeishi1.action";
        [AFNetWorting getNetWortingWithUrlString:url params:nil controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
            [self.MarkeArr removeAllObjects];
            if (responseObject == nil) {
                ZGPplaceholderImageView *placeholderImage = [[ZGPplaceholderImageView alloc] initWithFrame:self.tableView.frame];
                [self.view addSubview:placeholderImage];
            }else{
                for (NSDictionary *dic in responseObject) {
                    if ([self.shangjiajutiweizhi isEqualToString:@"7"]) {
                        MarketModel *model = [[MarketModel alloc] init];
                        [model setValuesForKeysWithDictionary:dic];
                        [self.MarkeArr addObject:model];
                    }else if (dic[@"shangjiaJutiweizhi"] == self.shangjiajutiweizhi) {
                        MarketModel *model = [[MarketModel alloc] init];
                        [model setValuesForKeysWithDictionary:dic];
                        [self.MarkeArr addObject:model];
//                      [_fenleiArr addObject:dic];
                    }
                }
                if (self.MarkeArr.count == 0) {
                    ZGPplaceholderImageView *placeholderImage = [[ZGPplaceholderImageView alloc] initWithFrame:self.view.frame];
                    [self.view addSubview:placeholderImage];
                }
//                else{
//                for (NSDictionary *dic in _fenleiArr) {
//                    MarketModel *model = [[MarketModel alloc] init];
//                    [model setValuesForKeysWithDictionary:dic];
//                    [self.MarkeArr addObject:model];
//                }
//            }
                [self.tableView reloadData];
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
        }];
        
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.MarkeArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cateID = @"cateID";
    MarketCell *cell = [tableView dequeueReusableCellWithIdentifier:cateID];
    if (cell == nil) {
        cell = [MarketCell cellCreaterNibLoad];
    }
    if (self.MarkeArr.count != 0) {
        [cell marketModel:self.MarkeArr[indexPath.row]];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CateDetailsTableViewController *merchantVC = [[CateDetailsTableViewController alloc]init];
    if (self.MarkeArr.count > 0) {
        MarketModel *model = self.MarkeArr[indexPath.row];
        merchantVC.shopID = model.shangjiaId;
    }
    [self.navigationController pushViewController:merchantVC animated:YES];
}



@end
