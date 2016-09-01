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

#import "CateDetailsTableViewController.h"
#import "MarketModel.h"

@interface MarketViewController ()<UITableViewDataSource,UITableViewDelegate>
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
    self.navigationItem.title = @"商家";
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
    
}
// 下拉刷新的方法
- (void)loadNewData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_header endRefreshing];
        NSString *url = @"shangjia/queryshangjia.action";
        [AFNetWorting getNetWortingWithUrlString:url params:nil controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
            [self.MarkeArr removeAllObjects];
            NSArray *arr = responseObject;
            if (arr.count == 0) {
                ZGPplaceholderImageView *placeholderImage = [[ZGPplaceholderImageView alloc] initWithFrame:self.view.frame];
                [self.view addSubview:placeholderImage];
            }else{
            for (NSDictionary *dic in arr) {
                ShopModel *model = [[ShopModel alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                [self.MarkeArr addObject:model];
            }
            [self.tableView reloadData];
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {

        }];
        
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
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 150)];
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
    if (self.MarkeArr != nil) {
        [cell ShopModel:self.MarkeArr[indexPath.row]];
    }
   
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CateDetailsTableViewController *merchantVC = [[CateDetailsTableViewController alloc]init];
    MarketModel *model = self.MarkeArr[indexPath.row];
    merchantVC.shopID = model.shangjiaId;
    [self.navigationController pushViewController:merchantVC animated:YES];
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
