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

@interface SmallAdvertisingTableViewController ()
@property (nonatomic, strong)NSMutableArray *modelArray;

@end

@implementation SmallAdvertisingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];

}
- (void)initData
{
    /** 假数据*/
    _modelArray = [NSMutableArray array];
    SmallAdvertisingModel *model = [[SmallAdvertisingModel alloc] init];
    model.name = @"摩羯座";
    model.headImg = @"xgg_1";
    model.cont = @"好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃";
    NSArray *imgArray = @[@"xgg_3",@"xgg_2"];
    model.talkImgArray = imgArray;
    [_modelArray addObject:model];
    
    
    SmallAdvertisingModel *model2 = [[SmallAdvertisingModel alloc] init];
    model2.name = @"水瓶座";
    model2.headImg = @"xgg_1";
    model2.cont = @"好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃";
    NSArray *imgArray2 = @[@"xgg_2",@"xgg_3",@"xgg_2",@"xgg_3"];
    model2.talkImgArray = imgArray2;
    [_modelArray addObject:model2];
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
    NSInteger temp = [self HelperTextHeightFromTextString:model.cont width:[UIScreen mainScreen].bounds.size.width - 20 fontSize:14];
    model.h = temp;
    return temp +180;
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
