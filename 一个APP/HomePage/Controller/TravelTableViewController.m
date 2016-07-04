//
//  TravelTableViewController.m
//  一个APP
//
//  Created by 远古科技 on 16/7/4.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "TravelTableViewController.h"
#import "TravelView.h"

@interface TravelTableViewController ()

@end

@implementation TravelTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addTableHeaderView];
}


- (void)addTableHeaderView
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 350)];
    headerView.backgroundColor = [UIColor whiteColor];
    
    UIImageView *fairImage = [[UIImageView alloc] initWithFrame:CGRectMake(30, 165, 12, 20)];
    fairImage.image = [UIImage imageNamed:@"huo"];
    
    [headerView addSubview:fairImage];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 150, 100, 50)];
    label.text = @"当季最火";
    [headerView addSubview:label];
    
    
    TravelView *view1 = [[[NSBundle mainBundle]loadNibNamed:@"TravelView" owner:nil options:nil]lastObject];
    view1.origin = CGPointMake(30, 200);
    [headerView addSubview:view1];
    
    TravelView *view2 = [[[NSBundle mainBundle] loadNibNamed:@"TravelView" owner:nil options:nil]lastObject];
    view2.origin = CGPointMake(155, 200);
    [headerView addSubview:view2];
    
    TravelView *view3 = [[[NSBundle mainBundle] loadNibNamed:@"TravelView" owner:nil options:nil]lastObject];
    view3.origin = CGPointMake(280, 200);
    [headerView addSubview:view3];
    
    
    NSArray *arr = @[@"guanggao",@"shouye_haigou",@"shouye_meishitou",@"shouye_xinwen"];
    ScrollView *scroll = [ScrollView CreateScrollViewImages:arr];
    scroll.frame = CGRectMake(0, 0, WIDTH, 150);
    [headerView addSubview:scroll];
    
    self.tableView.tableHeaderView = headerView;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 12;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *str = @"reuse";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:str];
    }

    return cell;
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
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
