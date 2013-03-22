//
//  MapViewController.m
//  financialDistrict
//
//  Created by USTB on 13-3-22.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    BMKMapView *mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    self.view = mapView;
    mapView.delegate = self;
    [mapView setShowsUserLocation:YES];
    
    
    //add a long press gesture recognizer
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(addAnnotationForMap:)];    //the corresponding action is in the addAnnotationForMap function
    
    [longPress setMinimumPressDuration:0.8];
    [mapView addGestureRecognizer:longPress];
    
}


- (void)mapView:(BMKMapView *)mapView didUpdateUserLocation:(BMKUserLocation *)userLocation
{
    CLLocationCoordinate2D coor;
    coor.latitude                   = userLocation.coordinate.latitude;
    coor.longitude                  = userLocation.coordinate.longitude;
    [mapView setCenterCoordinate:coor animated:YES];
	if (userLocation != nil) {
		NSLog(@"%f %f", userLocation.location.coordinate.latitude, userLocation.location.coordinate.longitude);
	}
    [mapView setShowsUserLocation:NO];
	
}

- (void)mapViewDidStopLocatingUser:(BMKMapView *)mapView
{
    if (mapView.userLocation != nil) {
		NSLog(@"Stop~~ %f %f", mapView.userLocation.location.coordinate.latitude, mapView.userLocation.location.coordinate.longitude);
	}
    BMKUserLocation *userLocation = mapView.userLocation;
    [mapView addAnnotation:userLocation];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) addAnnotationForMap:(UILongPressGestureRecognizer*)press {
    
    if (press.state == UIGestureRecognizerStateEnded) {
        return;
    }
    else if (press.state == UIGestureRecognizerStateBegan) {
        CGPoint point = [press locationInView:self.view];
        
      //  CLLocationCoordinate2D coo = [self.view convertPoint:point toCoordinateFromView:self.view];
    
      //  NSLog(@"经纬度:%lf, %lf", coo.longitude,  coo.latitude);
        NSLog(@"调用一次");
        NSLog(@"%f,%f",point.x,point.y);
    }

}
@end
