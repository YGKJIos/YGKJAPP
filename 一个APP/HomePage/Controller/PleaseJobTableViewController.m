//
//  PleaseJobTableViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/30.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "PleaseJobTableViewController.h"
#import "PleaseJobTableViewCell.h"

@interface PleaseJobTableViewController ()<SDCycleScrollViewDelegate>

@end

@implementation PleaseJobTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationStyle];
    [self addTableViewHeaderView];
   

}
#pragma mark - 设置标题栏的样式
- (void)setNavigationStyle
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 250, 25)];
    [imageView setUserInteractionEnabled:YES];
    imageView.image = [UIImage imageNamed:@"zc_navigationBar"];
    self.navigationItem.titleView = imageView;
    
    UIButton *leftBut = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBut.backgroundColor = [UIColor clearColor];
    leftBut.frame = CGRectMake(0, 0, 125, 25);
    [leftBut addTarget:self action:@selector(leftClickAction) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:leftBut];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.backgroundColor = [UIColor clearColor];
    rightBtn.frame = CGRectMake(127, 0, 125, 25);
    [rightBtn addTarget:self action:@selector(rightClickAction) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:rightBtn];
}
- (void)leftClickAction
{
    NSLog(@"全职");
}
- (void)rightClickAction
{
    NSLog(@"兼职");
}

- (void)addTableViewHeaderView
{
    NSArray *arr = @[@"zc_lunbo",@"zc_lunbo",@"zc_lunbo",@"zc_lunbo",];
    ScrollView *view = [ScrollView CreateScrollViewImages:arr];
    view.scrollView.delegate = self;
    self.tableView.tableHeaderView = view;
}
-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"%ld",index);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *jobId = @"jobId";
    PleaseJobTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:jobId];
    if (cell == nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"PleaseJobTableViewCell" owner:nil options:nil].lastObject;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 113;
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
