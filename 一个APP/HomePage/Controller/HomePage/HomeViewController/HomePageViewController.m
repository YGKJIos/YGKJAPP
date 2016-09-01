//
//  HomePageViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/16.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "HomePageViewController.h"
#import "SearchViewController.h"
#import <AFNetworking.h>
#import "Singleton.h"
#import "HomePageTableViewController.h" // 首页内容
#import "MapViewController.h" // 恒运大厦 定位

#import "CBAutoScrollLabel.h" /*< 跑马灯 **/
@interface HomePageViewController ()<BMKMapViewDelegate,BMKLocationServiceDelegate,BMKGeoCodeSearchDelegate>
{
    bool isGeoSearch;
    NSString* showmeg;
}
@property (nonatomic, strong)BMKMapView *mapView;
@property (nonatomic, strong)BMKLocationService *locService;
@property (nonatomic, strong)BMKGeoCodeSearch *geocodesearch;
@property (nonatomic, strong)CBAutoScrollLabel *autoScrollLabel;
@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置navigation 的样式
//    [self addNavigationView];
    self.navigationItem.title = @"智惠同城";
    HomePageTableViewController *homeTabVC = [[HomePageTableViewController alloc]init];
    homeTabVC.tableView.y = 0;
    homeTabVC.tableView.height = HEIGHT;
    [self addChildViewController:homeTabVC];
    [self.view addSubview:homeTabVC.tableView];
    
    [self addAFN];
    // 添加百度地图
    [self currentLocation];
}
#pragma mark - 网络判断
- (void)addAFN
{
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    
    // 2.设置网络状态改变后的处理
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        // 当网络状态改变了, 就会调用这个block
        switch (status) {
            case AFNetworkReachabilityStatusUnknown: // 未知网络
                NSLog(@"未知网络");
                [self addAlterController:@"未知网络"];
                IPDSingleton.AFNBool = YES;
                break;
            case AFNetworkReachabilityStatusNotReachable: // 没有网络(断网)
                NSLog(@"没有网络(断网)");
                [self addAlterController:@"没有网络"];
                IPDSingleton.AFNBool = NO;
                [IPDSingleton makeShowWith:@"无网络,请检查网络设置"];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"AFNsss" object:@"NO" userInfo:nil];
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN: // 手机自带网络
                [self addAlterController:@"您在使用蜂窝移动网络"];
                NSLog(@"手机自带网络");
                IPDSingleton.AFNBool = YES;
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi: // WIFI
                NSLog(@"WIFI");
                IPDSingleton.AFNBool = YES;
                break;
        }
    }];
    // 3.开始监控
    [mgr startMonitoring];
}
- (void)addAlterController:(NSString *)message
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}
// 导航栏中央搜索按键
- (void)addNavigationView
{

    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.width = 205;
    searchBtn.height = 26;
    [searchBtn addTarget:self action:@selector(searchClickAction) forControlEvents:UIControlEventTouchUpInside];
    [searchBtn setBackgroundImage:[UIImage imageNamed:@"chaoshi_sousuo"] forState:UIControlStateNormal];
    searchBtn.adjustsImageWhenHighlighted = NO;
    self.navigationItem.titleView = searchBtn;
}
// 显示当前位置信息btn
- (void) creatLocationBtn
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 60, 40);
//    [button setTitle:showmeg forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button addTarget:self action:@selector(dingwei) forControlEvents:UIControlEventTouchUpInside];
    button.userInteractionEnabled = YES;
    /*< 跑马灯 **/
    self.autoScrollLabel = [[CBAutoScrollLabel alloc]initWithFrame:CGRectMake(0, 0, 60, 40)];
    self.autoScrollLabel.text = showmeg;
    if (showmeg.length == 0) {
        self.autoScrollLabel.text = @"正在定位,请稍后...";
    }
