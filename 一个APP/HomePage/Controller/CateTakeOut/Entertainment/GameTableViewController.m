//
//  GameTableViewController.m
//  一个APP
//
//  Created by 远古科技 on 16/6/27.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "GameTableViewController.h"
#import "GameTypeTableViewController.h"
#import "GameTableViewCell.h"
#import "DOPDropDownMenu.h"
#import "GameModel.h"
#import "CateDetailsTableViewController.h"
#import "MerchantInformationModel.h"

@interface GameTableViewController ()<ImageLabViewPushVCDelegate>
@property (nonatomic, strong) NSArray *classifys;
@property (nonatomic, strong) NSArray *cates;
@property (nonatomic, strong) NSArray *movices;
@property (nonatomic, strong) NSArray *hostels;
@property (nonatomic, strong) NSArray *areas;
@property (nonatomic, strong) NSArray *sorts;
@property (nonatomic, strong) NSMutableArray *MarkeArr;

@end

@implementation GameTableViewController
-(NSMutableArray *)MarkeArr
{
    if (!_MarkeArr) {
        self.MarkeArr = [[NSMutableArray alloc]init];
    }
    return _MarkeArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"休闲娱乐";
    // 刷新数据
    [self addHeaderView];
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
            for (NSDictionary *dic in arr) {
                MerchantInformationModel *model = [[MerchantInformationModel alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                [self.MarkeArr addObject:model];
            }
            [self.tableView reloadData];
            
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
#pragma mark - 添加table 的haedView
- (void)addHeaderView
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 300)];
    NSArray *arr = @[@"waimai_tu",@"shouye_haigou",@"shouye_meishitou",@"shouye_xinwen"];
    ScrollView *scroll = [ScrollView CreateScrollViewImages:arr];
    scroll.frame = CGRectMake(0, 0, WIDTH, 150);
    [headerView addSubview:scroll];
    
    //图片数组
    NSArray *images = @[@"xiuxian_zhuoyou",@"xiuxian_kafei",@"xiuxian_anmo",@"xiuxian_ktv",@"xiuxian_yundong",@"xiuxian_dianying",@"xiuxian_xiyu",@"xiuxian_quanbu"];
    NSArray *titles = @[@"桌游电玩",@"酒吧咖啡",@"足疗按摩",@"KTV",@"运动健身",@"4D/5D电影",@"沐浴汗蒸",@"其他娱乐"];
    NSInteger num = 0;
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 2; j++) {
            ImageAndLabView *view = [ImageAndLabView createViewNib];
            view.delegate = self;
            view.frame = CGRectMake(30+(40+WIDTH/
                                        4-40)*i,scroll.height+ 10+(40+40)*j, 40, 40);
            [view setImages:images[num] names:titles[num]];
            num++;
            [headerView addSubview:view];
        }
    }
    self.tableView.tableHeaderView = headerView;
}
- (void)imageAndLableViewPush
{
    GameTypeTableViewController *typeVC = [[GameTypeTableViewController alloc]init];
    [self.navigationController pushViewController:typeVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.MarkeArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str = @"reuse";
    GameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [GameTableViewCell createGameCell];
    }
    if (self.MarkeArr.count != 0) {
        [cell GameModel:self.MarkeArr[indexPath.row]];
    }
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
