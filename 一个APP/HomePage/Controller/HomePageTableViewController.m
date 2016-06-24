//
//  HomePageTableViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/17.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "HomePageTableViewController.h"
#import "CateViewController.h" // 美食controller
#import "SDCycleScrollView.h"  //轮播图
#import "HomeTableViewCell.h"
#import "TableViewHeader.h"  //table section 视图
#import "FirstTableViewCell.h"
#import "SecondTableViewCell.h"
#import "ThridTableViewCell.h"
#import "FoodHomeCell.h"
#import "ShoppingCell.h"

@interface HomePageTableViewController ()<SDCycleScrollViewDelegate,pushViewControllerDelegate>

@property (nonatomic, strong)SDCycleScrollView *scrollView;

@end

@implementation HomePageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setShowsHorizontalScrollIndicator:NO];
    [self.tableView setShowsVerticalScrollIndicator:NO];
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
//    NSLog(@"w === %f,h === %f",WIDTH,HEIGHT);
    
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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
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
    } if (section == 3) {
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
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 同城服务
    if (indexPath.section == 2) {
        SecondTableViewCell *cell = [[SecondTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        NSArray *arr = @[@"shouye_bdgw",@"shouye_shjf",@"shouye_jzfw",@"shouye_essc",@"shouye_zpqz",@"shouye_xggl"];
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
        }
        NSArray *arr = @[@"shouye_qcfw",@"shouye_tcly",@"shouye_syxz",@"shouye_hqff",@"shouye_xxpx",@"shouye_yhfw",@"shouye_xinwen"];
        NSArray *titles = @[@"",@"",@"",@"",@"",@""];
        [cell setThridCellImage:arr titles:titles];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    // 时事新闻
    if (indexPath.section == 4) {
        ThridTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fourthID"];
        if (!cell) {
            cell = [[ThridTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"fourthID"];
            [cell cellStyle:newCellStyle];
        }
        NSArray *arr = @[@"shouye_xwbt",@"shouye_xwbt",@"shouye_meishitou"];
        NSArray *titles = @[@"新闻标题",@"新闻标题"];
        [cell setThridCellImage:arr titles:titles];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    // 美食精选
    if (indexPath.section == 5) {
        FoodHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"foodId"];
        if (!cell) {
            cell = [[FoodHomeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"foodId"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if (indexPath.section == 6) {
        ShoppingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shopId"];
        if (cell == nil) {
            cell = [[ShoppingCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"shopId"];
        }
        NSArray *arr = @[@"shouye_xpfs",@"shouye_ppmz",@"shouye_xbwb",@"shouye_bgjj",@"shouye_kjxp",@"shouye_ydhw",@"shouye_haigou",];
        [cell setShoppingCellImage:arr];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if (indexPath.section == 7) {
        ThridTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"traveId"];
        if (cell == nil) {
            cell = [[ThridTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"traveId"];
            [cell cellStyle:travelCellStyle];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cell;
    }
    // 热门招聘
    if (indexPath.section == 8) {
        ThridTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hotJobId"];
        if (cell == nil) {
            cell = [[ThridTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"hotJobId"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell cellStyle:hotJobCellStyle];
        }
        
        return cell;
    }
    if (indexPath.section == 9) {
        ThridTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"secondId"];
        if (!cell) {
            cell = [[ThridTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"secondId"];
            [cell cellStyle:secondCellStyle];
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
- (void)pushViewController
{
    CateViewController *cateVC = [[CateViewController alloc]init];
    [self.navigationController pushViewController:cateVC animated:YES];
}



@end
