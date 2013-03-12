//
//  TextOfGongShangViewController.m
//  financialDistrict
//
//  Created by USTB on 13-3-12.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import "TextOfGongShangViewController.h"

@interface TextOfGongShangViewController ()

@end

@implementation TextOfGongShangViewController

@synthesize fileNumberGS;
@synthesize titleNameGS;
@synthesize gongShangText;

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
    gongShangText.editable = NO;
    NSString* fileName = [NSString stringWithFormat:@"gongshang%d",fileNumberGS];
    NSString* path = [[NSBundle mainBundle] pathForResource:fileName
                                                     ofType:@""];
    NSString* content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding error:NULL];
    gongShangText.text = [NSString stringWithFormat:@"%@\n%@",titleNameGS,content];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
