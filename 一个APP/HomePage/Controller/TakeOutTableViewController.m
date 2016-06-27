//
//  TakeOutTableViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/25.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "TakeOutTableViewController.h"
#import "TakeTableViewCell.h"

@interface TakeOutTableViewController ()

@end

@implementation TakeOutTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTableHeaderView];
    self.tableView.showsVerticalScrollIndicator = NO;
    
}
- (void)addTableHeaderView
{
    UIView *tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 228)];
    NSArray *arr = @[@"waimai_tu",@"shouye_haigou",@"shouye_meishitou",@"shouye_xinwen"];
    ScrollView *scrollView = [ScrollView CreateScrollViewImages:arr];
    [tableHeaderView addSubview:scrollView];
    NSArray *btnImage = @[@"waimai_meishi",@"waimei_xianhua",@"waimai_dangao",@"waimai_yaopin"];
    NSArray *titles = @[@"美食",@"鲜花",@"蛋糕",@"药品"];
    for (int i = 0; i < 4; i++) {
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        btn.frame = CGRectMake(30+(40+WIDTH/4-40)*i,scrollView.height+ 10, 40, 40);
//        [btn setBackgroundImage:[UIImage imageNamed:btnImage[i]] forState:UIControlStateNormal];
//        [btn addTarget:self action:@selector(clickBtnImage:) forControlEvents:UIControlEventTouchUpInside];
//        [tableHeaderView addSubview:btn];
        ImageAndLabView *view = [ImageAndLabView createViewNib];
        view.frame = CGRectMake(30+(40+WIDTH/4-40)*i,scrollView.height+ 10, 40, 40);
        [view setImages:btnImage[i] names:titles[i]];
        [tableHeaderView addSubview:view];
    }
    
    
    self.tableView.tableHeaderView = tableHeaderView;

}
- (void)clickBtnImage:(UIButton *)btn
{
    NSLog(@"meishi");
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
    static NSString *takeOut = @"takeOutId";
    TakeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:takeOut];
    if (cell == nil) {
        cell = [TakeTableViewCell CreateTakeOutCell];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 115;
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
