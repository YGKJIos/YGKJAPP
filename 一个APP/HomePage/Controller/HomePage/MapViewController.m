//
//  MapViewController.m
//  一个APP
//
//  Created by 祝高鹏 on 16/8/17.
//  Copyright © 2016年 祝高鹏. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()<BMKMapViewDelegate,BMKLocationServiceDelegate,BMKGeoCodeSearchDelegate>
{
    bool isGeoSearch;
}
@property (nonatomic, strong)BMKMapView *mapView;
@property (nonatomic, strong)BMKLocationService *locService;
@property (nonatomic, strong)BMKGeoCodeSearch *geocodesearch;

@property (nonatomic, strong)UITextField *lon;
@property (nonatomic, strong)UITextField *lat;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"";
    self.mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    [self.view addSubview:_mapView];
    self.locService = [[BMKLocationService alloc]init];
    [_locService startUserLocationService];
    
    self.geocodesearch = [[BMKGeoCodeSearch alloc] init]; // 编码服务的初始化(就是获取经纬度,或者获取地理位置服务)
    self.geocodesearch.delegate = self;
    NSLog(@"定位的经度:%f,定位的纬度:%f",_locService.userLocation.location.coordinate.longitude,_locService.userLocation.location.coordinate.latitude);
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 60, 40);
    [button setTitle:@"获取地址" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button addTarget:self action:@selector(onClickReverseGeocode) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = item;
}
//  没什么用 
-(void)heheda:(UIButton *)btn{
    NSLog(@"进入普通定位态");
    NSLog(@"定位的经度:%f,定位的纬度:%f",_locService.userLocation.location.coordinate.longitude,_locService.userLocation.location.coordinate.latitude);
    self.lon.text = [NSString stringWithFormat:@"%f",_locService.userLocation.location.coordinate.longitude];
    [self.lat setText:[NSString stringWithFormat:@"%f",_locService.userLocation.location.coordinate.latitude]];
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
    
    _mapView.centerCoordinate = userLocation.location.coordinate;
    _mapView.zoomLevel = 18;
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
        NSString* showmeg;
        titleStr = @"反向地理编码";
        showmeg = [NSString stringWithFormat:@"%@",item.title];
        NSLog(@"showmeg : %@",showmeg);
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:titleStr message:showmeg delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定",nil];
        [myAlertView show];
        
    }
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
