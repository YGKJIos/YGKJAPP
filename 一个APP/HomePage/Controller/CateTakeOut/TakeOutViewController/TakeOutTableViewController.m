     //
//  TakeOutTableViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/25.
//  Copyright © 2016年 llb. All rights reserved.
//
// 外卖
#import "TakeOutTableViewController.h"
#import "TypeTakeOutTableViewController.h" // 美食，鲜花，蛋糕。。
#import "TakeOutInformationController.h"// 商家详情
#import "TakeTableViewCell.h"
#import "DOPDropDownMenu.h"
#import "MerchantInformationModel.h"

@interface TakeOutTableViewController ()<ImageLabViewPushVCDelegate>
{
    NSInteger _k;
}
@property (nonatomic, strong) NSArray *cates;

@property (nonatomic, strong)NSMutableArray *takeOutArr;

@end

@implementation TakeOutTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"外卖";
    self.takeOutArr = [NSMutableArray array];
    [self addTableHeaderView];
    self.tableView.showsVerticalScrollIndicator = NO;
#pragma mark - 数据请求
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
    [self.takeOutArr removeAllObjects];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_header endRefreshing];
        NSString *url = @"waimai/querywaimai1.action";
        [AFNetWorting getNetWortingWithUrlString:url params:nil controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
            NSArray *arr = responseObject;
            NSLog(@"外卖---------%@" , responseObject);
            if (arr.count == 0) {
                ZGPplaceholderImageView *placeholderImage = [[ZGPplaceholderImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
                [self.view addSubview:placeholderImage];
            }else{
            
            for (NSDictionary *dic in arr) {
                MerchantInformationModel *model = [[MerchantInformationModel alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                [self.takeOutArr addObject:model];
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
    UIView *tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 228)];
    NSArray *arr = @[@"waimai_tu",@"shouye_haigou",@"shouye_meishitou",@"shouye_xinwen"];
    ScrollView *scrollView = [ScrollView CreateScrollViewImages:arr];
    [tableHeaderView addSubview:scrollView];
    NSArray *btnImage = @[@"waimai_meishi",@"waimei_xianhua",@"waimai_dangao",@"waimai_yaopin"];
    NSArray *titles = @[@"美食",@"鲜花",@"蛋糕",@"药品"];
    self.cates = titles;
    for (int i = 0; i < 4; i++) {
        ImageAndLabView *view = [ImageAndLabView createViewNib];
        view.frame = CGRectMake(30+(40+WIDTH/4-40)*i,scrollView.height+ 10, 40, 40);
        view.delegate = self;
        [view setImages:btnImage[i] names:titles[i]tag: 100 + i];
        [tableHeaderView addSubview:view];
    }
    
    self.tableView.tableHeaderView = tableHeaderView;
}
- (void)clickBtnImage:(UIButton *)btn
{
    NSLog(@"meishi");
}
#pragma mark - 美食 ，鲜花，蛋糕，药品 跳转方法
- (void)imageAndLableViewPush:(UIButton *)btn
{
    TypeTakeOutTableViewController *typeTakeOutVC = [[TypeTakeOutTableViewController alloc]init];
    typeTakeOutVC.shangjiajutiweizhi = [NSString stringWithFormat:@"%ld", btn.tag - 100];
    typeTakeOutVC.navigationItem.title = self.cates[btn.tag - 100];
    [self.navigationController pushViewController:typeTakeOutVC animated:YES];
}
#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.takeOutArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *takeOut = @"takeOutId";
    TakeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:takeOut];
    if (cell == nil) {
        cell = [TakeTableViewCell CreateTakeOutCell];
    }
    [cell setTakeOutModel:self.takeOutArr[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 115;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TakeOutInformationController *informationVC = [[TakeOutInformationController alloc]init];
    if (self.takeOutArr.count > 0) {
        informationVC.navigationItem.title = [self.takeOutArr[indexPath.row] shangjiaName];
        informationVC.model = self.takeOutArr[indexPath.row];
    }
    [self.navigationController pushViewController:informationVC animated:YES];
}

@end
