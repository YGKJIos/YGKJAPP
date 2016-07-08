//
//  TheHotelTableViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/25.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "TheHotelTableViewController.h"
#import "TheHotelTableViewCell.h"
#import "TheHotelModel.h"


@interface TheHotelTableViewController ()

@property (nonatomic, strong)UILabel *lineLab;
@property (nonatomic, retain) NSMutableArray *HotelArr;

@end

@implementation TheHotelTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTableHeaderView];
    self.HotelArr = [[NSMutableArray alloc] init];
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
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_header endRefreshing];
        NSString *url = @"dianying/querydianying.action";
        [AFNetWorting getNetWortingWithUrlString:url params:nil controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
            NSLog(@"responseObject----%@",responseObject);
            NSArray *arr = responseObject;
            for (NSDictionary *dic in arr) {
                TheHotelModel *model = [[TheHotelModel alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                [self.HotelArr addObject:model];
            }
            [self.tableView reloadData];
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"error-----%@",error);
        }];
        
        NSLog(@"MJ-下拉刷新");
        
    });
    
}
// 上拉加载的方法
- (void)loadMoreData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_footer endRefreshing];
        NSLog(@"MJ-上啦加载");
    });
}


- (void)addTableHeaderView
{

    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 190)];
    headerView.backgroundColor = [UIColor redColor];
    
    // 日全房
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self createBtn:leftBtn title:@"全日房" x:0];
    [leftBtn addTarget:self action:@selector(dayHouseClick) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:leftBtn];
    // 钟点房
    UIButton *rigthBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self createBtn:rigthBtn title:@"钟点房" x:WIDTH/2];
    
    [rigthBtn addTarget:self action:@selector(hourHouseClick) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:rigthBtn];
    // 滑动的线
    self.lineLab = [[UILabel alloc]init];
    self.lineLab.frame = CGRectMake(0, 38, WIDTH/2, 2);
    self.lineLab.backgroundColor = BGcolor(83, 198, 24);
    [headerView addSubview:self.lineLab];
    
    NSArray *arr = @[@"binguandatu_tus",@"waimai_tu",@"shouye_haigou",@"shouye_meishitou"];
    ScrollView *scroll = [ScrollView CreateScrollViewImages:arr];
    scroll.frame = CGRectMake(0, leftBtn.height, WIDTH, 150);
    [headerView addSubview:scroll];
    
    self.tableView.tableHeaderView = headerView;
}

- (void)dayHouseClick
{
    [UIView animateWithDuration:0.15 animations:^{
        self.lineLab.frame = CGRectMake(0, 38, WIDTH/2, 2);
    }];

}
- (void)hourHouseClick
{
    [UIView animateWithDuration:0.2 animations:^{
        self.lineLab.frame = CGRectMake(WIDTH/2, 38, WIDTH/2, 2);
    }];

}

- (void)createBtn:(UIButton *)btn title:(NSString *)title x:(CGFloat)x
{
    btn.frame = CGRectMake(x, 0, WIDTH/2, 40);
    btn.backgroundColor = BGcolor(239, 239, 239);
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:17];
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.HotelArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *hotelID = @"hotelID";
    TheHotelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:hotelID];
    if (cell == nil) {
        cell = [TheHotelTableViewCell createTheHotelCell];
        [cell TheHotelModel:self.HotelArr[indexPath.row]];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 107;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
