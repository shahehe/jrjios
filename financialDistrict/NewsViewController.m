//
//  NewsViewController.m
//  financialDistrict
//
//  Created by USTB on 13-3-11.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import "NewsViewController.h"
#import "UIColor+NavigationColor.h"
#import "UIDevice+IdentifierAddition.h"


@interface NewsViewController ()

@end

@implementation NewsViewController
@synthesize mosquittoClient;

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
    
    NSString *clientId = [NSString stringWithFormat:@"marquette_%@", [[UIDevice currentDevice] uniqueDeviceIdentifier]];
	NSLog(@"Client ID: %@", clientId);
    mosquittoClient = [[MosquittoClient alloc] initWithClientId:clientId];
	[mosquittoClient setDelegate: self];
    [super viewDidLoad];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
    temporaryBarButtonItem.title = @"返回";
    self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
    
    self.view.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.tintColor = [UIColor NaviColor];
    
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[UIColor blackColor],[UIFont systemFontOfSize:20.0f],[UIColor colorWithWhite:0.0 alpha:1], nil] forKeys:[NSArray arrayWithObjects:UITextAttributeTextColor,UITextAttributeFont,UITextAttributeTextShadowColor, nil]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
- (IBAction)connectButtonPressed:(id)sender {
    [mosquittoClient publishString:@"kakakaka" toTopic:@"di" withQos:0 retain:YES];
    [mosquittoClient setHost: @"test.mosquitto.org"];
	[mosquittoClient connect];
    
    [mosquittoClient subscribe:@"di"];
    [mosquittoClient subscribe:@"#"];
}
*/

- (void) didConnect:(NSUInteger)code {
	NSLog(@"did connect");
}

- (void) didDisconnect {
	NSLog(@"did disconnect");
}

- (void) didReceiveMessage:(MosquittoMessage*) mosq_msg {
    
	NSLog(@"%@ => %@", mosq_msg.topic, mosq_msg.payload);
 
}

- (void) didPublish: (NSUInteger)messageId {}
- (void) didSubscribe: (NSUInteger)messageId grantedQos:(NSArray*)qos {}
- (void) didUnsubscribe: (NSUInteger)messageId {}



@end
