//
//  HealthCategoryViewController.m
//  financialDistrict
//
//  Created by USTB on 13-5-22.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import "HealthCategoryViewController.h"

@interface HealthCategoryViewController ()

@end

@implementation HealthCategoryViewController

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
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
    temporaryBarButtonItem.title = @"返回";
    self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
    [self.view setBackgroundColor:[UIColor clearColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)callHealth:(id)sender {
    
    
    NSString* phoneNum= @"010-66216988"; //亚健康呼叫中心电话
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"telprompt://%@",phoneNum]];
    [[UIApplication  sharedApplication] openURL:url];
}

@end
