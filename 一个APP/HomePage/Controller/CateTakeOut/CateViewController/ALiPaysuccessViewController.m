//
//  ALiPaysuccessViewController.m
//  一个APP
//
//  Created by Tiny on 16/8/25.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "ALiPaysuccessViewController.h"

@interface ALiPaysuccessViewController ()

@end

@implementation ALiPaysuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"支付";
//    UIBarButtonItem *leftItem = [UIBarButtonItem itemWithTarget:self action:@selector(fanhui) image:@"meishi_fanghui" highImage:@"meishi_fanghui"];
//    self.navigationItem.leftBarButtonItem = leftItem;
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 180, WIDTH, 40)];
    label1.textColor = [UIColor lightGrayColor];
    label1.text = @"恭喜您";
    label1.font = [UIFont systemFontOfSize:20];
    label1.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label1];
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 210, WIDTH, 40)];
    label2.text = @"您已支付成功";
    label2.font = [UIFont systemFontOfSize:20];
    label2.textColor = [UIColor lightGrayColor];
    label2.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label2];
    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 150, 150)];
    img.image = [UIImage imageNamed:@"chenggongzhhifu"];
    img.center = self.view.center;
    [self.view addSubview:img];
    
}
- (void)fanhui
{
    
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
