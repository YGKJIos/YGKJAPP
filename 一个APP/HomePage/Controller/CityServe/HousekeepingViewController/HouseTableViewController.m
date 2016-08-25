//
//  HouseTableViewController.m
//  一个APP
//
//  Created by 远古科技 on 16/6/30.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "HouseTableViewController.h"
#import "detailTableViewController.h"
#import "HouseTableViewCell.h"
#import "MerchantInformationModel.h"

@interface HouseTableViewController ()
@property (nonatomic, strong)NSMutableArray *MarkeArr;
@end

@implementation HouseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"家政服务";
    [self addTableHeaderView];
    self.MarkeArr = [[NSMutableArray alloc] init];
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
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_header endRefreshing];
        NSString *url = @"jiazhengfuwu/queryjiazhengfuwu.action";
        [AFNetWorting getNetWortingWithUrlString:url params:nil controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
            NSArray *arr = responseObject;
            if (arr.count == 0) {
                ZGPplaceholderImageView *placeholderImage = [[ZGPplaceholderImageView alloc] initWithFrame:self.view.frame];
                [self.view addSubview:placeholderImage];
            }else{
            for (NSDictionary *dic in arr) {
                MerchantInformationModel *model = [[MerchantInformationModel alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                [self.MarkeArr addObject:model];
            }
            [self.tableView reloadData];
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
        }];

    });
    
}
// 上拉加载的方法
- (void)loadMoreData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_footer endRefreshing];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (void)addTableHeaderView
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 150)];
    headerView.backgroundColor = [UIColor orangeColor];
    
    NSArray *arr = @[@"jz_guanggao",@"shouye_haigou",@"shouye_meishitou",@"shouye_xinwen"];
    ScrollView *scroll = [ScrollView CreateScrollViewImages:arr];
    scroll.frame = CGRectMake(0, 0, WIDTH, 150);
    [headerView addSubview:scroll];
    
    self.tableView.tableHeaderView = headerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.MarkeArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *str = @"reuse";
    HouseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [HouseTableViewCell createHouseCell];
    }
    if (self.MarkeArr.count > 0) {
        
        [cell HouseModel:self.MarkeArr[indexPath.row]];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    detailTableViewController *detailVC = [[detailTableViewController alloc]init];
    if (self.MarkeArr.count != 0) {
        detailVC.model = self.MarkeArr[indexPath.row];
    }
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
