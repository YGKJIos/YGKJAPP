//
//  LearnDetailsTableViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/24.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "LearnDetailsTableViewController.h"
#import "PlayerVoteViewController.h" // 选手选票
#import "ProgramVoteViewController.h" // 节目选票
#import "VoucherTableViewController.h"
#import "voucherTableViewCell.h"  // 团购cell
//#import "EvaluateTableViewCell.h" // 评论cell
#import "DetailTableHeaderView.h"
#import "CarEvaluateTableViewCell.h"
#import "TitleCellTableViewCell.h"
#import "LearnGroupPurchaseTableViewCell.h"
#import "ShowAllAndErorrCell.h"
#import "ErrorInformationView.h"

@interface LearnDetailsTableViewController ()
@property (nonatomic, strong)NSMutableArray *dataArr;
@property (nonatomic, strong)NSMutableArray *TGArr;
@property (nonatomic, strong)NSArray *voteArr;


@end

@implementation LearnDetailsTableViewController

-(NSMutableArray *)dataArr
{
    if (!_dataArr) {
        self.dataArr = [[NSMutableArray alloc]init];
    }
    return _dataArr;
}
-(NSMutableArray *)TGArr
{
    if (!_TGArr) {
        self.TGArr = [[NSMutableArray alloc]init];
    }
    return _TGArr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.voteArr = @[@"比赛信息",@"选手投票区",@"节目投票区"];
    self.tableView.backgroundColor = BGcolor(192, 192, 192);
    [self.tableView setShowsVerticalScrollIndicator:NO];
    [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, -50, 0, 0)];
    [self loadData];

}
- (void)loadData
{
    //    NSString *url = [NSString stringWithFormat:@"meishi/shangjiaxiangqing.action?shangjiaId=83"];
    NSString *url = [NSString stringWithFormat:@"meishi/shangjiaxiangqing.action?shangjiaId=%@",self.shopID];
    [AFNetWorting getNetWortingWithUrlString:url params:nil controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSArray *shopArr = [responseObject objectForKey:@"shangjiaXiangQing"];
        NSArray *TGArr = [responseObject objectForKey:@"shangjiaTuanGouJuan"];
        if (shopArr.count != 0)
        {
            MerchantInformationModel *model = [[MerchantInformationModel alloc]init];
            [model setValuesForKeysWithDictionary:shopArr[0]];
            [self.dataArr addObject:model];
        }
        
        if (TGArr.count != 0) {
            
            for (NSDictionary *dic in TGArr) {
                
                MerchantInformationModel *model = [[MerchantInformationModel alloc]init];
                [model setValuesForKeysWithDictionary:dic];
                [self.TGArr addObject:model];
            }
        }
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.TGArr.count+1;
    
//    if (section == 2) {
//        return 1;
//    }
//    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 团购券
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 44;
        }else
        {
            return 94;
        }
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            return 40;
        }
//        if (indexPath.row == 4) {
//            return 32;
//        }
        return 105;
    }
//    if (indexPath.section == 2) {
//        return 220;
//    }
//    if (indexPath.section == 3) {
//        return 72;
//    }
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0) {
            TitleCellTableViewCell *titleCell = [TitleCellTableViewCell createSectionTitleCellNib];
            NSString *text = [NSString stringWithFormat:@"团购券  (%ld)",self.TGArr.count];
            [titleCell setTitleImage:@"learn_tuangouquan" titleLab:text];
            return titleCell;
        }
//        else if (indexPath.row == 4)
//        {
//            ShowAllAndErorrCell *showCell = [[ShowAllAndErorrCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
//            [showCell setShowAllAndErorrCellStyle:showAllCellStyle];
//            return showCell;
//        }
        else
        {
            voucherTableViewCell *learnCell = [voucherTableViewCell greateCell];
            if (self.TGArr.count != 0) {
                [learnCell setmodel:self.TGArr[indexPath.row - 1]];
            }
            return learnCell;
        }
    }
#pragma 评论Cell
//    if (indexPath.section == 2) {
//        if (indexPath.row == 0) {
//            TitleCellTableViewCell *titleCell = [TitleCellTableViewCell createSectionTitleCellNib];
//            [titleCell setTitleImage:@"learn_pinglun" titleLab:@"用户评价"];
//            return titleCell;
//        }else if (indexPath.row == 2)
//        {
//            ShowAllAndErorrCell *showCell = [[ShowAllAndErorrCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
//            [showCell setShowAllAndErorrCellStyle:showAllCellStyle];
//            return showCell;
//        }
//        CarEvaluateTableViewCell *evaCell = [CarEvaluateTableViewCell greateEvaluateCell];
//        return evaCell;
//    }
    
//    ShowAllAndErorrCell *showCell = [[ShowAllAndErorrCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
//    [showCell setShowAllAndErorrCellStyle:erorrCellStyle];
//    return showCell;
    return nil;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        if (indexPath.row == 1) {
            VoucherTableViewController *playerVC = [[VoucherTableViewController alloc]init];
            playerVC.num = self.Num;
            playerVC.shopArr = self.dataArr;
            playerVC.model = self.TGArr[indexPath.row-1];
            [self.navigationController pushViewController:playerVC animated:YES];
        }
//        if (indexPath.row == 2) {
//            ProgramVoteViewController *programVC = [[ProgramVoteViewController alloc]init];
//            [self.navigationController pushViewController:programVC animated:YES];
//        }
    }
//    if (indexPath.section == 1) {
//        if (indexPath.row >0 && indexPath.row < 4) {
//            VoucherTableViewController *voucher = [[VoucherTableViewController alloc]init];
//            [self.navigationController pushViewController:voucher animated:YES];
//        }
//    }
    // 报错
//    if (indexPath.section == 3) {
//        ErrorInformationView *errorView = [[ErrorInformationView alloc]initWithFrame:self.view.frame];
//        [errorView showErrorView];
//    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        DetailTableHeaderView *headerView = [DetailTableHeaderView greateHeaderView];
        if (self.dataArr.count != 0) {
            [headerView setHeaderModel:self.dataArr[0]];
        }
        
        tableView.tableHeaderView = headerView;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}

@end
