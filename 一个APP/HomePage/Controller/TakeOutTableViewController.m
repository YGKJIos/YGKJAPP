//
//  TakeOutTableViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/25.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "TakeOutTableViewController.h"
#import "TakeOutInformationController.h"
#import "TakeTableViewCell.h"
#import "DOPDropDownMenu.h"


@interface TakeOutTableViewController ()<DOPDropDownMenuDataSource, DOPDropDownMenuDelegate>
@property (nonatomic, strong) NSArray *classifys;
@property (nonatomic, strong) NSArray *cates;
@property (nonatomic, strong) NSArray *movices;
@property (nonatomic, strong) NSArray *hostels;
@property (nonatomic, strong) NSArray *areas;

@property (nonatomic, strong) NSArray *sorts;



@end

@implementation TakeOutTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTableHeaderView];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.title = @"外卖";
    // 数据
    self.classifys = @[@"美食",@"今日新单",@"电影",@"酒店"];
    self.cates = @[@"自助餐",@"快餐",@"火锅",@"日韩料理",@"西餐",@"烧烤小吃"];
    self.movices = @[@"内地剧",@"港台剧",@"英美剧"];
    self.hostels = @[@"经济酒店",@"商务酒店",@"连锁酒店",@"度假酒店",@"公寓酒店"];
    self.areas = @[@"全城",@"芙蓉区",@"雨花区",@"天心区",@"开福区",@"岳麓区"];
    self.sorts = @[@"默认排序",@"离我最近",@"好评优先",@"人气优先",@"最新发布"];
    
    // 添加下拉菜单
    DOPDropDownMenu *menu = [[DOPDropDownMenu alloc] initWithOrigin:CGPointMake(0, 104) andHeight:44];
    
    menu.delegate = self;
    menu.dataSource = self;
    [self.view addSubview:menu];
}
//#pragma mark - MJ刷新
//- (void)MJrefreshLoadData
//{
//    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
//    self.tableView.mj_header.automaticallyChangeAlpha = YES;
//    [header setTitle:@"正在刷新数据中..." forState:MJRefreshStateRefreshing];
//    [header setTitle:@"下拉刷新数据" forState:MJRefreshStateIdle];
//    [header setTitle:@"松开刷新数据" forState:MJRefreshStatePulling];
//    header.lastUpdatedTimeLabel.hidden = YES;
//    self.tableView.mj_header = header;
//    
//    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
//    // 设置文字
//    [footer setTitle:@"上拉加载更多数据" forState:MJRefreshStateIdle];
//    [footer setTitle:@"加载更多数据..." forState:MJRefreshStateRefreshing];
//    [footer setTitle:@"松开加载更多数据" forState:MJRefreshStatePulling];
//    self.tableView.mj_footer = footer;
//    
//}
//
//// 下拉刷新的方法
//- (void)loadNewData{
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.tableView.mj_header endRefreshing];
//        NSString *url = @"meishi/querymeishi1.action";
//        [AFNetWorting getNetWortingWithUrlString:url params:nil controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
//            NSLog(@"responseObject----%@",responseObject);
//            NSArray *arr = responseObject;
//            for (NSDictionary *dic in arr) {
//                MarketModel *model = [[MarketModel alloc] init];
//                [model setValuesForKeysWithDictionary:dic];
//                [self.MarkeArr addObject:model];
//            }
//            [self.tableView reloadData];
//            
//        } failure:^(NSURLSessionDataTask *task, NSError *error) {
//            NSLog(@"error-----%@",error);
//        }];
//        
//        NSLog(@"MJ-下拉刷新");
//        
//    });
//    
//}
//// 上拉加载的方法
//- (void)loadMoreData{
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.tableView.mj_footer endRefreshing];
//        NSLog(@"MJ-上啦加载");
//    });
//}



- (NSInteger)numberOfColumnsInMenu:(DOPDropDownMenu *)menu
{
    return 3;
}

- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column
{
    if (column == 0) {
        return self.classifys.count;
    }else if (column == 1){
        return self.areas.count;
    }else {
        return self.sorts.count;
    }
}

- (NSString *)menu:(DOPDropDownMenu *)menu titleForRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.column == 0) {
        return self.classifys[indexPath.row];
    } else if (indexPath.column == 1){
        return self.areas[indexPath.row];
    } else {
        return self.sorts[indexPath.row];
    }
}

- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfItemsInRow:(NSInteger)row column:(NSInteger)column
{
    if (column == 0) {
        if (row == 0) {
            return self.cates.count;
        } else if (row == 2){
            return self.movices.count;
        } else if (row == 3){
            return self.hostels.count;
        }
    }
    return 0;
}

- (NSString *)menu:(DOPDropDownMenu *)menu titleForItemsInRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.column == 0) {
        if (indexPath.row == 0) {
            return self.cates[indexPath.item];
        } else if (indexPath.row == 2){
            return self.movices[indexPath.item];
        } else if (indexPath.row == 3){
            return self.hostels[indexPath.item];
        }
    }
    return nil;
}

- (void)menu:(DOPDropDownMenu *)menu didSelectRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.item >= 0) {
        NSLog(@"点击了 %ld - %ld - %ld 项目",indexPath.column,indexPath.row,indexPath.item);
    }else {
        NSLog(@"点击了 %ld - %ld 项目",indexPath.column,indexPath.row);
    }
}

- (void)addTableHeaderView
{
    UIView *tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 228)];
    NSArray *arr = @[@"waimai_tu",@"shouye_haigou",@"shouye_meishitou",@"shouye_xinwen"];
    ScrollView *scrollView = [ScrollView CreateScrollViewImages:arr];
    [tableHeaderView addSubview:scrollView];
    NSArray *btnImage = @[@"waimai_meishi",@"waimei_xianhua",@"waimai_dangao",@"waimai_yaopin"];
    NSArray *titles = @[@"美食",@"鲜花",@"蛋糕",@"药品"];
    for (int i = 0; i < 4; i++) {
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        btn.frame = CGRectMake(30+(40+WIDTH/4-40)*i,scrollView.height+ 10, 40, 40);
//        [btn setBackgroundImage:[UIImage imageNamed:btnImage[i]] forState:UIControlStateNormal];
//        [btn addTarget:self action:@selector(clickBtnImage:) forControlEvents:UIControlEventTouchUpInside];
//        [tableHeaderView addSubview:btn];
        ImageAndLabView *view = [ImageAndLabView createViewNib];
        view.frame = CGRectMake(30+(40+WIDTH/4-40)*i,scrollView.height+ 10, 40, 40);
        [view setImages:btnImage[i] names:titles[i]];
        [tableHeaderView addSubview:view];
    }
    
    
    self.tableView.tableHeaderView = tableHeaderView;

}
- (void)clickBtnImage:(UIButton *)btn
{
    NSLog(@"meishi");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *takeOut = @"takeOutId";
    TakeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:takeOut];
    if (cell == nil) {
        cell = [TakeTableViewCell CreateTakeOutCell];
    }
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
    [self.navigationController pushViewController:informationVC animated:YES];
}

@end