//    self.autoScrollLabel.textColor = [UIColor blueColor];
    self.autoScrollLabel.labelSpacing = 30; // distance between start and end labels
    self.autoScrollLabel.pauseInterval = 1.7; // seconds of pause before scrolling starts again
    self.autoScrollLabel.scrollSpeed = 30; // pixels per second
    self.autoScrollLabel.textAlignment = NSTextAlignmentCenter; // centers text when no auto-scrolling is applied
    self.autoScrollLabel.fadeLength = 12.f;
    self.autoScrollLabel.scrollDirection = CBAutoScrollDirectionLeft;
    [self.autoScrollLabel observeApplicationNotifications];
//    _autoScrollLabel.backgroundColor = [UIColor yellowColor];
    _autoScrollLabel.textColor = [UIColor whiteColor];
    [button addSubview: _autoScrollLabel];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)searchClickAction
{
    SearchViewController *searchVC = [[SearchViewController alloc]init];
    [self.navigationController pushViewController:searchVC animated:YES];
}
- (void)dingwei
{
    MapViewController *map = [[MapViewController alloc] init];
    [self.navigationController pushViewController:map animated:YES];
}

- (void)currentLocation
{
    self.mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    self.locService = [[BMKLocationService alloc]init];
    [_locService startUserLocationService];
    _locService.delegate = self;
    self.geocodesearch = [[BMKGeoCodeSearch alloc] init]; // 编码服务的初始化(就是获取经纬度,或者获取地理位置服务)
    self.geocodesearch.delegate = self;
//    NSLog(@"定位的经度:%f,定位的纬度:%f",_locService.userLocation.location.coordinate.longitude,_locService.userLocation.location.coordinate.latitude);
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(0, 0, 60, 40);
//    [button setTitle:@"获取地址" forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    button.titleLabel.font = [UIFont systemFontOfSize:13];
//    [button addTarget:self action:@selector(onClickReverseGeocode) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:button];
//    self.navigationItem.rightBarButtonItem = item;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    [self onClickReverseGeocode];
    });
}
-(void)onClickReverseGeocode  //发送反编码请求的.
{
    isGeoSearch = false;
    CLLocationCoordinate2D pt = (CLLocationCoordinate2D){0, 0};//初始化
    if (_locService.userLocation.location.coordinate.longitude!= 0
        && _locService.userLocation.location.coordinate.latitude!= 0) {
        //如果还没有给pt赋值,那就将当前的经纬度赋值给pt
        pt = (CLLocationCoordinate2D){_locService.userLocation.location.coordinate.latitude,
            _locService.userLocation.location.coordinate.longitude};
    }
    BMKReverseGeoCodeOption *reverseGeocodeSearchOption = [[BMKReverseGeoCodeOption alloc]init];//初始化反编码请求
    reverseGeocodeSearchOption.reverseGeoPoint = pt;//设置反编码的店为pt
    BOOL flag = [_geocodesearch reverseGeoCode:reverseGeocodeSearchOption];//发送反编码请求.并返回是否成功
    if(flag)
    {
        NSLog(@"反geo检索发送成功");
    }
    else
    {
        NSLog(@"反geo检索发送失败");
    }
    
}
-(void) onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error
{
    if (error == 0) {
        BMKPointAnnotation* item = [[BMKPointAnnotation alloc]init];
        item.coordinate = result.location;
        item.title = result.address;
        NSString* titleStr;
        
        titleStr = @"当前您的位置";
        showmeg = [NSString stringWithFormat:@"%@",item.title];
        
//        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:titleStr message:showmeg delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定",nil];
//        [myAlertView show];
        [self creatLocationBtn];
    }
}
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    
}
//处理位置坐标更新
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    _mapView.showsUserLocation = YES;//显示定位图层
    [_mapView updateLocationData:userLocation];
    
    _mapView.centerCoordinate = userLocation.location.coordinate;
    _mapView.zoomLevel = 18;
//    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
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



@end
