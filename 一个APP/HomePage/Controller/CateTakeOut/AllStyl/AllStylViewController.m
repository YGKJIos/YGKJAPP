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
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *arr;
// 美食
@property (nonatomic, retain) NSMutableArray *arr1;
@property (nonatomic, retain) NSMutableArray *imageArr;
// 摄影
@property (nonatomic, retain) NSMutableArray *photoArr;
@property (nonatomic, retain) NSMutableArray *photoImageArr;

@property (nonatomic, strong)UICollectionView *collectionView;
@property (nonatomic, strong)AllStylCollectionReusableView *ReusableView;
@property (nonatomic, assign)BOOL result;
@end

@implementation AllStylViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    self.arr = [NSMutableArray arrayWithObjects:@"美食", @"摄影写真", @"本地购物", @"宴会", @"周边游", @"休闲娱乐", @"酒店宾馆", @"学习培训", @"生活服务", @"其他", nil];
//    // 美食
    self.arr1 = [NSMutableArray arrayWithObjects:@"火锅", @"烧烤烤肉", @"西餐", @"日本料理", @"韩餐", @"中餐", @"蛋糕甜点", @"自助餐", @"小吃", @"聚会宴请", @"冷饮", @"咖啡酒吧",  nil];
    self.imageArr = [NSMutableArray arrayWithObjects:@"meishi_06", @"meishi_08", @"meishi_10", @"meishi_15", @"meishi_16", @"meishi_17", @"meishi_21" , @"meishi_22", @"meishi_23", @"meishi_27", @"meishi_29", @"meishi_30", nil];
    
    self.result = YES;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"全部分类";
    [self creatLeftTableView];
    [self creatRightCollecTionView];
}


