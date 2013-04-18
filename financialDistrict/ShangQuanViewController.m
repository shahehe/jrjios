//
//  ShangQuanViewController.m
//  financialDistrict
//
//  Created by USTB on 13-4-16.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import "ShangQuanViewController.h"
#import "CheckConnection.h"

@interface ShangQuanViewController ()

@end

@implementation ShangQuanViewController

@synthesize sqWebView;

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

        [sqWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://jrjsq.chinaec.net"]]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
