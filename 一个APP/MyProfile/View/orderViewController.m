//
//  orderViewController.m
//  一个APP
//
//  Created by 远古科技 on 16/7/21.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "orderViewController.h"

@interface orderViewController ()
@property (nonatomic, retain) IBOutlet UIScrollView *bcakView;

@end

@implementation orderViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
        self.bcakView.contentSize = CGSizeMake(WIDTH, HEIGHT+100);
    
    
    
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
