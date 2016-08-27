//
//  shopViewController.m
//  一个APP
//
//  Created by 远古科技 on 16/7/16.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "shopViewController.h"
#import "shopCollectionViewCell.h"
#import "HeaderCollectionReusableView.h"
#import "detailTableViewController.h"
#import "ShopServeModel.h"
#import "MerchantInformationModel.h"
#import "AFNetWorting.h"

@interface shopViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collection;
@property (nonatomic, strong)NSMutableArray *MarkeArr;
@end

@implementation shopViewController

-(NSMutableArray *)MarkeArr
{
    if (!_MarkeArr) {
        self.MarkeArr = [[NSMutableArray alloc]init];
    }
    return _MarkeArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"本地购物";
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(165*(WIDTH/375), 256*HEIGHT/667);
    flowLayout.headerReferenceSize = CGSizeMake(WIDTH, 150);
    flowLayout.sectionInset = UIEdgeInsetsMake(20, 15, 20, 15);
    flowLayout.minimumLineSpacing = 10;
    
    self.collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-64) collectionViewLayout:flowLayout];
    self.collection.backgroundColor = [UIColor whiteColor];
    self.collection.delegate = self;
    self.collection.dataSource = self;
    self.collection.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:self.collection];
    
    UINib *nib = [UINib nibWithNibName:@"shopCollectionViewCell" bundle:[NSBundle mainBundle]];
    [self.collection registerNib:nib forCellWithReuseIdentifier:@"shopCell"];
    [self.collection registerClass:[HeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headID"];
    
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
    
}
// 下拉刷新的方法
- (void)loadNewData{
    [self.MarkeArr removeAllObjects];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.collection.mj_header endRefreshing];
        NSString *url = @"sheying/querysheying1.action";
        [AFNetWorting getNetWortingWithUrlString:url params:nil controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
            NSLog(@"responseObject - %@" , responseObject);
            NSArray *arr = responseObject;
            if (arr.count == 0) {
                ZGPplaceholderImageView *placeholderImage = [[ZGPplaceholderImageView alloc] initWithFrame:self.view.frame];
                [self.view addSubview:placeholderImage];
            }else{
                for (NSDictionary *dic in arr) {
                    MerchantInformationModel *model = [[MerchantInformationModel alloc] init];
                    [model setValuesForKeysWithDictionary:dic];
                    [self.MarkeArr addObject:model];
                }
                [self.collection reloadData];
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
        }];
        
    });
}

#pragma mark - collection数据源代理

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.MarkeArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    shopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"shopCell" forIndexPath:indexPath];
    [cell setShopCollectionModel:self.MarkeArr[indexPath.row]];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    HeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headID" forIndexPath:indexPath];
    return headerView;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    detailTableViewController *detailVC = [[detailTableViewController alloc] init];
    detailVC.model = self.MarkeArr[indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
