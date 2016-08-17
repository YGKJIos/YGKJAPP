//
//  SeeAllEvaluateTableViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/8/2.
//  Copyright © 2016年 llb. All rights reserved.
//

// 查看全部评论 VC
#import "SeeAllEvaluateTableViewController.h"
#import "EvaluateTitleTableViewCell.h"
#import "EvaluateTableViewCell.h"

@interface SeeAllEvaluateTableViewController ()

@end

@implementation SeeAllEvaluateTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        EvaluateTitleTableViewCell *titleCell = [[NSBundle mainBundle]loadNibNamed:@"EvaluateTitleTableViewCell" owner:nil options:nil].lastObject;
        return titleCell;
    }
    
    static NSString *evaluateID = @"evaluateID";
    EvaluateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:evaluateID];
    if (cell == nil) {
        cell = [EvaluateTableViewCell CreateEvaluateCellNib];
    }
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 44;
    }
    return 117;
}


@end
