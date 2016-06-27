//
//  CateViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/23.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "CateViewController.h"
#import "SDCycleScrollView.h"
#import "DropdownMenu.h"
#import "MarketCell.h"

@interface CateViewController ()<SDCycleScrollViewDelegate,dropdownDelegate>


@property (nonatomic, strong)SDCycleScrollView *scrollView;
@property (nonatomic, strong)UIView *bgView;// tableViewHeaderView

@end

@implementation CateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *leftItem = [UIBarButtonItem itemWithTarget:self action:@selector(navigationLeftBtnAction) image:@"meishi_fanghui" highImage:@"meishi_fanghui"];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem = [UIBarButtonItem itemWithTarget:self action:@selector(navigationRigthBtnAction) image:@"meishi_sousuo" highImage:@"meishi_sousuo"];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    self.bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 370)];
    
    [self addHeaderView];
    [self addMenuBtn];
    self.tableView.tableHeaderView = self.bgView;
}
- (void)navigationRigthBtnAction
{
    NSLog(@"navigationRigthBtnAction");
}
- (void)navigationLeftBtnAction
{
    [self.navigationController popViewControllerAnimated:YES];
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
        
        // 轮播图上的文字
        //    scrollView.titlesGroup = titles;
        // 分页控件图标
        self.scrollView.dotColor = [UIColor cyanColor];
        
        // 循环时间间隔,默认2.0s
        self.scrollView.autoScrollTimeInterval = 2.0;
        //    self.tableView.tableHeaderView = self.scrollView;
    [self.bgView addSubview:self.scrollView];
}
- (void)addMenuBtn
{
    NSArray *arr = @[@"meishi_zizhu",@"meishi_huoguo",@"meishi_kuaican",@"meishi_xican",@"meishi_zhongcan",@"meishi_shaokao",@"meishi_dangao",@"meishi_quanbu"];
    
    NSArray *titles = @[@"自助餐",@"火锅",@"快餐小吃",@"西餐",@"中餐",@"烤肉/烧烤",@"蛋糕",@"全部分类",];
    
    int num = 0;
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 4; j++) {

            ImageAndLabView *view = [ImageAndLabView createViewNib];
            [view setImages:arr[num] names:titles[num]];
            num++;
            view.frame = CGRectMake(35+j*(40+50), 170+i*(67+20), 40, 60);
            [self.bgView addSubview:view];
        }
    }
//    NSArray *titleArray = @[@"全部分类",@"附近",@"智能"];
//    DropdownMenu *dropdown = [[DropdownMenu alloc] initDropdownWithButtonTitles:titleArray andLeftListArray:nil andRightListArray:nil];
////    dropdown.view.frame = CGRectMake(0, 200, WIDTH, 40);
//    dropdown.delegate = self;   //此句的代理方法可返回选中下标值
//    [self.bgView addSubview:dropdown.view];
    
}
// 下拉菜单
- (void)dropdownSelectedButtonIndex:(NSString *)index LeftIndex:(NSString *)left RightIndex:(NSString *)right {
    NSLog(@"%s : You choice button %@, left %@ and right %@", __FUNCTION__, index, left, right);
}

//轮播图 点击代理方法
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"%ld",index);
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
    static NSString *cateCell = @"cateID";
    MarketCell *cell = [tableView dequeueReusableCellWithIdentifier:cateCell];
    if (cell == nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"MarketCell" owner:nil options:nil].lastObject;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 108;
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 0)];
//    view.backgroundColor = [UIColor redColor];
//    NSArray *titleArray = @[@"全部分类",@"附近",@"智能"];
//    DropdownMenu *dropdown = [[DropdownMenu alloc] initDropdownWithButtonTitles:titleArray andLeftListArray:nil andRightListArray:nil];
//    dropdown.delegate = self;   //此句的代理方法可返回选中下标值
//    [view addSubview:dropdown.view];
//    return view;
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 40;
//}


@end
