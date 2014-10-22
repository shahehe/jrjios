//
//  CommerceInfoViewController.m
//  financialDistrict
//
//  Created by USTB on 13-6-13.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import "CommerceInfoViewController.h"

@interface CommerceInfoViewController ()

@end

@implementation CommerceInfoViewController
@synthesize itemObj;
@synthesize contentView;


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
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
    temporaryBarButtonItem.title = @"返回";
    self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
    //[self.view setBackgroundColor:[UIColor clearColor]];
    [self.contentView setText:[self.itemObj valueForKey:@"content"]];
    [self.name setText:[self.itemObj valueForKey:@"title"]];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
