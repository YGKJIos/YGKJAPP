//
//  SmallAdvertisingTableViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/16.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "SmallAdvertisingTableViewController.h"
#import "SmallAdvertisingModel.h"
#import "SmallAdvertisingCell.h"
#import "UserInfo.h"
#import "ZGP_FBGuangGaoViewController.h"
@interface SmallAdvertisingTableViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)NSMutableArray *modelArray;
@end

@implementation SmallAdvertisingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"小广告栏";
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.width = 80;
    button.height = 40;
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitle:@"发布广告" forState:UIControlStateNormal];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 0)];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(fabuguanggao) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItme = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = rightItme;
    self.modelArray = [NSMutableArray array];
    [self creatData];        /**< 数据请求>*/
}
#if 1
- (void)creatData
{
    NSString *url = @"user/chakanguanggao.action";
    [AFNetWorting getNetWortingWithUrlString:url params:nil controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
        NSArray *arr = responseObject;
        if (arr.count == 0) {
            ZGPplaceholderImageView *placeholderImage = [[ZGPplaceholderImageView alloc] initWithFrame:self.view.frame];
            [self.view addSubview:placeholderImage];
        }else{
            for (NSDictionary *dic in arr) {
                SmallAdvertisingModel *model = [[SmallAdvertisingModel alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                [self.modelArray addObject:model];
            }
            [self.tableView reloadData];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
}
#endif
#pragma mark -  发布广告
- (void)fabuguanggao
{
    ZGP_FBGuangGaoViewController *faBuGuangGua = [[ZGP_FBGuangGaoViewController alloc] init];
    [self.navigationController pushViewController:faBuGuangGua animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _modelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    SmallAdvertisingCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[SmallAdvertisingCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setDataForCellWithModel:_modelArray[indexPath.row]];
        return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SmallAdvertisingModel *model = _modelArray[indexPath.row];
    NSInteger temp = [self HelperTextHeightFromTextString:model.guanggaoNeirong width:[UIScreen mainScreen].bounds.size.width - 20 fontSize:14];
    model.h = temp;
    return temp+130;
}
- (CGFloat)HelperTextHeightFromTextString:(NSString *)text width:(CGFloat)textWidth fontSize:(CGFloat)size
{
    //iOS7之后
    /*
     第一个参数: 预设空间 宽度固定  高度预设 一个最大值
     第二个参数: 行间距 如果超出范围是否截断
     第三个参数: 属性字典 可以设置字体大小
     */
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:size]};
    CGRect rect = [text boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    //返回计算出的行高
    return rect.size.height;
}

@end
