//
//  MovieShopTableViewController.m
//  一个APP
//
//  Created by 远古科技 on 16/9/20.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "MovieShopTableViewController.h"
#import "MovieShopTableViewCell.h"
#import "MovieTableViewController.h"
#import "MovieShopModel.h"
@interface MovieShopTableViewController ()
@property (nonatomic, retain) NSMutableArray *MovieArr;
@end

@implementation MovieShopTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"电影商家";
    [self addTableHeaderView];
    self.MovieArr = [[NSMutableArray alloc] init];
    [self MJrefreshLoadData];
    [self loadNewData];
    
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
    [self.tableView.mj_header beginRefreshing];
}
// 下拉刷新的方法
- (void)loadNewData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_header endRefreshing];
        NSString *url = @"dianying/querydianyingshangjia.action";
        [AFNetWorting getNetWortingWithUrlString:url params:nil controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
            [self.MovieArr removeAllObjects];
            NSArray *arr = responseObject;
            if (arr.count == 0) {
                ZGPplaceholderImageView *placeholderImage = [[ZGPplaceholderImageView alloc] initWithFrame:self.view.frame];
                [self.view addSubview:placeholderImage];
            }else{
                for (NSDictionary *dic in arr) {
                    MovieShopModel *model = [[MovieShopModel alloc] init];
                    [model setValuesForKeysWithDictionary:dic];
                    [self.MovieArr addObject:model];
                }
                [self.tableView reloadData];
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
        }];
        
        
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.MovieArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuse = @"reues";
    MovieShopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [MovieShopTableViewCell createCell];
        [cell MovieShopModel:self.MovieArr[indexPath.row]];
        
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath

{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    MovieTableViewController *movieVC = [[MovieTableViewController alloc] init];
    movieVC.str = [self.MovieArr[indexPath.row] shangjiaId];
    
    [self.navigationController pushViewController:movieVC animated:YES];
    
    
}





@end
