//
//  HealthIntroViewController.m
//  financialDistrict
//
//  Created by USTB on 13-5-22.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import "HealthIntroViewController.h"

@interface HealthIntroViewController ()

@end

@implementation HealthIntroViewController
@synthesize hIntroWebView;

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
    self.navigationItem.title = @"金融街健康服务中心简介";
    
	// Do any additional setup after loading the view.
    
    
    NSString* fileName = @"h01";
    
    NSString* path = [[NSBundle mainBundle] pathForResource:fileName
                                                     ofType:@"htm"];
 
   
    [hIntroWebView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
