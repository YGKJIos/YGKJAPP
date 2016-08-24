//
//  HomePageTableViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/17.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "HomePageTableViewController.h"
#import "SDCycleScrollView.h"  //轮播图
#import "HomeTableViewCell.h"
#import "TableViewHeader.h"  //table section 视图
#import "FirstTableViewCell.h"
#import "SecondTableViewCell.h"
#import "ThridTableViewCell.h"
#import "FoodHomeCell.h"
#import "ShoppingCell.h"
#import "CateViewController.h" // 美食controller
#import "TakeOutTableViewController.h" //外卖
#import "TheHotelTableViewController.h" // 宾馆
#import "SupermarketViewController.h" //超市
#import "MovieTableViewController.h" // 电影
#import "GameTableViewController.h" // 休闲娱乐
#import "AllStylViewController.h" // 全部分类
#import "CarViewController.h" // 拼车
#import "LearnViewController.h" // 生活服务（学习培训）
#import "sevCarTableViewController.h" // 生活服务(汽车)
#import "TravelTableViewController.h" // 生活服务(旅游)
#import "TakePhotoTableViewController.h" //生活服务(摄影)
#import "WeddingTableViewController.h" // 生活服务(婚庆)
#import "FeastTableViewController.h" // 生活服务(宴会)
#import "PleaseJobTableViewController.h" //同城服务（求职招聘）
#import "SecondHandTableViewController.h"//同城服务 （二手置换）
#import "HouseTableViewController.h" // 同城服务（家政服务）
#import "SmallAdvertisingTableViewController.h" //同城服务（小广告）
#import "NewsTableViewController.h" // 新闻
#import "priceViewController.h" // 生活缴费
#import "shopViewController.h" // 本地购物
#import "HomeModel.h" // 首页model

@interface HomePageTableViewController ()<SDCycleScrollViewDelegate,pushViewControllerDelegate,pushViewControllerSecondDelegate, pushviewcontrollerThridDelegate,FoodHomePushDelegate,ShopingPushDelegate>

@property (nonatomic, strong)SDCycleScrollView *scrollView;
@property (nonatomic, retain) NSMutableArray *homeArr; // 首页model数组
@end

@implementation HomePageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setShowsHorizontalScrollIndicator:NO];
    [self.tableView setShowsVerticalScrollIndicator:NO];
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.homeArr = [[NSMutableArray alloc] init];
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
    
}

