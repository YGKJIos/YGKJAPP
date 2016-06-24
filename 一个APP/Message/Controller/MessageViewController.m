//
//  MessageViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/6.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageTableViewCell.h"
#import "SearchView.h"
#import "MessageModel.h"

@interface MessageViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)UITableView *tableView;

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTableView];
    self.navigationItem.rightBarButtonItem = nil;
}

- (void)addSearchView{
    SearchView *searchView = [[SearchView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 70)];
    [searchView setPlaceholderText:@"搜索"];
    self.tableView.tableHeaderView = searchView;
}

- (void)addTableView
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, HEIGHT-113) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    _tableView = tableView;
    [self addSearchView];
    [self.view addSubview:tableView];
}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 65;
//}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *messageID = @"messageID";
    MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:messageID];
    if (cell == nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"MessageTableViewCell" owner:nil options:nil].lastObject;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
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
