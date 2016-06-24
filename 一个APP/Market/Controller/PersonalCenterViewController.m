//
//  PersonalCenterViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/7.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "PersonalCenterViewController.h"
#import "PerTableViewCell.h"

@interface PersonalCenterViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation PersonalCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTabelView];
    self.view.frame = CGRectMake(-(WIDTH), 0, WIDTH+WIDTH*0.5, HEIGHT);
    
}
- (void)addTabelView
{
    UITableView *tabView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.width-80, HEIGHT) style:UITableViewStylePlain];
    tabView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tabView.backgroundColor = BGcolor(34, 198, 220);
    tabView.delegate= self;
    tabView.dataSource = self;
    [self.view addSubview:tabView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *personalID = @"personalID";
    PerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:personalID];
    if (cell == nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"PerTableViewCell" owner:nil options:nil].lastObject;
    }
    if (indexPath.row == 0) {
        cell.iconImage.image = [UIImage imageNamed:@"huiyan"];
        cell.textLab.text = @"开通会员";
        cell.contentView.backgroundColor = BGcolor(86, 215, 230);
    }else if (indexPath.row == 1){
        cell.iconImage.image = [UIImage imageNamed:@"shoucang"];
        cell.textLab.text = @"收藏";
        cell.contentView.backgroundColor = BGcolor(61, 208, 226);
    }else if (indexPath.row == 2){
        cell.iconImage.image = [UIImage imageNamed:@"qianbao"];
        cell.textLab.text = @"钱包";
        cell.contentView.backgroundColor = BGcolor(45, 203, 223);
    }else{
        cell.iconImage.image = [UIImage imageNamed:@"shezhi"];
        cell.textLab.text = @"设置";
        cell.contentView.backgroundColor = BGcolor(34, 198, 220);
    }
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
