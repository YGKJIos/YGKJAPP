//
//  HomePageViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/16.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "HomePageViewController.h"
#import "SearchViewController.h"
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
    [self addNavigationView];
    HomePageTableViewController *homeTabVC = [[HomePageTableViewController alloc]init];
    homeTabVC.tableView.y = 0;
    homeTabVC.tableView.height = HEIGHT;
    [self addChildViewController:homeTabVC];
    [self.view addSubview:homeTabVC.tableView];
    
    [self currentLocation];
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
    
    NSLog(@"lable : %@",_autoScrollLabel.text);
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
    NSLog(@"恒运大厦定位");
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
    NSLog(@"定位的经度:%f,定位的纬度:%f",_locService.userLocation.location.coordinate.longitude,_locService.userLocation.location.coordinate.latitude);
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
        
        titleStr = @"反向地理编码";
        showmeg = [NSString stringWithFormat:@"%@",item.title];
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:titleStr message:showmeg delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定",nil];
        NSLog(@"%@", showmeg);
//        [myAlertView show];
//       [self addNavigationView];
        [self creatLocationBtn];
    }
}
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    
    
    //NSLog(@"heading is %@",userLocation.heading);
}
//处理位置坐标更新
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    _mapView.showsUserLocation = YES;//显示定位图层
    [_mapView updateLocationData:userLocation];
    
//    _mapView.centerCoordinate = userLocation.location.coordinate;
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
