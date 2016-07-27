//
//  FeastTableViewController.m
//  一个APP
//
//  Created by 远古科技 on 16/7/4.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "FeastTableViewController.h"
#import "FeastTableViewCell.h"
#import "banquetDetailTableViewController.h"
@interface FeastTableViewController ()

@end

@implementation FeastTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTableHeaderView];
    
}



- (void)addTableHeaderView
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 150)];
    headerView.backgroundColor = [UIColor orangeColor];
    
    NSArray *arr = @[@"xinwen",@"shouye_haigou",@"shouye_meishitou",@"shouye_xinwen"];
    ScrollView *scroll = [ScrollView CreateScrollViewImages:arr];
    scroll.frame = CGRectMake(0, 0, WIDTH, 150);
    [headerView addSubview:scroll];
    
    self.tableView.tableHeaderView = headerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 12;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   static NSString *str = @"reuse";
    FeastTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [FeastTableViewCell creactFeastCell];
    }
    
       return cell;
}


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    banquetDetailTableViewController *detailVC = [[banquetDetailTableViewController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
