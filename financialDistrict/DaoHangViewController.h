//
//  DaoHangViewController.h
//  financialDistrict
//
//  Created by 廖兴旺 on 14/10/22.
//  Copyright (c) 2014年 USTB. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "BMapKit.h"

@interface DaoHangViewController : UIViewController<BMKMapViewDelegate,BMKLocationServiceDelegate>
{
    IBOutlet BMKMapView* _mapView;
    BMKLocationService* _locService;
    BMKUserLocation *_userLocation;
}
@property(nonatomic,assign) CLLocationCoordinate2D gps;
@end