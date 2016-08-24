//
//  CateTypeTableViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/19.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "CateTypeTableViewController.h"
//#import "MerchantFoodTableViewController.h"
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
    [self MJrefreshLoadData];
}
- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView.mj_header beginRefreshing];
    [super viewWillAppear:animated];
}

#pragma mark - MJ刷新
- (void)MJrefreshLoadData
{
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    [header setTitle:@"正在刷新数据中..." forState:MJRefreshStateRefreshing];
    [header setTitle:@"下拉刷新数据" forState:MJRefreshStateIdle];
    [header setTitle:@"松开刷新数据" forState:MJRefreshStatePulling];
    header.lastUpdatedTimeLabel.hidden = YES;
    self.tableView.mj_header = header;
    
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    // 设置文字
    [footer setTitle:@"上拉加载更多数据" forState:MJRefreshStateIdle];
    [footer setTitle:@"加载更多数据..." forState:MJRefreshStateRefreshing];
    [footer setTitle:@"松开加载更多数据" forState:MJRefreshStatePulling];
    self.tableView.mj_footer = footer;
    
}
// 下拉刷新的方法
- (void)loadNewData{
    [self.MarkeArr removeAllObjects];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_header endRefreshing];
        NSString *url = @"meishi/querymeishi1.action";
        [AFNetWorting getNetWortingWithUrlString:url params:nil controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
            if (responseObject == nil) {
                ZGPplaceholderImageView *placeholderImage = [[ZGPplaceholderImageView alloc] initWithFrame:self.tableView.frame];
                [self.view addSubview:placeholderImage];
            }else{
                for (NSDictionary *dic in responseObject) {
                    if ([self.shangjiajutiweizhi isEqualToString:@"7"]) {
                        _fenleiArr = responseObject;
                    }else if (dic[@"shangjiaJutiweizhi"] == self.shangjiajutiweizhi) {
                        [_fenleiArr addObject:dic];
                    }
                }
                if (_fenleiArr.count == 0) {
                    ZGPplaceholderImageView *placeholderImage = [[ZGPplaceholderImageView alloc] initWithFrame:self.view.frame];
                    [self.view addSubview:placeholderImage];
                }else{
                for (NSDictionary *dic in _fenleiArr) {
                    MarketModel *model = [[MarketModel alloc] init];
                    [model setValuesForKeysWithDictionary:dic];
                    [self.MarkeArr addObject:model];
                }
            }
                [self.tableView reloadData];
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
        }];
        
    });
    
}
// 上拉加载的方法
- (void)loadMoreData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_footer endRefreshing];
        NSLog(@"MJ-上啦加载");
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return 115;
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
