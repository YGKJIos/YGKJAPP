//
//  DiscoverViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/6.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "DiscoverViewController.h"

@interface DiscoverViewController ()<UITableViewDataSource , UITableViewDelegate>
// 功能数组
@property (nonatomic, strong)NSMutableArray *functionArr;

@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)addTabelView
{
    UITableView *tabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT -113) style:UITableViewStylePlain];
    tabelView.delegate = self;
    tabelView.dataSource = self;
    [self.view addSubview:tabelView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *discoverID = @"discoverID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:discoverID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:discoverID];
    }
    
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
