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

@interface SupermarketViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong)UIButton *searchBtn;

@end

@implementation SupermarketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationStyle];
  
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(180*(WIDTH/375), 150);
    flowLayout.headerReferenceSize = CGSizeMake(WIDTH, 160);
    flowLayout.sectionInset = UIEdgeInsetsMake(8, 3, 8, 3);
    flowLayout.minimumInteritemSpacing = 8;
    flowLayout.minimumLineSpacing = 8;
    
    UICollectionView *collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-64) collectionViewLayout:flowLayout];
    collection.backgroundColor = BGcolor(226, 226, 226);
    collection.delegate = self;
    collection.dataSource = self;
    collection.showsVerticalScrollIndicator = NO;
    [self.view addSubview:collection];
    
    UINib *nib = [UINib nibWithNibName:@"SupermarketCollectionViewCell" bundle:[NSBundle mainBundle]];
    [collection registerNib:nib forCellWithReuseIdentifier:@"reportFilterCell"];
    [collection registerClass:[HeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headID"];
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
    NSLog(@"购物车");
}
// 超市搜索
- (void)searchClickAction
{
    NSLog(@"超市搜索");
}
//
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SupermarketCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"reportFilterCell" forIndexPath:indexPath];
    
    cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"reportFilterCell" forIndexPath:indexPath];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    HeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headID" forIndexPath:indexPath];
    return headerView;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"row = %ld, section= %ld",indexPath.row,indexPath.section);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
