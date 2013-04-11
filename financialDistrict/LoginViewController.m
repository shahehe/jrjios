//
//  LoginViewController.m
//  financialDistrict
//
//  Created by USTB on 13-3-11.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import "LoginViewController.h"
#import "UIColor+NavigationColor.h"
#import "ApiService.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize userName;
@synthesize passWord;
@synthesize userNameView;
@synthesize pwView;


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
    userName.backgroundColor = [UIColor whiteColor];
    userName.delegate = self;
    passWord.backgroundColor = [UIColor whiteColor];
    passWord.delegate = self;
    [passWord setSecureTextEntry:YES];

    userNameView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    userNameView.layer.borderWidth = 1.0f;
    pwView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    pwView.layer.borderWidth = 1.0f;
    
    
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
    temporaryBarButtonItem.title = @"返回";
    self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
    
    self.view.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.tintColor = [UIColor NaviColor];
    
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[UIColor blackColor],[UIFont systemFontOfSize:20.0f],[UIColor colorWithWhite:0.0 alpha:1], nil] forKeys:[NSArray arrayWithObjects:UITextAttributeTextColor,UITextAttributeFont,UITextAttributeTextShadowColor, nil]];
}


- (void) textFieldDidBeginEditing:(UITextField *)textField
{
    if(textField == userName){
        userNameView.layer.borderColor = [UIColor orangeColor].CGColor;
    }
    else if(textField == passWord){
        pwView.layer.borderColor = [UIColor orangeColor].CGColor;
    }
}


-(void) textFieldDidEndEditing:(UITextField *)textField
{
    if(textField == userName){
        userNameView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
    else if(textField == passWord){
        pwView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
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
    NSString *registerUrl =[NSString stringWithFormat:@"http://%@/jrj/register.php",[ApiService sharedInstance].host];
    
    [registerRequest setURL:[NSURL URLWithString:registerUrl]];
    [registerRequest setHTTPMethod:@"POST"];   
    
    NSString *post = [NSString stringWithFormat:@"name=%@&password=%@&deviceid=%@",userName.text,passWord.text, @"IOS"];
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
    NSString *loginUrl =[NSString stringWithFormat:@"http://%@/jrj/login.php",[ApiService sharedInstance].host];
    
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
