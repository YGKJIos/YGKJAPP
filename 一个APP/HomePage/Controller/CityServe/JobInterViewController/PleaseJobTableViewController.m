//
//  PleaseJobTableViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/30.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "PleaseJobTableViewController.h"
#import "detailTableViewController.h"
#import "PleaseJobTableViewCell.h"
#import "PleaseJobModel.h"
@interface PleaseJobTableViewController ()<SDCycleScrollViewDelegate>
@property (nonatomic, retain) NSMutableArray *jobArr;

@end

@implementation PleaseJobTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setNavigationStyle];
    self.navigationItem.title = @"热门招聘";
    [self addTableViewHeaderView];
    self.jobArr = [[NSMutableArray alloc] init];
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
    [self.jobArr removeAllObjects];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_header endRefreshing];
        NSString *url = @"qiuzhizhaopin/queryqiuzhizhaopin.action";
        [AFNetWorting getNetWortingWithUrlString:url params:nil controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
            NSArray *arr = responseObject;
            if (arr.count == 0) {
                ZGPplaceholderImageView *placeholderImage = [[ZGPplaceholderImageView alloc] initWithFrame:self.view.frame];
                [self.view addSubview:placeholderImage];
            }else{
            for (NSDictionary *dic in arr) {
                PleaseJobModel *model = [[PleaseJobModel alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                [self.jobArr addObject:model];
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
        NSLog(@"MJ-上啦加载");
    });
}

#pragma mark - 设置标题栏的样式
- (void)setNavigationStyle
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 250, 25)];
    [imageView setUserInteractionEnabled:YES];
    imageView.image = [UIImage imageNamed:@"zc_navigationBar"];
    self.navigationItem.titleView = imageView;
    
    UIButton *leftBut = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBut.backgroundColor = [UIColor clearColor];
    leftBut.frame = CGRectMake(0, 0, 125, 25);
    [leftBut addTarget:self action:@selector(leftClickAction) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:leftBut];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.backgroundColor = [UIColor clearColor];
    rightBtn.frame = CGRectMake(127, 0, 125, 25);
    [rightBtn addTarget:self action:@selector(rightClickAction) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:rightBtn];
}
- (void)leftClickAction
{
    NSLog(@"全职");
}
- (void)rightClickAction
{
    NSLog(@"兼职");
}

- (void)addTableViewHeaderView
{
    NSArray *arr = @[@"zc_lunbo",@"zc_lunbo",@"zc_lunbo",@"zc_lunbo",];
    ScrollView *view = [ScrollView CreateScrollViewImages:arr];
    view.scrollView.delegate = self;
    self.tableView.tableHeaderView = view;
}
#pragma mark - 轮播图点击方法
-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"%ld",index);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.jobArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *jobId = @"jobId";
    PleaseJobTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:jobId];
    if (cell == nil) {
        cell = [PleaseJobTableViewCell createJobCell];
        [cell JobModel:self.jobArr[indexPath.row]];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 113;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    detailTableViewController *detailVC = [[detailTableViewController alloc]init];
    if (self.jobArr.count > 0) {
        detailVC.model = self.jobArr[indexPath.row];
    }
    [self.navigationController pushViewController:detailVC animated:YES];
}


@end
