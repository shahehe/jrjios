//
//  RehabContextViewController.h
//  financialDistrict
//
//  Created by USTB on 13-5-22.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RehabContextViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *rehabWeb;
@property (strong,nonatomic) NSString *htmlName;

@end
