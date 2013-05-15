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
@synthesize ownMapView;
@synthesize pointLatitude;
@synthesize pointLongitude;

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
    //ownMapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, 320, 367)];
    
    ownMapView.frame = self.view.bounds;
    ownMapView.autoresizingMask = self.view.autoresizingMask;
    
    ownMapView.delegate = self;
    [ownMapView setShowsUserLocation:YES];
    
    
    //add a long press gesture recognizer
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                                                            action:@selector(addAnnotationForMap:)];
    //the corresponding action is in the addAnnotationForMap function
    [longPress setMinimumPressDuration:0.8];
    [ownMapView addGestureRecognizer:longPress];
    
}


- (void)mapView:(BMKMapView *)mapView didUpdateUserLocation:(BMKUserLocation *)userLocation
{
    CLLocationCoordinate2D coor;
    coor.latitude                   = userLocation.coordinate.latitude;
    coor.longitude                  = userLocation.coordinate.longitude;
    [mapView setCenterCoordinate:coor animated:YES];
	if (userLocation != nil) {
		//NSLog(@"%f %f", userLocation.location.coordinate.latitude, userLocation.location.coordinate.longitude);
	}
    pointLatitude = userLocation.location.coordinate.latitude;
    pointLongitude = userLocation.location.coordinate.longitude;
    [mapView setShowsUserLocation:NO];
	
}

- (void)mapViewDidStopLocatingUser:(BMKMapView *)mapView
{
    if (mapView.userLocation != nil) {
		//NSLog(@"Stop~~ %f %f", mapView.userLocation.location.coordinate.latitude, mapView.userLocation.location.coordinate.longitude);
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
        
        CLLocationCoordinate2D coo = [ownMapView convertPoint:point toCoordinateFromView:ownMapView];
    
        //NSLog(@"此点经纬度:%lf, %lf", coo.longitude,  coo.latitude);
        
        //Add annotation for this point
        NSMutableArray *annotationToRemove = [[NSMutableArray alloc] initWithArray: ownMapView.annotations];
        [annotationToRemove removeObject:ownMapView.userLocation];
        if(annotationToRemove != nil){
            [ownMapView removeAnnotations:annotationToRemove];
        }
        BMKPointAnnotation *currentAnnotation = [[BMKPointAnnotation alloc] init];
        currentAnnotation.coordinate = coo;
        currentAnnotation.title = @"采用此位置";
        NSString * info= [NSString stringWithFormat:@"此点位置：%f, %f",coo.latitude, coo.longitude];
        [ownMapView addAnnotation:currentAnnotation];
        
        UIAlertView *placeNotification = [[UIAlertView alloc] initWithTitle:@"确认地点" message:info delegate:nil cancelButtonTitle:@"好" otherButtonTitles:@"取消", nil];
        
        [placeNotification show];
        
        pointLatitude = coo.latitude;
        pointLongitude = coo.longitude;
    }
}


//百度地图的annotation泡泡会在移动中突然消失，再移动又回来，sdk的bug
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation{
    
    if ([annotation isKindOfClass:[BMKUserLocation class]]) {
        return nil;
    }
   
    static NSString *AnnotationViewID = @"annotatioID";
    BMKPinAnnotationView *newAnnotation =(BMKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationViewID];
    if(newAnnotation == nil){
        newAnnotation = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID];
    }
    newAnnotation.pinColor = BMKPinAnnotationColorGreen;
    return newAnnotation;
}


- (void) viewWillDisappear:(BOOL)animated{
    int currentVCIndex = [self.navigationController.viewControllers indexOfObject:self.navigationController.topViewController];
    
    UIViewController *pa = [self.navigationController.viewControllers objectAtIndex:currentVCIndex];

    if([pa isKindOfClass:[SuggestionViewController class]]){
        SuggestionViewController *parent = (SuggestionViewController *)pa;
        parent.returnedLatitude = pointLatitude;
        parent.returnedLongitude = pointLongitude;
        parent.hasPlaceInfo = TRUE;
    }
    
}

@end
