//
//  TextOfYuXiangViewController.h
//  financialDistrict
//
//  Created by USTB on 13-3-14.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "BMapKit.h"

@interface TextOfYuXiangViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *yxWebView;
@property int htmlNum;
@property (nonatomic,retain) IBOutlet NSString *gps;

@end
