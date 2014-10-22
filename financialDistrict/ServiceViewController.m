//
//  ServiceViewController.m
//  financialDistrict
//
//  Created by USTB on 13-4-16.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import "ServiceViewController.h"
#import "CheckConnection.h"

@interface ServiceViewController ()

@end

@implementation ServiceViewController
@synthesize serviceWebView;

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
    if([CheckConnection connected]){

        [serviceWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www3.bjxch.gov.cn/jsp/theme/index.jsp"]]];
    }
    serviceWebView.ScalesPageToFit = true;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
