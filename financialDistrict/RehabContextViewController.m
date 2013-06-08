//
//  RehabContextViewController.m
//  financialDistrict
//
//  Created by USTB on 13-5-22.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import "RehabContextViewController.h"

@interface RehabContextViewController ()

@end

@implementation RehabContextViewController
@synthesize rehabWeb;
@synthesize htmlName;

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
    NSString* fileName = htmlName;
    
    NSString* path = [[NSBundle mainBundle] pathForResource:fileName
                                                     ofType:@"htm"];
    
    
    [rehabWeb loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
