//
//  TextOfYuXiangViewController.m
//  financialDistrict
//
//  Created by USTB on 13-3-14.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import "TextOfYuXiangViewController.h"
#import "DaoHangViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "BMapKit.h"


@interface TextOfYuXiangViewController ()

@end

@implementation TextOfYuXiangViewController

@synthesize yxWebView;
@synthesize htmlNum;
@synthesize gps;

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
    self.navigationItem.title = @"宇翔图册";

	// Do any additional setup after loading the view.
    
    
    NSString* fileName = [NSString stringWithFormat:@"%d",htmlNum];
    
    NSString* path = [[NSBundle mainBundle] pathForResource:fileName
                                                     ofType:@"html"];

    
    [yxWebView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path
                                                                 isDirectory:NO]]];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(gotoAction:)];
    

}

-(void)gotoAction:(id)sender
{
    NSArray *gs = [self.gps componentsSeparatedByString:@","];
    CGFloat lat = [[gs objectAtIndex:1] floatValue];
    CGFloat lng = [[gs objectAtIndex:0] floatValue];
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(lat, lng);
    DaoHangViewController *v = [[DaoHangViewController alloc] init];
    v.gps = coordinate;
    [self.navigationController pushViewController:v animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
