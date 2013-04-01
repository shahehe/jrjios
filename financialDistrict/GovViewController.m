//
//  GovViewController.m
//  financialDistrict
//
//  Created by USTB on 13-3-26.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import "GovViewController.h"


#import "InfoViewController.h"
#import "IntroViewController.h"
#import "ProcedureViewController.h"
#import "GongShangViewController.h"
#import "PhoneViewController.h"
#import "YuXiangViewController.h"
#import "StringsJsonParser.h"
#import "UIColor+NavigationColor.h"
#import "RewardViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface GovViewController ()

@property (nonatomic,strong) NSMutableArray *procedureArray;
@property (nonatomic,strong) NSMutableArray *gongshangArray;
@property (nonatomic,strong) NSMutableArray *phoneNamesArray;
@property (nonatomic,strong) NSMutableArray *phoneNumbersArray;


@end

@implementation GovViewController

@synthesize infoMenu;
@synthesize stringsDictionary;
@synthesize procedureArray;
@synthesize gongshangArray;
@synthesize phoneNamesArray;
@synthesize phoneNumbersArray;


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
    
    stringsDictionary = [StringsJsonParser parseStringsJson:@"strings"];
    NSArray *dicArray = [stringsDictionary objectForKey:@"string-array"];
    for(NSDictionary* dic in dicArray){
        if([[dic valueForKey:@"name"] isEqualToString:@"procedure_array"]){
            procedureArray = [dic valueForKey:@"item"];
        }
        else if([[dic valueForKey:@"name"] isEqualToString:@"gongshang_array"]){
            gongshangArray = [dic valueForKey:@"item"];
        }
        else if([[dic valueForKey:@"name"] isEqualToString:@"phone_names"]){
            phoneNamesArray = [dic valueForKey:@"item"];
        }
        else if([[dic valueForKey:@"name"] isEqualToString:@"phone_nums"]){
            phoneNumbersArray = [dic valueForKey:@"item"];
        }
        
    }
    
    self.view.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.tintColor = [UIColor NaviColor];
    [[UIBarButtonItem appearance] setTintColor: [UIColor blackColor]];
    
    
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[UIColor blackColor],[UIFont systemFontOfSize:20.0f],[UIColor colorWithWhite:0.0 alpha:1], nil] forKeys:[NSArray arrayWithObjects:UITextAttributeTextColor,UITextAttributeFont,UITextAttributeTextShadowColor, nil]];
    
/*
    self.tabBarController.tabBar.tintColor = [UIColor NaviColor];
    self.tabBarController.tabBar.selectedImageTintColor = [UIColor blackColor];

 */
/*
    NSString *tab1ImagePath = [[NSBundle mainBundle] pathForResource:@"tab1_black"
                                                          ofType:@"png"];
    self.tabBarController.tabBar.backgroundImage = [UIImage imageWithContentsOfFile:tab1ImagePath];
 */   

}

- (IBAction)button0:(id)sender {
    IntroViewController *introVC = [self.storyboard instantiateViewControllerWithIdentifier:@"IntroVC"];
    [self.navigationController pushViewController:introVC animated:YES];
}

- (IBAction)button1:(id)sender {
    ProcedureViewController *procedureVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ProcedureVC"];
    procedureVC.procedureMenu =procedureArray;
    [self.navigationController pushViewController:procedureVC animated:YES];
}
- (IBAction)button2:(id)sender {
    PhoneViewController *phoneVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PhoneVC"];
    phoneVC.contactsMenu =phoneNamesArray;
    phoneVC.numbersMenu =phoneNumbersArray;
    [self.navigationController pushViewController:phoneVC animated:YES];
}
- (IBAction)button3:(id)sender {
    YuXiangViewController *yxVC = [self.storyboard instantiateViewControllerWithIdentifier:@"YuXiangVC"];
    [self.navigationController pushViewController:yxVC animated:YES];
}

- (IBAction)button4:(id)sender {
    GongShangViewController *gongshangVC = [self.storyboard instantiateViewControllerWithIdentifier:@"GongShangVC"];
    gongshangVC.gongshangMenu =gongshangArray;
    [self.navigationController pushViewController:gongshangVC animated:YES];
}
- (IBAction)button5:(id)sender {
    
    RewardViewController *rVC = [self.storyboard instantiateViewControllerWithIdentifier:@"rVC"];
    [self.navigationController pushViewController:rVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
