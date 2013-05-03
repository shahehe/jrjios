//
//  MapViewController.h
//  financialDistrict
//
//  Created by USTB on 13-3-22.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "BMapKit.h"
#import "SuggestionViewController.h"


@interface MapViewController : UIViewController<BMKMapViewDelegate>
@property (strong, nonatomic) IBOutlet BMKMapView *ownMapView;
@property double pointLatitude;
@property double pointLongitude;


@end
