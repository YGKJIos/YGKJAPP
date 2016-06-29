//
//  CarViewController.m
//  一个APP
//
//  Created by 远古科技 on 16/6/29.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "CarViewController.h"




@interface CarViewController ()

@property (nonatomic, retain) UIImageView *mapImage; //

@property (nonatomic, retain) UIImageView *addressImage;// 地址图片

@property (nonatomic, retain) UIView *carView; // 车label

@property (nonatomic, retain) UILabel *addressLabel; // 当前地址label

@property (nonatomic, retain) UILabel *lineLabel;   // 线 label

@property (nonatomic, retain) UIImageView *destinatioImage; // 目的地图片

@property (nonatomic, retain) UILabel *destinatioLabel; // 目的地label




@end

@implementation CarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createMap];
    
}


- (void)createMap
{
    self.mapImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 300)];
    self.mapImage.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.mapImage];
    
    
    
    self.carView = [[UIView alloc] initWithFrame:CGRectMake(0, HEIGHT - 300, WIDTH, 300)];
    self.carView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.carView];
    
    
    self.addressImage = [[UIImageView alloc] initWithFrame:CGRectMake(40, 40, 17, 17)];
    self.addressImage.image = [UIImage imageNamed:@"pc_chufa_tus"];
    [self.carView addSubview:self.addressImage];
    
    
    self.addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 30, WIDTH - 80, 30)];
    self.addressLabel.backgroundColor = [UIColor whiteColor];
    self.addressLabel.text = @"花园商住";
    [self.carView addSubview:self.addressLabel];
    
    
    self.lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 70, WIDTH - 85, 1)];
    self.lineLabel.backgroundColor = [UIColor blackColor];
    [self.carView addSubview:self.lineLabel];
    
    
    self.destinatioImage = [[UIImageView alloc] initWithFrame:CGRectMake(40, 90, 19, 19)];
    self.destinatioImage.image = [UIImage imageNamed:@"pc_daoda_tus"];
    
    [self.carView addSubview:self.destinatioImage];
    
    
    self.destinatioLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 85, WIDTH - 80, 30)];
    self.destinatioLabel.text = @"在这里输入您的目的地";
    
    [self.carView addSubview:self.destinatioLabel];
    
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
