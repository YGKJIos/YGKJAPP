//
//  LearnViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/4.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "LearnViewController.h"
#import "LearnDetailsTableViewController.h" // 学习详情
#import "HeaderCollectionReusableView.h"
#import "LearnCollectionViewCell.h"
#import "LearnModel.h"
@interface LearnViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong)NSMutableArray *MarkeArr;
@property (nonatomic, strong) UICollectionView *collection;

@end

@implementation LearnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"学习培训";
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(165*(WIDTH/375), 185);
    flowLayout.headerReferenceSize = CGSizeMake(WIDTH, 150);
    flowLayout.sectionInset = UIEdgeInsetsMake(20, 15, 20, 15);
    flowLayout.minimumLineSpacing = 10;
    
    self.collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-64) collectionViewLayout:flowLayout];
    self.collection.backgroundColor = [UIColor whiteColor];
    self.collection.delegate = self;
    self.collection.dataSource = self;
    self.collection.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.collection];
    
    UINib *nib = [UINib nibWithNibName:@"LearnCollectionViewCell" bundle:[NSBundle mainBundle]];
    [self.collection registerNib:nib forCellWithReuseIdentifier:@"learnCell"];
    [self.collection registerClass:[HeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headID"];
    self.MarkeArr = [[NSMutableArray alloc] init];
    [self MJrefreshLoadData];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.collection.mj_header beginRefreshing];
    [super viewWillAppear:animated];
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
    
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    // 设置文字
    [footer setTitle:@"上拉加载更多数据" forState:MJRefreshStateIdle];
    [footer setTitle:@"加载更多数据..." forState:MJRefreshStateRefreshing];
    [footer setTitle:@"松开加载更多数据" forState:MJRefreshStatePulling];
    self.collection.mj_footer = footer;
    
}

// 下拉刷新的方法
- (void)loadNewData{
    [self.MarkeArr removeAllObjects];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.collection.mj_header endRefreshing];
        NSString *url = @"peixun/querypeixun1.action";
        [AFNetWorting getNetWortingWithUrlString:url params:nil controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
            NSArray *arr = responseObject;
            for (NSDictionary *dic in arr) {
                LearnModel *model = [[LearnModel alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                [self.MarkeArr addObject:model];
            }
            [self.collection reloadData];
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"error-----%@",error);
        }];
        
    });
    
}
// 上拉加载的方法
- (void)loadMoreData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.collection.mj_footer endRefreshing];
    });
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.MarkeArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LearnCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"learnCell" forIndexPath:indexPath];
    [cell LearnModel:self.MarkeArr[indexPath.row]];

    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    HeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headID" forIndexPath:indexPath];
    return headerView;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    LearnDetailsTableViewController *learnDetailVC = [[LearnDetailsTableViewController alloc]init];
    learnDetailVC.navigationItem.title = @"学习详情";
    learnDetailVC.shopID = [self.MarkeArr[indexPath.row] shangjiaId];
    [self.navigationController pushViewController:learnDetailVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
