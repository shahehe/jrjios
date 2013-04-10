//
//  LoginViewController.m
//  financialDistrict
//
//  Created by USTB on 13-3-11.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import "LoginViewController.h"
#import "UIColor+NavigationColor.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize userName;
@synthesize passWord;

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
    
    self.view.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.tintColor = [UIColor NaviColor];
    
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[UIColor blackColor],[UIFont systemFontOfSize:20.0f],[UIColor colorWithWhite:0.0 alpha:1], nil] forKeys:[NSArray arrayWithObjects:UITextAttributeTextColor,UITextAttributeFont,UITextAttributeTextShadowColor, nil]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//close the keyboard
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.userName endEditing:YES];
    [self.passWord endEditing:YES];
}

- (IBAction)registerUser:(id)sender {
    
    NSMutableURLRequest *registerRequest = [[NSMutableURLRequest alloc] init];
    NSString *registerUrl = @"http://64.150.161.193/jrj/register.php";
    
    [registerRequest setURL:[NSURL URLWithString:registerUrl]];
    [registerRequest setHTTPMethod:@"POST"];   
    
    NSString *post = [NSString stringWithFormat:@"name=%@&password=%@&deviceid=%@&email=1@gmail.coms",userName.text,passWord.text, [[UIDevice currentDevice] uniqueDeviceIdentifier]];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];

    [registerRequest setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [registerRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [registerRequest setHTTPBody:postData];
    
    NSData *registerReturnData = [NSURLConnection sendSynchronousRequest:registerRequest returningResponse:nil error:nil];
	NSString *registerReturnString = [[NSString alloc] initWithData:registerReturnData encoding:NSUTF8StringEncoding];
	
	NSLog(@"%@",[NSString stringWithUTF8String:[registerReturnString cStringUsingEncoding:NSUTF8StringEncoding]]);

}

- (IBAction)login:(id)sender {
    
    
    NSMutableURLRequest *loginRequest = [[NSMutableURLRequest alloc] init];
    NSString *loginUrl = @"http://64.150.161.193/jrj/login.php";
    
    [loginRequest setURL:[NSURL URLWithString:loginUrl]];
    [loginRequest setHTTPMethod:@"POST"];    
    
    NSString *post2 = [NSString stringWithFormat:@"name=%@&password=%@",userName.text,passWord.text];

    NSData *postData2 = [post2 dataUsingEncoding:NSASCIIStringEncoding];
    
    NSString *postLength2 = [NSString stringWithFormat:@"%d", [postData2 length]];
    
    [loginRequest setValue:postLength2 forHTTPHeaderField:@"Content-Length"];
    [loginRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [loginRequest setHTTPBody:postData2];
    
    NSData *loginReturnData = [NSURLConnection sendSynchronousRequest:loginRequest returningResponse:nil error:nil];
	NSString *loginReturnString = [[NSString alloc] initWithData:loginReturnData encoding:NSUTF8StringEncoding];
	

	NSLog(@"%@",[NSString stringWithUTF8String:[loginReturnString cStringUsingEncoding:NSUTF8StringEncoding]]);
}

@end
