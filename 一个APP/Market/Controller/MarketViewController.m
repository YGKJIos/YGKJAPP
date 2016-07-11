//
//  MarketViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/6.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "MarketViewController.h"
#import "ShopTableViewCell.h"
#import "ShopModel.h"
#import "DropdownMenu.h"

@interface MarketViewController ()<UITableViewDataSource,UITableViewDelegate,dropdownDelegate>
@property (nonatomic, strong)NSMutableArray *MarkeArr;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, assign)BOOL result;
@end

@implementation MarketViewController
-(NSMutableArray *)MarkeArr
{
    if (!_MarkeArr) {
        self.MarkeArr = [[NSMutableArray alloc]init];
    }
    return _MarkeArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addTableViewAndHeaderView];
    // 添加刷新
    [self MJrefreshLoadData];
}
- (void)viewWillAppear:(BOOL)animated
{
    [_tableView.mj_header beginRefreshing];
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
    _tableView.mj_header = header;
    
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
        NSString *url = @"waimai/querywaimai1.action";
        [AFNetWorting getNetWortingWithUrlString:url params:nil controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
            NSLog(@"responseObject----%@",responseObject);
            NSArray *arr = responseObject;
            for (NSDictionary *dic in arr) {
                ShopModel *model = [[ShopModel alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                [self.MarkeArr addObject:model];
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

#pragma mark - 添加tableview和headerView
- (void)addTableViewAndHeaderView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 113) style:UITableViewStylePlain];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_tableView];
    
    
    // tabelViewheaderView  设置
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 180)];
    _tableView.tableHeaderView = headerView;
    // 轮播图
    NSArray *img = @[@"shouye_guangg",@"shouye_haigou" , @"shouye_meishitou",@"shouye_xinwen"];
    
    ScrollView *scrollView = [ScrollView CreateScrollViewImages:img];
    [headerView addSubview:scrollView];
        
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.MarkeArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *marketCellID = @"marketCellID";
    ShopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:marketCellID];
    if (cell == nil) {
        cell = [ShopTableViewCell createShopCell];
    }
    [cell ShopModel:self.MarkeArr[indexPath.row]];
   
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld , %ld" , (long)indexPath.row , (long)indexPath.section);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
