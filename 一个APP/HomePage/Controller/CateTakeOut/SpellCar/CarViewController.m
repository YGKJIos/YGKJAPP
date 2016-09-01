//
//  CarViewController.m
//  一个APP
//
//  Created by 远古科技 on 16/6/29.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "CarViewController.h"

#import "UserInfo.h"


@interface CarViewController ()<BMKMapViewDelegate,BMKLocationServiceDelegate>

@property (nonatomic, retain) UIImageView *mapImage; //

@property (nonatomic, retain) UIImageView *addressImage;// 地址图片

@property (nonatomic, retain) UIView *carView; // 车label

@property (nonatomic, retain) UITextField *addressField; // 当前地址label

@property (nonatomic, retain) UILabel *lineLabel;   // 线 label

@property (nonatomic, retain) UIImageView *destinatioImage; // 目的地图片

@property (nonatomic, retain) UITextField *destinatioField; // 目的地label

//@property (nonatomic, retain) UIButton *carButton; // 拼车按钮

@property (nonatomic, retain) UILabel *carPoolingLabel; // 拼车label

@property (nonatomic, strong)BMKMapView *mapView;
@property (nonatomic, strong)BMKLocationService *locService;
@end

@implementation CarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"拼车";
    [self createMap];
}
- (void)createMap
{
    self.mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 300)];
    [self.view addSubview:_mapView];
    self.locService = [[BMKLocationService alloc]init];
    [_locService startUserLocationService];
//    self.mapImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 300)];
//    self.mapImage.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:self.mapImage];
    
    self.carView = [[UIView alloc] initWithFrame:CGRectMake(0, HEIGHT - 300, WIDTH, 300)];
    self.carView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.carView];
    
    self.addressImage = [[UIImageView alloc] initWithFrame:CGRectMake(40, 40, 17, 17)];
    self.addressImage.image = [UIImage imageNamed:@"pc_chufa_tus"];
    [self.carView addSubview:self.addressImage];
    
    
    self.addressField = [[UITextField alloc] initWithFrame:CGRectMake(70, 30, WIDTH - 80, 30)];
    self.addressField.backgroundColor = [UIColor whiteColor];
    self.addressField.placeholder = @"花园商网";
    [self.carView addSubview:self.addressField];
    
    
    self.lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 70, WIDTH - 85, 1)];
    self.lineLabel.backgroundColor = [UIColor blackColor];
    [self.carView addSubview:self.lineLabel];
    
    
    self.destinatioImage = [[UIImageView alloc] initWithFrame:CGRectMake(40, 90, 19, 19)];
    self.destinatioImage.image = [UIImage imageNamed:@"pc_daoda_tus"];
    
    [self.carView addSubview:self.destinatioImage];
    
    self.destinatioField = [[UITextField alloc] initWithFrame:CGRectMake(70, 85, WIDTH - 80, 30)];
    self.destinatioField.placeholder = @"在这里输入您的目的地";
    
    [self.carView addSubview:self.destinatioField];
    
    self.carPoolingLabel = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH/2-100, 150, 200, 50)];
    
    self.carPoolingLabel.backgroundColor = BGcolor(85, 198, 216);
    self.carPoolingLabel.text = @"开始拼车";
    self.carPoolingLabel.textAlignment = NSTextAlignmentCenter;
    self.carPoolingLabel.textColor = [UIColor whiteColor];
    self.carPoolingLabel.font = [UIFont systemFontOfSize:25];
    self.carPoolingLabel.userInteractionEnabled = YES;// 用户交互打开
    [self.carView addSubview:self.carPoolingLabel];
    
    
    // 给拼车label添加点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.carPoolingLabel addGestureRecognizer:tap];

}
// 手势点击方法
- (void)tap:(UITapGestureRecognizer *)tap
{
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setObject:self.addressField.text forKey:@"congnalai"];
    [param setObject:self.destinatioField.text forKey:@"daonaqu"];
    NSString *sandBoxPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString *path = [sandBoxPath stringByAppendingPathComponent:@"manager/userDic.plish"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    
    [param setObject:dic[@"userId"] forKey:@"userId"];

    NSString *url = @"dache/userdache.action?";
    if (self.addressField.text.length != 0 && self.destinatioField.text.length != 0 ) {
        [AFNetWorting postNetWortingWithUrlString:url params:param controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
            
            if ([[(NSDictionary *)responseObject objectForKey:@"ok"] isEqualToString:@"1"])  {
                
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"拼车成功" message:@"wait a moment" preferredStyle:UIAlertControllerStyleAlert];
                /**< 创建action对象*/
                UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                }];
                [alert addAction:action];
                [self presentViewController:alert animated:YES completion:nil];
            }else if ([[(NSDictionary *)responseObject objectForKey:@"ok"] isEqualToString:@"0"])
            {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"拼车失败" message:@"大不了重新再来" preferredStyle:UIAlertControllerStyleAlert];
                /**< 创建action对象*/
                UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                }];
                [alert addAction:action];
                [self presentViewController:alert animated:YES completion:nil];
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            UIAlertController *alerController = [UIAlertController alertControllerWithTitle:@"拼车失败" message:@"请求超时" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [alerController addAction:sureAction];
            [self presentViewController:alerController animated:YES completion:nil];
        }];
    }else if (self.addressField.text.length == 0)
    {
        UIAlertController *alerController = [UIAlertController alertControllerWithTitle:@"起始点不能为空" message:@"请重新输入" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
//        [alerController addAction:sureAction];
        [self performSelector:@selector(diss) withObject:self afterDelay:2];
        [self presentViewController:alerController animated:YES completion:nil];
    }else if (self.destinatioField.text.length == 0)
    {
        UIAlertController *alerController = [UIAlertController alertControllerWithTitle:@"目的地不能为空" message:@"请重新输入" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
//        [alerController addAction:sureAction];
        [self performSelector:@selector(diss) withObject:self afterDelay:2];
        [self presentViewController:alerController animated:YES completion:nil];
    }
}
-(void)diss
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
//处理位置坐标更新
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    _mapView.showsUserLocation = YES;//显示定位图层
    [_mapView updateLocationData:userLocation];
    
    _mapView.centerCoordinate = userLocation.location.coordinate;
    _mapView.zoomLevel = 16;
    //NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
}
-(void)viewWillAppear:(BOOL)animated
{
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    _locService.delegate = self;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
    _locService.delegate = nil;
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
