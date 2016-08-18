//
//  PayMentTableViewController.m
//  一个APP
//
//  Created by 远古科技 on 16/8/11.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "PayMentTableViewController.h"
#import "PaymentTableViewCell.h"
#import "AlipayTableViewCell.h"
@interface PayMentTableViewController ()<SelectBtnDelegate>
@property (nonatomic, assign)BOOL select;
@end


@implementation PayMentTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"支付订单";
    self.tableView.backgroundColor = BGcolor(247, 247, 247);
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 200)];
    footerView.backgroundColor = BGcolor(247, 247, 247);
    self.tableView.tableFooterView = footerView;
    UIButton *sureBtn = [[UIButton alloc] init];
    sureBtn.frame = CGRectMake(60, 40, WIDTH - 120, 60);
    [sureBtn setImage:[UIImage imageNamed:@"tijiaodingdan_querendingdan"] forState:UIControlStateNormal];
    [sureBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:sureBtn];
    self.select = YES;
}

- (void)click:(UIButton *)btn
{
    NSLog(@"11111111111");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuse = @"reuse";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (indexPath.section == 0) {
        cell = [PaymentTableViewCell createCell];
    }
    if (indexPath.section == 1) {
        AlipayTableViewCell *payCell = [AlipayTableViewCell createCell];
        [payCell.selectBtn addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        payCell.delegate = self;
        cell = payCell;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}


// selectBtn点击方法
- (void)action:(UIButton *)btn
{
    if (self.select == YES) {
        [btn setImage:[UIImage imageNamed:@"zhifudingdan_14"] forState:UIControlStateNormal];
    }
    if (self.select == NO) {
        [btn setImage:[UIImage imageNamed:@"zhifudingdan_09"] forState:UIControlStateNormal];
    }
    self.select = !self.select;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}

@end
