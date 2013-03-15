//
//  TextOfProcedureViewController.m
//  financialDistrict
//
//  Created by USTB on 13-3-11.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import "TextOfProcedureViewController.h"

@interface TextOfProcedureViewController ()

@end

@implementation TextOfProcedureViewController


@synthesize fileNumber;
@synthesize titleName;
@synthesize procedureText;
@synthesize procedureTitle;

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
    self.navigationItem.title = @"办事程序";
    
    procedureText.editable = NO;

    NSString* fileName = [NSString stringWithFormat:@"%@%d",@"procedure",fileNumber];
    
    NSString* path = [[NSBundle mainBundle] pathForResource:fileName
                                                     ofType:@""];
    NSString* content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    
    procedureTitle.text = titleName;
    procedureText.text = content;
  

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
