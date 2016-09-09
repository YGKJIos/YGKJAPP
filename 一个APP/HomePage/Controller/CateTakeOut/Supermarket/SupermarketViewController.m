//
//  SupermarketViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/27.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "SupermarketViewController.h"
#import "SupermarketCollectionViewCell.h"
#import "HeaderCollectionReusableView.h"
#import "SearchView.h"
#import "ZGP_SuperMarketModel.h"
#import "MerchantInformationModel.h"
#import "TakeOutInformationController.h"
@interface SupermarketViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong)UIButton *searchBtn;
@property (nonatomic, strong)UICollectionView *collection;
@property (nonatomic, strong)NSMutableArray *superMarketArr;
@end

@implementation SupermarketViewController

- (void)viewWillAppear:(BOOL)animated
{
    [self.collection.mj_header beginRefreshing];
    [super viewWillAppear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"超市";
    self.superMarketArr = [NSMutableArray array];
//    [self setNavigationStyle];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(180*(WIDTH/375), 130);
    flowLayout.headerReferenceSize = CGSizeMake(WIDTH, 160);
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 3, 8, 3);
    flowLayout.minimumInteritemSpacing = 8;
    flowLayout.minimumLineSpacing = 8;
    
    self.collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-64) collectionViewLayout:flowLayout];
    self.collection.backgroundColor = BGcolor(226, 226, 226);
    self.collection.delegate = self;
    self.collection.dataSource = self;
    self.collection.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.collection];
    
    UINib *nib = [UINib nibWithNibName:@"SupermarketCollectionViewCell" bundle:[NSBundle mainBundle]];
    [self.collection registerNib:nib forCellWithReuseIdentifier:@"reportFilterCell"];
    [self.collection registerClass:[HeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headID"];
    // 刷新
    [self MJrefreshLoadData];
}
#pragma mark - MJ刷新
- (void)MJrefreshLoadData
{
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    self.collection.mj_header.automaticallyChangeAlpha = YES;
    [header setTitle:@"正在刷新数据中..." forState:MJRefreshStateRefreshing];
    [header setTitle:@"下拉刷新数据" forState:MJRefreshStateIdle];
    [header setTitle:@"松开刷新数据" forState:MJRefreshStatePulling];
    header.lastUpdatedTimeLabel.hidden = YES;
    self.collection.mj_header = header;
    
}
// 下拉刷新的方法
- (void)loadNewData{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.collection.mj_header endRefreshing];
        NSString *url = @"chaoshi/querychaoshi.action";
//        [AFNetWorting getNetWortingWithUrlString:url params:nil controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
//            NSArray *arr = responseObject;
//            if (arr.count == 0) {
//                ZGPplaceholderImageView *placeholderImage = [[ZGPplaceholderImageView alloc] initWithFrame:self.view.frame];
//                [self.view addSubview:placeholderImage];
//            }else{
//                for (NSDictionary *dic in arr) {
//                    ZGP_SuperMarketModel *model = [[ZGP_SuperMarketModel alloc] init];
//                    [model setValuesForKeysWithDictionary:dic];
//                    [self.superMarketArr addObject:model];
//                }
//                [self.collection reloadData];
//            }
//        } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        }];
//    });
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setObject:[[UserInfo shareAccount].accountDict objectForKey:@"jingweidu"] forKey:@"userWeizhi"];
        [AFNetWorting postNetWortingWithUrlString:url params:dic controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
            [self.superMarketArr removeAllObjects];
            NSArray *arr = responseObject;
            if (arr.count == 0) {
                ZGPplaceholderImageView *placeholderImage = [[ZGPplaceholderImageView alloc] initWithFrame:self.view.frame];
                [self.view addSubview:placeholderImage];
            }else{
                for (NSDictionary *dic in arr) {
                    ZGP_SuperMarketModel *model = [[ZGP_SuperMarketModel alloc] init];
                                        [model setValuesForKeysWithDictionary:dic];
                                        [self.superMarketArr addObject:model];
                    
                }
                [self.collection reloadData];
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
        }];
    });

}

- (void)setNavigationStyle
{
    /* 设置 navigation 样式*/
    UIBarButtonItem *rightItme = [UIBarButtonItem itemWithTarget:self action:@selector(rightItmeAction) image:@"chaoshi_gouwuche" highImage:@"chaoshi_ggouwuche"];
    self.navigationItem.rightBarButtonItem = rightItme;
    
    self.searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.searchBtn.width = 205;
    self.searchBtn.height = 26;
    [self.searchBtn addTarget:self action:@selector(searchClickAction) forControlEvents:UIControlEventTouchUpInside];
    [self.searchBtn setBackgroundImage:[UIImage imageNamed:@"chaoshi_sousuo"] forState:UIControlStateNormal];
    self.searchBtn.adjustsImageWhenHighlighted = NO;
    self.navigationItem.titleView = self.searchBtn;
}
// navigation 购物车
- (void)rightItmeAction
{
//    NSLog(@"购物车");
}
// 超市搜索
- (void)searchClickAction
{
//    NSLog(@"超市搜索");
}
//
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _superMarketArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SupermarketCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"reportFilterCell" forIndexPath:indexPath];
    
    [cell ZGP_SuperMarketModel:_superMarketArr[indexPath.row]];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    HeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headID" forIndexPath:indexPath];
    return headerView;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    TakeOutInformationController *informationVC = [[TakeOutInformationController alloc]init];
    if (self.superMarketArr.count > 0) {
        informationVC.navigationItem.title = [self.superMarketArr[indexPath.row] shangjiaName];
        informationVC.model = self.superMarketArr[indexPath.row];
        // 单例配送费
        SingTotal.peisongMoney = [self.superMarketArr[indexPath.row] peisongfei].floatValue;
    }
    [self.navigationController pushViewController:informationVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
