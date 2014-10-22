//
//  ServiceViewController.h
//  financialDistrict
//
//  Created by USTB on 13-4-16.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface ServiceViewController : UIViewController<MBProgressHUDDelegate>{
    MBProgressHUD *HUD;
}

@property (weak, nonatomic) IBOutlet UIWebView *serviceWebView;

@end