// 创建左边的菜单
- (void)creatLeftTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 100, self.view.size.height) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
    
   
    
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
    if (indexPath.row == 0) {
        
        self.arr1 = [NSMutableArray arrayWithObjects:@"火锅", @"烧烤烤肉", @"西餐", @"日本料理", @"韩餐", @"中餐", @"蛋糕甜点", @"自助餐", @"小吃", @"聚会宴请", @"冷饮", @"咖啡酒吧",  nil];
        self.imageArr = [NSMutableArray arrayWithObjects:@"meishi_06", @"meishi_08", @"meishi_10", @"meishi_15", @"meishi_16", @"meishi_17", @"meishi_21" , @"meishi_22", @"meishi_23", @"meishi_27", @"meishi_29", @"meishi_30", nil];
        self.ReusableView.headImage.image = [UIImage imageNamed:@"meishiheaderview"];
    }
    
    if (indexPath.row == 1) {
        self.arr1 = [NSMutableArray arrayWithObjects:@"亲子摄影", @"儿童摄影", @"个人写真", @"婚纱摄影", @"孕妇写真", nil];
        self.imageArr = [NSMutableArray arrayWithObjects:@"sheyingxiezhen_06", @"sheyingxiezhen_08", @"sheyingxiezhen_10", @"sheyingxiezhen_15", @"sheyingxiezhen_16", nil];
        self.ReusableView.headImage.image = [UIImage imageNamed:@"sheyingheadview"];
    }
    if (indexPath.row == 2) {
        self.arr1 = [NSMutableArray arrayWithObjects:@"珠宝", @"女装", @"男装", @"鞋靴", @"箱包饰品", @"电子数码", nil];
        self.imageArr = [NSMutableArray arrayWithObjects:@"bendigouwu_06", @"bendigouwu_08", @"bendigouwu_10", @"bendigouwu_15", @"bendigouwu_16", @"bendigouwu_17", nil];
        self.ReusableView.headImage.image = [UIImage imageNamed:@"bendigouwuheadview"];
    }
    if (indexPath.row == 3) {
        self.arr1 = [NSMutableArray arrayWithObjects:@"聚会宴会", @"婚礼宴会", @"活动宴会", nil];
        self.imageArr = [NSMutableArray arrayWithObjects:@"yanhui_06", @"yanhui_08", @"yanhui_10", nil];
        self.ReusableView.headImage.image = [UIImage imageNamed:@"yanhuiheadview"];
    }
    if (indexPath.row == 4) {
        self.arr1 = [NSMutableArray arrayWithObjects:@"主题公园", @"动植物园", @"真人CS", @"短途游", @"展览馆", @"滑雪", @"水上乐园", nil];
        self.imageArr = [NSMutableArray arrayWithObjects:@"zhoubianyou_11", @"zhoubianyou_07", @"zhoubianyou_09", @"zhoubianyou_16", @"zhoubianyou_17", @"zhoubianyou_18", @"zhoubianyou_22", nil];
        self.ReusableView.headImage.image = [UIImage imageNamed:@"zhoubianyouheadview"];
    }
    if (indexPath.row == 5) {
        self.arr1 = [NSMutableArray arrayWithObjects:@"运动健身", @"按摩", @"足疗", @"淋浴汗蒸", @"KTV", @"酒吧", @"电影", @"桌球", @"其他娱乐", nil];
        self.imageArr = [NSMutableArray arrayWithObjects:@"xiuxianyule_06", @"xiuxianyule_08", @"xiuxianyule_10", @"xiuxianyule_15", @"xiuxianyule_16", @"xiuxianyule_17", @"xiuxianyule_21", @"xiuxianyule_22", @"xiuxianyule_23", nil];
        self.ReusableView.headImage.image = [UIImage imageNamed:@"xiuxianyuleheadview"];
    }
    if (indexPath.row == 6) {
        self.arr1 = [NSMutableArray arrayWithObjects:@"青年宾馆", @"主题宾馆", @"公寓宾馆", nil];
        self.imageArr = [NSMutableArray arrayWithObjects:@"jiudianbingguan_06", @"jiudianbingguan_08", @"jiudianbingguan_10", nil];
        self.ReusableView.headImage.image = [UIImage imageNamed:@"jiudianbinguanheadview"];
    }
    if (indexPath.row == 7) {
        self.arr1 = [NSMutableArray arrayWithObjects:@"升学辅导", @"兴趣培训", @"语言培训", @"驾校培训", nil];
        self.imageArr = [NSMutableArray arrayWithObjects:@"xuexipeixun_06", @"xuexipeixun_08", @"xuexipeixun_10", @"xuexipeixun_12", nil];
        self.ReusableView.headImage.image = [UIImage imageNamed:@"xuexipeixunheadview"];
    }
    if (indexPath.row == 8) {
        self.arr1 = [NSMutableArray arrayWithObjects:@"交费服务", @"家政服务", @"超市服务",nil];
        self.imageArr = [NSMutableArray arrayWithObjects:@"shenghuofuwu_06", @"shenghuofuwu_08", @"shenghuofuwu_10", nil];
        self.ReusableView.headImage.image = [UIImage imageNamed:@"shenghuofuwuheadview"];
    }
    if (indexPath.row == 9) {
        self.arr1 = [NSMutableArray arrayWithObjects:@"家装", @"汽车服务", @"电影", @"婚庆", @"拼车", @"招聘", @"新闻", nil];
        self.imageArr = [NSMutableArray arrayWithObjects:@"qita_06", @"qita_08", @"qita_10", @"qita_15", @"qita_16", @"qita_17", @"qita_21", nil];
        self.ReusableView.headImage.image = [UIImage imageNamed:@"qitaheadview"];
    }
    [self.collectionView reloadData];
    NSLog(@"点毛线");
}



- (void)creatRightCollecTionView
{
    // 创建官方的瀑布流
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    // 设置item尺寸
    flowLayout.itemSize = CGSizeMake(75, 60);
    
    flowLayout.minimumLineSpacing = 60;
    
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 130, 20);
    // headerView高度
    flowLayout.headerReferenceSize = CGSizeMake(0, 60);
    
    // 创建collectionView
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(100, 0, WIDTH - 100, self.view.size.height) collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.collectionView];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;

    
    // cell注册
    [self.collectionView registerClass:[AllStylCollectionViewCell class] forCellWithReuseIdentifier:@"collectionCellID"];
    
    
    // headerView注册
    [self.collectionView registerClass:[AllStylCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
  
}

// 头重用池
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    self.ReusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headerView" forIndexPath:indexPath];
    
    self.ReusableView.backgroundColor = [UIColor whiteColor];
    // 第一次进来的时候 显示 collection 图片
    if (self.result == YES) {
        self.ReusableView.headImage.image = [UIImage imageNamed:@"meishiheaderview"];
        self.result = NO;
    }
    return self.ReusableView;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.arr1.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AllStylCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCellID" forIndexPath:indexPath];
    
    
    [cell setImages:self.imageArr[indexPath.row] titles:self.arr1[indexPath.row]];
    
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
