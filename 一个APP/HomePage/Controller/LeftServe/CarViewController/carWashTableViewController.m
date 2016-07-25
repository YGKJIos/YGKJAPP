//
//  carWashTableViewController.m
//  一个APP
//
//  Created by 远古科技 on 16/7/24.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "carWashTableViewController.h"
#import "GroupPurchaseView.h"
#import "shopPeoleTableViewCell.h"
#import "carNumTableViewCell.h"
#import "EvaluateTableViewCell.h"
#import "carConsumeTableViewCell.h"
#import "ShowAllAndErorrCell.h"
#import "ConsumePromptTableViewCell.h"
@interface carWashTableViewController ()

@end

@implementation carWashTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = BGcolor(205, 205, 205);
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

    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 2) {
        return 2;
    }
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section == 0) {
        static NSString *reuse = @"reuse";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
        if (!cell) {
            cell = [carNumTableViewCell greateCell];
        }
        cell.selectionStyle = UITableViewCellStyleDefault;
        return cell;
    }
    if (indexPath.section == 1) {
        static NSString *reuse = @"reuse";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
        if (!cell) {
            cell = [shopPeoleTableViewCell greateCell];
        }
        cell.selectionStyle = UITableViewCellStyleDefault;
        return cell;
    }
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            static NSString *reuse = @"reuse";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
            cell = [carConsumeTableViewCell greateCell];
            cell.selectionStyle = UITableViewCellStyleDefault;
            return cell;
        }
        if (indexPath.row == 1) {
            ShowAllAndErorrCell *cell = [[ShowAllAndErorrCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            [cell setShowAllAndErorrCellStyle:showAllCellStyle];
            cell.selectionStyle = UITableViewCellStyleDefault;
            return cell;
        }
        
    }
    if (indexPath.section == 3) {
        ConsumePromptTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"ConsumePromptTableViewCell" owner:nil options:nil]lastObject];
        cell.selectionStyle = UITableViewCellStyleDefault;
        return cell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 45;
    }
    if (indexPath.section == 1) {
        return 135;
    }
    if (indexPath.section == 2) {
        if (indexPath.row == 1) {
            return 40;
        }
        return 350;
    }
    if (indexPath.section == 3) {
        return 530;
    }
    
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        GroupPurchaseView *cell = [[NSBundle mainBundle]loadNibNamed:@"GroupPurchaseView" owner:nil options:nil].lastObject;
        cell.frame = CGRectMake(0, 0, WIDTH, 255);
        tableView.tableHeaderView = cell;
    }
    return nil;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
