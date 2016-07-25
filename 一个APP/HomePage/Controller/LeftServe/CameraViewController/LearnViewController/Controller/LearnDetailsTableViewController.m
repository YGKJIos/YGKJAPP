//
//  LearnDetailsTableViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/24.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "LearnDetailsTableViewController.h"
#import "EvaluateTableViewCell.h" // 评论cell
#import "carDetailHeaderView.h"
#import "TitleCellTableViewCell.h"
#import "LearnGroupPurchaseTableViewCell.h"
#import "ShowAllAndErorrCell.h"
#import "PlayerVoteViewController.h" // 选手选票
#import "ProgramVoteViewController.h" // 节目选票

@interface LearnDetailsTableViewController ()
@property (nonatomic, strong)NSArray *voteArr;

@end

@implementation LearnDetailsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.voteArr = @[@"比赛信息",@"选手投票区",@"节目投票区"];
    self.tableView.backgroundColor = BGcolor(192, 192, 192);
    [self.tableView setShowsVerticalScrollIndicator:NO];
    [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, -50, 0, 0)];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
        return 3;
    }
    if (section == 1) {
        return 5;
    }
    if (section == 2) {
        return 3;
    }
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            return 44;
        }
        if (indexPath.row == 4) {
            return 32;
        }
        return 63;
    }
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            return 44;
        }
        if (indexPath.row == 2) {
            return 32;
        }
        return 117;
    }
    if (indexPath.section == 3) {
        return 72;
    }
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            TitleCellTableViewCell *titleCell = [TitleCellTableViewCell createSectionTitleCellNib];
            [titleCell setTitleImage:@"learn_information" titleLab:self.voteArr[indexPath.row]];
            return titleCell;
        }else{
            UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            cell.textLabel.text = self.voteArr[indexPath.row];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
        }
    }else if (indexPath.section == 1)
    {
        if (indexPath.row == 0) {
            TitleCellTableViewCell *titleCell = [TitleCellTableViewCell createSectionTitleCellNib];
            [titleCell setTitleImage:@"learn_information" titleLab:@"团购券"];
            return titleCell;
        }else if (indexPath.row == 4)
        {
            ShowAllAndErorrCell *showCell = [[ShowAllAndErorrCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            [showCell setShowAllAndErorrCellStyle:showAllCellStyle];
            return showCell;
        }
        else
        {
            LearnGroupPurchaseTableViewCell *learnCell = [LearnGroupPurchaseTableViewCell createLearnGroupPurchaseCellNib];
            return learnCell;
        }
    }
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            TitleCellTableViewCell *titleCell = [TitleCellTableViewCell createSectionTitleCellNib];
            [titleCell setTitleImage:@"learn_pinglun" titleLab:@"用户评价"];
            return titleCell;
        }else if (indexPath.row == 2)
        {
            ShowAllAndErorrCell *showCell = [[ShowAllAndErorrCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            [showCell setShowAllAndErorrCellStyle:showAllCellStyle];
            return showCell;
        }
        EvaluateTableViewCell *evaCell = [[NSBundle mainBundle]loadNibNamed:@"EvaluateTableViewCell" owner:nil options:nil].lastObject;
        return evaCell;
    }
    
    ShowAllAndErorrCell *showCell = [[ShowAllAndErorrCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    [showCell setShowAllAndErorrCellStyle:erorrCellStyle];
    return showCell;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        if (indexPath.row == 1) {
            PlayerVoteViewController *playerVC = [[PlayerVoteViewController alloc]init];
            [self.navigationController pushViewController:playerVC animated:YES];
        }
        if (indexPath.row == 2) {
            ProgramVoteViewController *programVC = [[ProgramVoteViewController alloc]init];
            [self.navigationController pushViewController:programVC animated:YES];
        }
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        carDetailHeaderView *headerView = [carDetailHeaderView greateHeaderView];
        
        tableView.tableHeaderView = headerView;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}

@end
