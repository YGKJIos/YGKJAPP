//
//  CateViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/23.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "CateViewController.h"
#import "CateTypeTableViewController.h"// 自助餐，火锅。。。
//#import "MerchantFoodTableViewController.h" // 商家美食
#import "CateDetailsTableViewController.h"
#import "SDCycleScrollView.h"
#import "DropdownMenu.h"
#import "MarketCell.h"
#import "MarketModel.h"

@interface CateViewController ()<SDCycleScrollViewDelegate,dropdownDelegate,ImageLabViewPushVCDelegate>
@property (nonatomic, strong)SDCycleScrollView *scrollView;
@property (nonatomic, strong)UIView *bgView;// tableViewHeaderView
@property (nonatomic, strong)DropdownMenu *menu;
@property (nonatomic, strong)NSMutableArray *MarkeArr;

@end

@implementation CateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.MarkeArr = [[NSMutableArray alloc]init];
#pragma mark - 数据请求
    [self MJrefreshLoadData];
    self.navigationItem.title = @"美食";
    
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *leftItem = [UIBarButtonItem itemWithTarget:self action:@selector(navigationLeftBtnAction) image:@"meishi_fanghui" highImage:@"meishi_fanghui"];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    [self addHeaderView];
    [self addMenuBtn];
    
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
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_header endRefreshing];
        NSString *url = @"meishi/querymeishi1.action";
        [AFNetWorting getNetWortingWithUrlString:url params:nil controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
            NSArray *arr = responseObject;
            for (NSDictionary *dic in arr) {
                MarketModel *model = [[MarketModel alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                [self.MarkeArr addObject:model];
            }
            [self.tableView reloadData];
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"error-----%@",error);
        }];
        
    });
    
}
// 上拉加载的方法
- (void)loadMoreData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_footer endRefreshing];
        NSLog(@"MJ-上啦加载");
    });
}

- (void)navigationRigthBtnAction
{
    NSLog(@"navigationRigthBtnAction");
}
- (void)navigationLeftBtnAction
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - 轮播图
- (void)addHeaderView
{
    self.bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 330)];
    NSArray *images = @[@"shouye_guangg",@"shouye_haigou",@"shouye_meishitou",@"shouye_xinwen"];
    ScrollView *scroll = [ScrollView CreateScrollViewImages:images];
    [self.bgView addSubview:scroll];
    self.tableView.tableHeaderView = self.bgView;
}
- (void)addMenuBtn
{
    NSArray *arr = @[@"meishi_zizhu",@"meishi_huoguo",@"meishi_kuaican",@"meishi_xican",@"meishi_zhongcan",@"meishi_shaokao",@"meishi_dangao",@"meishi_quanbu"];
    
    NSArray *titles = @[@"自助餐",@"火锅",@"快餐小吃",@"西餐",@"中餐",@"烤肉/烧烤",@"蛋糕",@"全部分类",];
    int num = 0;
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 4; j++) {
            ImageAndLabView *view = [ImageAndLabView createViewNib];
            [view setUserInteractionEnabled:YES];
            [view setImages:arr[num] names:titles[num]];
            view.delegate = self;
            num++;
            view.frame = CGRectMake(35+j*(40+50), 170+i*(67+20), 40, 60);
            [self.bgView addSubview:view];
        }
    }
}
- (void)imageAndLableViewPush
{
    CateTypeTableViewController *cateTypeVC = [[CateTypeTableViewController alloc]init];
    [self.navigationController pushViewController:cateTypeVC animated:YES];
}

//轮播图 点击代理方法
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"%ld",index);
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.MarkeArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cateCell = @"cateID";
    MarketCell *cell = [tableView dequeueReusableCellWithIdentifier:cateCell];
    if (cell == nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"MarketCell" owner:nil options:nil].lastObject;
    }
    
    [cell marketModel:self.MarkeArr[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 108;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CateDetailsTableViewController *merchantVC = [[CateDetailsTableViewController alloc]init];
//    merchantVC.shopID = [self.MarkeArr[indexPath.row] objectForKey:@"shangjiaId"];
    [self.navigationController pushViewController:merchantVC animated:YES];
}


@end