// 下拉刷新的方法
- (void)loadNewData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_header endRefreshing];
        NSString *url = @"zhuye/queryzhuye.action";
        [AFNetWorting getNetWortingWithUrlString:url params:nil controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
            
            NSArray *arr = @[@"zhaopin",@"ershou",@"zhoubian",@"meishi",@"xinwen"];
            NSDictionary *rootDic = responseObject;
            if (rootDic == nil) {
                ZGPplaceholderImageView *placeholderImage = [[ZGPplaceholderImageView alloc] initWithFrame:self.view.frame];
                [self.view addSubview:placeholderImage];
            }else{
            for (int i= 0 ; i < arr.count; i++) {
                NSDictionary *dic = rootDic[arr[i]];
                HomeModel *model = [[HomeModel alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                [self.homeArr addObject:model];
            }
            [self.tableView reloadData];
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
        }];
        
        
    });
    
}
- (void)addHeaderView
{
    UIImage *image1 = [UIImage imageNamed:@"shouye_guangg"];
    UIImage *image2 = [UIImage imageNamed:@"shouye_haigou"];
    UIImage *image3 = [UIImage imageNamed:@"shouye_meishitou"];
    UIImage *image4 = [UIImage imageNamed:@"shouye_xinwen"];
    NSArray *images = @[image1,image2,image3,image4];
    self.scrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, WIDTH, 150) imagesGroup:images];
    self.scrollView.delegate = self;
    // 是否无限循环
    self.scrollView.infiniteLoop = YES;
    // pageControl样式
    self.scrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    self.scrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    // 分页控件图标
    self.scrollView.dotColor = [UIColor cyanColor];
    // 循环时间间隔,默认2.0s
    self.scrollView.autoScrollTimeInterval = 2.0;
}
// 点击轮播图的方法
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"%ld",index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 3) {
        return 385;
    }
    if (indexPath.section == 5) {
        return 160;
    }
    if (indexPath.section == 6) {
        return 340;
    }
    if (indexPath.section == 7) {
        return 110;
    }
    if (indexPath.section == 9) {
        return 142;
    }
    return 200;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        [self addHeaderView];
        return self.scrollView;
    }
    if (section == 2) {
        TableViewHeader *view = [[TableViewHeader alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
        [view setTitleLabText:@"同城服务"];
        return view;
    }
    if (section == 3) {
        TableViewHeader *view = [[TableViewHeader alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
        [view setTitleLabText:@"生活服务"];
        return view;
    }
    if (section == 4) {
        TableViewHeader *view = [[TableViewHeader alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
        [view setTitleLabText:@"时事新闻"];
        return view;
    }
    if (section == 5) {
        TableViewHeader *view = [[TableViewHeader alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
        [view setTitleLabText:@"美食精选"];
        return view;
    }
    if (section == 6) {
        TableViewHeader *view = [[TableViewHeader alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
        [view setTitleLabText:@"嗨购专场"];
        return view;
    }
    if (section == 7) {
        TableViewHeader *view = [[TableViewHeader alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
        [view setTitleLabText:@"畅游周边"];
        return view;
    }
    if (section == 8) {
        TableViewHeader *view = [[TableViewHeader alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
        [view setTitleLabText:@"热门招聘"];
        return view;
    }
    if (section == 9) {
        TableViewHeader *view = [[TableViewHeader alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
        [view setTitleLabText:@"二手置换"];
        return view;
    }
    return nil;
 
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 150;
    }
    if (section == 1) {
        return 0;
    }
    return 40;
}

#pragma mark - tableViewCell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 同城服务
    if (indexPath.section == 2) {
        SecondTableViewCell *cell = [[SecondTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.delegate = self;
        NSArray *arr = @[@"shouye_bdgw",@"shouye_shjf",@"shouye_jzfw",@"shouye_eszh",@"shouye_zpqz",@"shouye_xggl"];
        [cell setSecondCellImage:arr];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    // 生活服务
    if (indexPath.section == 3) {
        ThridTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ThridID"];
        if (cell == nil) {
            cell = [[ThridTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ThridID"];
            [cell cellStyle:lifeServeCellStyle];
            cell.delegte = self;
        }
        
        [cell setThridCellHomeModel:nil];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    // 时事新闻
    if (indexPath.section == 4) {
        ThridTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fourthID"];
        if (!cell) {
            cell = [[ThridTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"fourthID"];
            [cell cellStyle:newCellStyle];
            cell.delegte = self;
        }
        if (self.homeArr.count > 0) {
            HomeModel *model = self.homeArr[4];
            [cell setThridCellHomeModel:model];
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    // 美食精选
    if (indexPath.section == 5) {
        FoodHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"foodId"];
        if (!cell) {
            cell = [[FoodHomeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"foodId"];
            cell.delegate = self;
        }
        if (self.homeArr.count > 0) {
            
            HomeModel *model = self.homeArr[3];
            [cell setFoodCellModel:model];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    // 嗨购专场
    if (indexPath.section == 6) {
        ShoppingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shopId"];
        if (cell == nil) {
            cell = [[ShoppingCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"shopId"];
            cell.delegate = self;
        }
        NSArray *arr = @[@"shouye_xpfs",@"shouye_ppmz",@"shouye_xbwb",@"shouye_bgjj",@"shouye_kjxp",@"shouye_ydhw",@"shouye_haigou",];
        [cell setShoppingCellImage:arr];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    // 周边畅游
    if (indexPath.section == 7) {
        ThridTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"traveId"];
        if (cell == nil) {
            cell = [[ThridTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"traveId"];
            cell.delegte = self;
            [cell cellStyle:travelCellStyle];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        if (self.homeArr.count > 0) {
            HomeModel *model = self.homeArr[2];
            [cell setThridCellHomeModel:model];
        }
        return cell;
    }
    // 热门招聘
    if (indexPath.section == 8) {
        ThridTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hotJobId"];
        if (cell == nil) {
            cell = [[ThridTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"hotJobId"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.delegte =self;
            [cell cellStyle:hotJobCellStyle];
        }
        if (self.homeArr.count > 0) {
            
            HomeModel *model = self.homeArr[0];
            [cell setThridCellHomeModel:model];
        }
        return cell;
    }
    // 二手置换
    if (indexPath.section == 9) {
        ThridTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"secondId"];
        if (!cell) {
            cell = [[ThridTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"secondId"];
            [cell cellStyle:secondCellStyle];
            cell.delegte = self;
        }
        if (self.homeArr.count > 0) {
            
            HomeModel *model = self.homeArr[1];
            [cell setThridCellHomeModel:model];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    static NSString *fristId = @"fristId";
    FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:fristId];
    if (cell == nil) {
        cell = [[FirstTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:fristId];
        cell.delegate = self;
    }
    NSArray *arr = @[@"shouye_meishi",@"shouye_waimai",@"shouye_binguan",@"shouye_chaoshi",@"shouye_pinche",@"shouye_dianying",@"shouye_xxyl",@"shouye_qbfl"];
    [cell setFirstCellImage:arr];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
#pragma mark - tableView 第一个模块跳转
- (void)pushViewControllerNum:(NSInteger)num
{
    // 美食 页面
    if (num == 1000) {
        CateViewController *cateVC = [[CateViewController alloc]init];
        [self.navigationController pushViewController:cateVC animated:YES];
    }
    // 外卖
    if (num == 1001) {
        TakeOutTableViewController *takeVC = [[TakeOutTableViewController alloc]init];
        [self.navigationController pushViewController:takeVC animated:YES];
    }
    // 宾馆
    if (num == 1002) {
        TheHotelTableViewController *hotelVc = [[TheHotelTableViewController alloc]init];
        [self.navigationController pushViewController:hotelVc animated:YES];
    }
    // 超市
    if (num == 1003) {
        SupermarketViewController *supermarketVC = [[SupermarketViewController alloc]init];
        [self.navigationController pushViewController:supermarketVC animated:YES];
    }
    // 拼车
    if (num == 1004) {
        CarViewController *carVC = [[CarViewController alloc] init];
        [self.navigationController pushViewController:carVC animated:YES];
    }
    // 电影
    if (num == 1005) {
        MovieTableViewController *movieVC = [[MovieTableViewController alloc]init];
        [self.navigationController pushViewController:movieVC animated:YES];
    }
    // 休闲娱乐
    if (num == 1006) {
        GameTableViewController *gameVC = [[GameTableViewController alloc]init];
        [self.navigationController pushViewController:gameVC animated:YES];
    }
    // 全部分类
    if (num == 1007) {
        AllStylViewController *allVc = [[AllStylViewController alloc] init];
        [self.navigationController pushViewController:allVc animated:YES];
    }
    
}
#pragma mark - 同城服务
- (void)SecondPushViewControllerNum:(NSInteger)num
{   // 本地购物
    if (num == 1000) {
        shopViewController *shopVC = [[shopViewController alloc] init];
        [self.navigationController pushViewController:shopVC animated:YES];
    }
    // 生活缴费
    if (num == 1001) {
        priceViewController *priceVC = [[priceViewController alloc] init];
        [self.navigationController pushViewController:priceVC animated:YES];
    }
    // 家政服务
    if (num == 1002) {
        HouseTableViewController *houseVC = [[HouseTableViewController alloc] init];
        [self.navigationController pushViewController:houseVC animated:YES];
    }
    // 二手置换
    if (num == 1003) {
        SecondHandTableViewController *secondVC = [[SecondHandTableViewController alloc]init];
        [self.navigationController pushViewController:secondVC animated:YES];
    }
    // 求职招聘
    if (num == 1004) {
        PleaseJobTableViewController *pleaseVC = [[PleaseJobTableViewController alloc]init];
        [self.navigationController pushViewController:pleaseVC animated:YES];
    }
    // 小广告栏
    if (num == 1005) {
        SmallAdvertisingTableViewController *houseVC = [[SmallAdvertisingTableViewController alloc] init];
        [self.navigationController pushViewController:houseVC animated:YES];
    }
    
}
#pragma mark - 生活服务 || 实事新闻
- (void)ThridPushViewControllerNum:(NSInteger)num
{
#pragma mark - 生活服务
    // 汽车服务
    if (num == 1000) {
        sevCarTableViewController *sevCarVC = [[sevCarTableViewController alloc] init];
        [self.navigationController pushViewController:sevCarVC animated:YES];
    }
    // 同程旅游
    if (num == 1001) {
        TravelTableViewController *travelVC = [[TravelTableViewController alloc] init];
        [self.navigationController pushViewController:travelVC animated:YES];
    }

    // 摄影写真
    if (num == 1002) {
        TakePhotoTableViewController *takePhotoVC = [[TakePhotoTableViewController alloc]init];
        [self.navigationController pushViewController:takePhotoVC animated:YES];
    }
    
    // 婚庆服务
    if (num == 1003) {
        WeddingTableViewController *weddingVC = [[WeddingTableViewController alloc] init];
        [self.navigationController pushViewController:weddingVC animated:YES];
    }
    
    // 学习培训
    if (num == 1004) {
        LearnViewController *learnVc = [[LearnViewController alloc]init];
        [self.navigationController pushViewController:learnVc animated:YES];
    }
    // 宴会服务
    if (num == 1005) {
        FeastTableViewController *feastVC = [[FeastTableViewController alloc] init];
        [self.navigationController pushViewController:feastVC animated:YES];
    }
#pragma mark - 实事新闻
    // 时事新闻
    if (num == 2000 || num == 2001) {
        NewsTableViewController *newsVC = [[NewsTableViewController alloc] init];
        [self.navigationController pushViewController:newsVC animated:YES];
    }
#pragma mard - 周边畅游
    if (num == 3000 || num ==3001 || num == 3002 ) {
        TravelTableViewController *travelVC = [[TravelTableViewController alloc] init];
        [self.navigationController pushViewController:travelVC animated:YES];
    }
    if (num == 4000 || num == 4001) {
        PleaseJobTableViewController *pleaseVC = [[PleaseJobTableViewController alloc]init];
        [self.navigationController pushViewController:pleaseVC animated:YES];
    }
    if (num == 5000 || num == 5001) {
        SecondHandTableViewController *secondVC = [[SecondHandTableViewController alloc]init];
        [self.navigationController pushViewController:secondVC animated:YES];
    }
}
#pragma mark - 美食精选
- (void)foodHomePushDelegateMethod
{
    CateViewController *cateVC = [[CateViewController alloc]init];
    [self.navigationController pushViewController:cateVC animated:YES];
}
#pragma mark - 嗨购专场
- (void)shopingPushDelegateMethod
{
    shopViewController *shopVC = [[shopViewController alloc] init];
    [self.navigationController pushViewController:shopVC animated:YES];
}


@end
