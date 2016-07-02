//
//  AllStylViewController.m
//  一个APP
//
//  Created by 远古科技 on 16/6/29.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "AllStylViewController.h"
#import "AllStylCollectionReusableView.h" // headerView设置
#import "AllStylCollectionViewCell.h" // 自定义cell




@interface AllStylViewController ()<UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource>
@property(nonatomic, retain) NSMutableArray *arr;

@property (nonatomic, retain) NSMutableArray *arr1;

@end

@implementation AllStylViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    self.arr = [NSMutableArray arrayWithObjects:@"美食", @"摄影写真", @"本地购物", @"宴会", @"周边游", @"休闲娱乐", @"酒店宾馆", @"学习培训", @"生活服务", @"其他", nil];
    
    self.arr1 = [NSMutableArray arrayWithObjects:@"火锅", @"烧烤烤肉", @"西餐", @"日本料理", @"韩餐", @"中餐", @"蛋糕甜点", @"自助餐", @"小吃", @"聚会宴请", @"冷饮", @"咖啡酒吧", @"十大回家", @"大大", @"是我打完",@"个人负担", @"二测完成", @"而反侧", @"管发放", nil];
    
    
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatLeftTableView];
    [self creatRightCollecTionView];
    
    
}


// 创建左边的菜单
- (void)creatLeftTableView
{
    UITableView *leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 100, self.view.size.height) style:UITableViewStylePlain];
    leftTableView.backgroundColor = [UIColor whiteColor];
    
    
    leftTableView.dataSource = self;
    leftTableView.delegate = self;
    
    [self.view addSubview:leftTableView];
    
   
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str = @"reuse";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:str];
    }
    
    cell.textLabel.text = self.arr[indexPath.row];
    
    return cell;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

// leftTableView点击方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点毛线");
}



- (void)creatRightCollecTionView
{
    // 创建官方的瀑布流
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    // 设置item尺寸
    flowLayout.itemSize = CGSizeMake(88, 60);
    
    flowLayout.minimumLineSpacing = 70;
    
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 130, 20);
    // headerView高度
    flowLayout.headerReferenceSize = CGSizeMake(0, 60);
    
    // 创建collectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(100, 0, WIDTH - 100, self.view.size.height) collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:collectionView];
    
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"reuse"];
    
    // cell注册
    [collectionView registerClass:[AllStylCollectionViewCell class] forCellWithReuseIdentifier:@"reuse"];
    
    
    // headerView注册
    [collectionView registerClass:[AllStylCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
    
    
    
}

// 头重用池
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    AllStylCollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headerView" forIndexPath:indexPath];
    view.backgroundColor = [UIColor whiteColor];
    
    return view;
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.arr1.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AllStylCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"reuse" forIndexPath:indexPath];
    
    cell.foodImage.backgroundColor = [UIColor orangeColor];
    cell.nanmeLabel.backgroundColor = [UIColor whiteColor];
    cell.nanmeLabel.textAlignment = NSTextAlignmentCenter;
    [cell setImages:nil titles:self.arr1[indexPath.row]];

    cell.foodImage.image = [UIImage imageNamed:@"qbfl_ms_hg"];
    
    return cell;
    
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
