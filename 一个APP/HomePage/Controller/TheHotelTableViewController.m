//
//  TheHotelTableViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/25.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "TheHotelTableViewController.h"
#import "TheHotelTableViewCell.h"

@interface TheHotelTableViewController ()

@property (nonatomic, strong)UILabel *lineLab;

@end

@implementation TheHotelTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTableHeaderView];
}

- (void)addTableHeaderView
{

    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 190)];
    headerView.backgroundColor = [UIColor redColor];
    
    // 日全房
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self createBtn:leftBtn title:@"全日房" x:0];
    [leftBtn addTarget:self action:@selector(dayHouseClick) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:leftBtn];
    // 钟点房
    UIButton *rigthBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self createBtn:rigthBtn title:@"钟点房" x:WIDTH/2];
    
    [rigthBtn addTarget:self action:@selector(hourHouseClick) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:rigthBtn];
    // 滑动的线
    self.lineLab = [[UILabel alloc]init];
    self.lineLab.frame = CGRectMake(0, 38, WIDTH/2, 2);
    self.lineLab.backgroundColor = BGcolor(83, 198, 24);
    [headerView addSubview:self.lineLab];
    
    NSArray *arr = @[@"binguandatu_tus",@"waimai_tu",@"shouye_haigou",@"shouye_meishitou"];
    ScrollView *scroll = [ScrollView CreateScrollViewImages:arr];
    scroll.frame = CGRectMake(0, leftBtn.height, WIDTH, 150);
    [headerView addSubview:scroll];
    
    self.tableView.tableHeaderView = headerView;
}

- (void)dayHouseClick
{
    [UIView animateWithDuration:0.15 animations:^{
        self.lineLab.frame = CGRectMake(0, 38, WIDTH/2, 2);
    }];

}
- (void)hourHouseClick
{
    [UIView animateWithDuration:0.2 animations:^{
        self.lineLab.frame = CGRectMake(WIDTH/2, 38, WIDTH/2, 2);
    }];

}

- (void)createBtn:(UIButton *)btn title:(NSString *)title x:(CGFloat)x
{
    btn.frame = CGRectMake(x, 0, WIDTH/2, 40);
    btn.backgroundColor = BGcolor(239, 239, 239);
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:17];
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *hotelID = @"hotelID";
    TheHotelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:hotelID];
    if (cell == nil) {
        cell = [TheHotelTableViewCell createTheHotelCell];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 107;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
