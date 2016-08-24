//
//  TypeTakeOutTableViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/16.
//  Copyright © 2016年 llb. All rights reserved.
//

// 美食、 鲜花、蛋糕、药品 跳转的页面
#import "TypeTakeOutTableViewController.h"
#import "TakeOutInformationController.h"
#import "MerchantInformationModel.h"
#import "TakeTableViewCell.h"

@interface TypeTakeOutTableViewController ()
@property (nonatomic, strong)NSMutableArray *takeOutArr;
@property (nonatomic, strong) NSMutableArray *fenleiArr;
@end

@implementation TypeTakeOutTableViewController

-(NSMutableArray *)takeOutArr
{
    if (!_takeOutArr) {
        self.takeOutArr = [[NSMutableArray alloc]init];
    }
    return _takeOutArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fenleiArr = [NSMutableArray array];
    // 数据请求
    [self loadNewData];
}
// 下拉刷新的方法
- (void)loadNewData{
    [self.takeOutArr removeAllObjects];
    NSString *url = @"waimai/querywaimai1.action";
    [AFNetWorting getNetWortingWithUrlString:url params:nil controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
        NSArray *arr = responseObject;
        if (arr.count == 0) {
            ZGPplaceholderImageView *placeholderImage = [[ZGPplaceholderImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
            [self.view addSubview:placeholderImage];
        }else{
            for (NSDictionary *Dic in arr) {
                if (Dic[@"shangjiaJutiweizhi"] == self.shangjiajutiweizhi) {
                    MerchantInformationModel *model = [[MerchantInformationModel alloc] init];
                    [model setValuesForKeysWithDictionary:Dic];
                    [self.takeOutArr addObject:model];
                }
            }
            if (self.takeOutArr.count == 0) {
                ZGPplaceholderImageView *placeholderImage = [[ZGPplaceholderImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
                [self.view addSubview:placeholderImage];
            }
            [self.tableView reloadData];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
    }];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.takeOutArr.count;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *takeOut = @"takeOutId";
    TakeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:takeOut];
    if (cell == nil) {
        cell = [TakeTableViewCell CreateTakeOutCell];
    }
    [cell setTakeOutModel:self.takeOutArr[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 115;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TakeOutInformationController *informationVC = [[TakeOutInformationController alloc]init];
    if (self.takeOutArr.count > 0) {
        informationVC.navigationItem.title = [self.takeOutArr[indexPath.row] shangjiaName];
        informationVC.model = self.takeOutArr[indexPath.row];
    }
    [self.navigationController pushViewController:informationVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
