//
//  TextOfYuXiangViewController.m
//  financialDistrict
//
//  Created by USTB on 13-3-14.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import "TextOfYuXiangViewController.h"

@interface TextOfYuXiangViewController ()

@end

@implementation TextOfYuXiangViewController

@synthesize yxWebView;
@synthesize htmlNum;

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
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
