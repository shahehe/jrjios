//
//  AppDelegate.m
//  financialDistrict
//
//  Created by USTB on 13-3-11.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import "AppDelegate.h"
#import "UIColor+NavigationColor.h"
#import "UIDevice+IdentifierAddition.h"
#import "GovViewController.h"

@implementation AppDelegate
@synthesize mapManager;
@synthesize mosquittoClient;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    mapManager = [[BMKMapManager alloc] init];
    BOOL ret = [mapManager start:@"CDC57B124063686C456239FF2D8378D0F8DAA474" generalDelegate:nil];
    if(!ret){
        NSLog(@"Map manager start failed");
    }
    
    [self customApperance];
    // Override point for customization after application launch.
    return YES;
}



- (void) customApperance
{
    // Set background picture for all view controllers
    self.window.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundrep.png"]];
    
    // Set the tab bar appearance

    [[UITabBar appearance] setTintColor:[UIColor blackColor]];
    [[UITabBar appearance] setSelectedImageTintColor:[UIColor whiteColor]];
    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"tabbar_bg2.png"]];
    [[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"tabbar_selection.png"]];
    
    [[UITabBarItem appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIColor darkGrayColor], UITextAttributeTextColor,
      [UIFont fontWithName:@"font" size:0.0], UITextAttributeFont,
      nil]
                                             forState:UIControlStateNormal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIColor whiteColor], UITextAttributeTextColor,
      [UIFont fontWithName:@"font" size:0.0], UITextAttributeFont,
      nil]
                                             forState:UIControlStateSelected];
    
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
