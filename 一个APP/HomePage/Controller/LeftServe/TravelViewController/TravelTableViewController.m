//
//  TravelTableViewController.m
//  一个APP
//
//  Created by 远古科技 on 16/7/4.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "TravelTableViewController.h"
#import "TravelView.h"
#import "TravelTableViewCell.h"
#import "CateDetailsTableViewController.h"
@interface TravelTableViewController ()
@property (nonatomic, strong)NSMutableArray *MarkeArr;
@end

@implementation TravelTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"同城旅游";
    [self addTableHeaderView];
    self.MarkeArr = [[NSMutableArray alloc] init];
    [self MJrefreshLoadData];
}

- (void)viewWillAppear:(BOOL)animated
{
    
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
    [self.tableView.mj_header beginRefreshing];
    
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    // 设置文字
    [footer setTitle:@"上拉加载更多数据" forState:MJRefreshStateIdle];
    [footer setTitle:@"加载更多数据..." forState:MJRefreshStateRefreshing];
    [footer setTitle:@"松开加载更多数据" forState:MJRefreshStatePulling];
    self.tableView.mj_footer = footer;
    
}

// 下拉刷新的方法
- (void)loadNewData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_header endRefreshing];
        NSString *url = @"tongchenglvyou/querylvyou1.action";
        [AFNetWorting getNetWortingWithUrlString:url params:nil controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
            [self.MarkeArr removeAllObjects];
            NSArray *arr = responseObject;
            if (arr.count == 0) {
                ZGPplaceholderImageView *placeholderImage = [[ZGPplaceholderImageView alloc] initWithFrame:self.view.frame];
                [self.view addSubview:placeholderImage];
            }else{
            for (NSDictionary *dic in arr) {
                TravelModel *model = [[TravelModel alloc] init];
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

- (void)addTableHeaderView
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 150)];
    headerView.backgroundColor = [UIColor whiteColor];
    
//    UIImageView *fairImage = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH/3-110, 165, 11, 17)];
//    fairImage.image = [UIImage imageNamed:@"huo"];
//    
//    [headerView addSubview:fairImage];
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(fairImage.origin.x+fairImage.size.width+5, 150, 100, 50)];
//    label.text = @"当季最火";
//    label.textColor = BGcolor(59, 59, 59);
//    [headerView addSubview:label];
//    
//    
//    TravelView *view1 = [[[NSBundle mainBundle]loadNibNamed:@"TravelView" owner:nil options:nil]lastObject];
//    view1.origin = CGPointMake(WIDTH/3-110, 200);
//    [headerView addSubview:view1];
//    
//    TravelView *view2 = [[[NSBundle mainBundle] loadNibNamed:@"TravelView" owner:nil options:nil]lastObject];
//    view2.origin = CGPointMake(2*WIDTH/3-110, 200);
//    [headerView addSubview:view2];
//    
//    TravelView *view3 = [[[NSBundle mainBundle] loadNibNamed:@"TravelView" owner:nil options:nil]lastObject];
//    view3.origin = CGPointMake(WIDTH-110, 200);
//    [headerView addSubview:view3];
    
    
    NSArray *arr = @[@"ly_guanggao",@"shouye_haigou",@"shouye_meishitou",@"shouye_xinwen"];
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
    return self.MarkeArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *str = @"reuse";
    
    TravelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [TravelTableViewCell createTravelCell];
        [cell TravelModel:self.MarkeArr[indexPath.row]];
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
    CateDetailsTableViewController *detailVC = [[CateDetailsTableViewController alloc] init];
    detailVC.navigationItem.title = @"旅游详情";
    detailVC.shopID = [self.MarkeArr[indexPath.row] shangjiaId];
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
