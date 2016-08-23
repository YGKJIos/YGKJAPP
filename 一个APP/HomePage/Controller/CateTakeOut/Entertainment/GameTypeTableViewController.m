//
//  GameTypeTableViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/8/12.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "GameTypeTableViewController.h"
#import "CateDetailsTableViewController.h"
#import "GameTableViewCell.h"
#import "GameModel.h"

@interface GameTypeTableViewController ()
@property (nonatomic, strong) NSMutableArray *MarkeArr;
@property (nonatomic, strong) NSMutableArray *fenLeiArr;
@end

@implementation GameTypeTableViewController

-(NSMutableArray *)MarkeArr
{
    if (!_MarkeArr) {
        self.MarkeArr = [[NSMutableArray alloc]init];
    }
    return _MarkeArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fenLeiArr = [NSMutableArray array];
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
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_header endRefreshing];
        NSString *url = @"xiuxianyule/queryxiuxianyule.action";
        [AFNetWorting getNetWortingWithUrlString:url params:nil controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
            NSArray *arr = responseObject;
            if (arr.count == 0) {
                ZGPplaceholderImageView *placeholderImage = [[ZGPplaceholderImageView alloc] initWithFrame:self.view.frame];
                [self.view addSubview:placeholderImage];
            }else{
                for (NSDictionary *dic in responseObject) {
                    if (dic[@"shangjiaJutiweizhi"] == self.shangjiajutiweizhi) {
                        [_fenLeiArr addObject:dic];
                    }
                }
                if (_fenLeiArr.count == 0) {
                    ZGPplaceholderImageView *placeholderImage = [[ZGPplaceholderImageView alloc] initWithFrame:self.view.frame];
                    [self.view addSubview:placeholderImage];
                }else{
            for (NSDictionary *dic in _fenLeiArr) {
                GameModel *model = [[GameModel alloc] init];
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
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_footer endRefreshing];
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
    static NSString *reuse = @"reuse";
    GameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (cell == nil) {
        cell = [GameTableViewCell createGameCell];
    }
    [cell GameModel:self.MarkeArr[indexPath.row]];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 117;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CateDetailsTableViewController *gameDetailVC = [[CateDetailsTableViewController alloc] init];
    gameDetailVC.navigationItem.title = @"宾馆详情";
    gameDetailVC.shopID = [self.MarkeArr[indexPath.row] shangjiaId];
    [self.navigationController pushViewController:gameDetailVC animated:YES];
}

@end
