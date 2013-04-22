//
//  AppDelegate.h
//  financialDistrict
//
//  Created by USTB on 13-3-11.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"
#import "MosquittoClient.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) BMKMapManager* mapManager;
@property (strong, nonatomic) MosquittoClient *mosquittoClient;

@end
