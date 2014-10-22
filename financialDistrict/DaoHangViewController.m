//
//  DaoHangViewController.m
//  financialDistrict
//
//  Created by 廖兴旺 on 14/10/22.
//  Copyright (c) 2014年 USTB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DaoHangViewController.h"

@implementation DaoHangViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    _mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    self.view = _mapView;
    self.title = @"地图";
    self.navigationItem.rightBarButtonItem = nil;

    //设置地图缩放级别
    [_mapView setZoomLevel:12];
    
    BMKCoordinateRegion region;
    region.center = self.gps;
    region.span.latitudeDelta = 0.005;
    region.span.longitudeDelta = 0.005;
    _mapView.region = region;
    
    _locService = [[BMKLocationService alloc]init];
    _locService.delegate = self;
    [_locService startUserLocationService];
    _mapView.showsUserLocation = NO;//先关闭显示的定位图层
    _mapView.userTrackingMode = BMKUserTrackingModeNone;//设置定位的状态
    _mapView.showsUserLocation = YES;//显示定位图层
}
-(void)gotoAction:(id)sender
{
    //初始化调启导航时的参数管理类
    BMKNaviPara* para = [[BMKNaviPara alloc]init];
    //指定导航类型
    para.naviType = BMK_NAVI_TYPE_WEB;
    
    //初始化起点节点
    BMKPlanNode* start = [[BMKPlanNode alloc]init];
    //指定起点经纬度
    start.pt = _userLocation.location.coordinate;
    //指定起点名称
    start.name = @"当位置";
    //指定起点
    para.startPoint = start;
//    //初始化终点节点
    BMKPlanNode* end = [[BMKPlanNode alloc]init];
    end.pt = self.gps;
    para.endPoint = end;
//    //指定终点名称
    end.name = @"okokok";
    //指定调启导航的app名称
//    para.appName = [NSString stringWithFormat:@"%@", @"testAppName"];
    //调启web导航
    [BMKNavigation openBaiduMapNavigation:para];
    //[para release];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //[self.ownMapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
    annotation.coordinate = self.gps;
    annotation.title = @"这里是北京";
    [_mapView addAnnotation:annotation];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
}

/**
 *用户方向更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    //[_mapView updateLocationData:userLocation];
    //NSLog(@"heading is %@",userLocation.heading);
}

/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserLocation:(BMKUserLocation *)userLocation
{
    //    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    [_mapView updateLocationData:userLocation];
    _userLocation = userLocation;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"导航" style:UIBarButtonItemStylePlain target:self action:@selector(gotoAction:)];
}

@end