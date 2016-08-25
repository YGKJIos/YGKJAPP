//
//  MovieTableViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/25.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "MovieTableViewController.h"
#import "MoiveTableViewCell.h"
#import "MovieModel.h"
#import "MoviewDetailTableViewController.h"
#import "CateDetailsTableViewController.h"

@interface MovieTableViewController ()
@property (nonatomic, retain) NSMutableArray *MovieArr;


@end

@implementation MovieTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"电影";
    self.navigationItem.rightBarButtonItem = nil;
    
    [self addTableHeaderView];
    self.MovieArr = [[NSMutableArray alloc] init];
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
    [self.MovieArr removeAllObjects];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_header endRefreshing];
        NSString *url = @"dianying/querydianying1.action";
        [AFNetWorting getNetWortingWithUrlString:url params:nil controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
            NSArray *arr = responseObject;
            if (arr.count == 0) {
                ZGPplaceholderImageView *placeholderImage = [[ZGPplaceholderImageView alloc] initWithFrame:self.view.frame];
                [self.view addSubview:placeholderImage];
            }else{
            for (NSDictionary *dic in arr) {
                MovieModel *model = [[MovieModel alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                [self.MovieArr addObject:model];
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


- (void)addTableHeaderView
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 150)];
    headerView.backgroundColor = [UIColor orangeColor];
    
    NSArray *arr = @[@"sanjiao_02",@"shouye_haigou",@"shouye_meishitou",@"shouye_xinwen"];
    ScrollView *scroll = [ScrollView CreateScrollViewImages:arr];
    scroll.frame = CGRectMake(0, 0, WIDTH, 150);
    [headerView addSubview:scroll];
    
    self.tableView.tableHeaderView = headerView;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.MovieArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str = @"reues";
    MoiveTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [MoiveTableViewCell createMoiveCell];
        [cell MovieModel:self.MovieArr[indexPath.row]];
    }
    
    cell.selectionStyle = UITableViewScrollPositionNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 151;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     CateDetailsTableViewController *detailVC = [[CateDetailsTableViewController alloc] init];
    detailVC.navigationItem.title = @"电影详情";
    detailVC.shopID = [self.MovieArr[indexPath.row] shangjiaId];
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
