//
//  EditingAddressViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/13.
//  Copyright © 2016年 llb. All rights reserved.
//

// 编辑 送货地址
#import "EditingAddressViewController.h"
#import "DeliverAdressTableViewCell.h"
#import "AddressAndMOdificationViewController.h"
#import "MerchantInformationModel.h"

@interface EditingAddressViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)NSMutableArray *listArr;
@property (nonatomic, strong)UITableView *tableView
;

@end

@implementation EditingAddressViewController
-(NSMutableArray *)listArr
{
    if (!_listArr) {
        self.listArr = [[NSMutableArray alloc]init];
    }
    return _listArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"送货地址";
//    [self loadData];  // 网络请求
    self.view.backgroundColor = [UIColor whiteColor];
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-64) style:UITableViewStylePlain];
    tableView.delegate =self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 200)];
    footView.backgroundColor = [UIColor whiteColor];
    tableView.tableFooterView = footView;
    
    UILabel *promptLab = [UILabel newAutoLayoutView];
    [footView addSubview:promptLab];
    [promptLab autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [promptLab autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:40];
    [promptLab autoSetDimensionsToSize:CGSizeMake(WIDTH, 20)];
    promptLab.textAlignment = NSTextAlignmentCenter;
    promptLab.text = @"地址最多保留10个，如还需添加请修改";
    promptLab.textColor = BGcolor(188, 188, 188);
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"添加" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(rightButtonClickAction) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.size = CGSizeMake(40, 21);
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self loadData];
    [super viewWillAppear:animated];
}
- (void)loadData
{
    [self.listArr removeAllObjects];
    // 沙盒路径  取出userId
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    path = [path stringByAppendingPathComponent:@"manager/userDic.plish"];
    NSDictionary *userdic = [NSDictionary dictionaryWithContentsOfFile:path];
    NSString *userID = [userdic objectForKey:@"userId"];
    NSString *urlStr = @"user/queryshouhuodizhi.action?";
    NSDictionary * dic = @{@"userId":userID};
    
    [AFNetWorting postNetWortingWithUrlString:urlStr params:dic controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
        for (NSDictionary *dic in responseObject) {
            MerchantInformationModel *model = [[MerchantInformationModel alloc]init];
            [model setValuesForKeysWithDictionary:dic];
            [self.listArr addObject:model];
        }
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}
- (void)rightButtonClickAction
{
    AddressAndMOdificationViewController *addressModifiVC = [[AddressAndMOdificationViewController alloc]init];
    [self.navigationController pushViewController:addressModifiVC animated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.listArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *addressID = @"addressID";
    DeliverAdressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:addressID];
    if (cell == nil) {
        cell = [[DeliverAdressTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:addressID];
    }
    [cell.deleteBtn addTarget:self action:@selector(deleteBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.deleteBtn.tag = 1000+indexPath.section;
    if (self.listArr.count>0) {
        [cell setModel:self.listArr[indexPath.section]];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 115;
}
// 删除地址
- (void)deleteBtnAction:(UIButton *)btn
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"您确定删除地址" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *suerAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *strUrl = @"user/delectshouhuodizhi.action?";
        NSString *shouhuodizhiId = [self.listArr[btn.tag - 1000] shouhuodizhiId];
        NSDictionary *dic = @{@"shouhuodizhiId":shouhuodizhiId};
        [AFNetWorting postNetWortingWithUrlString:strUrl params:dic controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
            if ([responseObject[@"ok"] isEqualToString:@"0"]) {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"网络不稳定，删除失败" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *suerAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
                [alert addAction:suerAction];
                [self presentViewController:alert animated:YES completion:nil];
            }else
            {
                [self loadData];
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
        }];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:suerAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.delegate selectAddressInformation:self.listArr[indexPath.section]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
