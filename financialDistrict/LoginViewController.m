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
#import "ReEnterPWViewController.h"
#import "CheckConnection.h"
#import "MessageViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize userName;
@synthesize passWord;
@synthesize userNameView;
@synthesize pwView;
@synthesize confirmedPW;
@synthesize hasConfirmedPW;

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
    hasConfirmedPW = NO;
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
    if([CheckConnection connected])
    {
        if([userName.text isEqualToString:@""]){
            [LoginViewController showAlert:@"注册失败，用户名不能为空"];
        }
        else if([passWord.text isEqualToString:@""]){
            [LoginViewController showAlert:@"注册失败，密码不能为空"];
        }
        else{    
            ReEnterPWViewController *reVC = [self.storyboard instantiateViewControllerWithIdentifier:@"rePWVC"];
            reVC.username = userName.text;
            reVC.pw = passWord.text;
            [self.navigationController pushViewController:reVC animated:YES];
        }
    }

}


- (IBAction)login:(id)sender {
    if([CheckConnection connected]){

        HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
        [self.navigationController.view addSubview:HUD];
        HUD.delegate = self;
        HUD.labelText = @"正在登陆";
        [HUD showWhileExecuting:@selector(loginTask) onTarget:self withObject:nil animated:YES];
    }

}

- (void) loginTask{
    
    if([userName.text isEqualToString:@""]){
        [LoginViewController showAlert:@"登录失败，用户名不能为空"];
    }
    else if([passWord.text isEqualToString:@""]){
        [LoginViewController showAlert:@"登录失败，密码不能为空"];
    }
    else{
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

        NSLog(@"%@",loginReturnString);
        if([LoginViewController successOrNot:loginReturnString] == 0 || [LoginViewController successOrNot:loginReturnString] == -1){
            [LoginViewController showAlert:@"登录失败"];
        }
        else{
            [LoginViewController showAlert:@"登录成功"];

            int uid = [LoginViewController extractUID:loginReturnString];

            NSMutableURLRequest *msgRequest = [[NSMutableURLRequest alloc] init];
            NSString *msgUrl =[NSString stringWithFormat:@"http://%@/jrj/message.php?uid=%d",[ApiService sharedInstance].host,uid];
          //  NSString *msgUrl =[NSString stringWithFormat:@"http://%@/jrj/message.php?uid=13",[ApiService sharedInstance].host];
            
            [msgRequest setURL:[NSURL URLWithString:msgUrl]];
            [msgRequest setHTTPMethod:@"POST"];
            
            NSData *msgReturnData = [NSURLConnection sendSynchronousRequest:msgRequest returningResponse:nil error:nil];
            NSString *msgReturnString = [[NSString alloc] initWithData:msgReturnData encoding:NSUTF8StringEncoding];
            
            
            NSLog(@"%@",msgReturnString);
            
            MessageViewController *msgVC = [self.storyboard instantiateViewControllerWithIdentifier:@"messageVC"];
            msgVC.msgString = msgReturnString;
            [self.navigationController pushViewController:msgVC animated:YES];
            
            
        }
    }
}
/*
 Extract UID
 */

+ (int) extractUID:(NSString *)returnString{
    //parsing
    if(returnString != nil){
        NSDictionary *outputDic = [[NSDictionary alloc] init];
        
        NSData *jsonData = [returnString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingAllowFragments
                                                          error:&error];
        if(jsonObject != nil && error == nil){
            if([jsonObject isKindOfClass:[NSDictionary class]]){
                outputDic = (NSDictionary *)jsonObject;
            }
        }
        
        return [[outputDic objectForKey:@"uid"] integerValue];
    }
    else return (-1);

}

/*
 Showing Alert view when register or login is unsuccessful
 Parsing 
 */
+ (int) successOrNot:(NSString *)returnString{
    //parsing
    if(returnString != nil){
        NSDictionary *outputDic = [[NSDictionary alloc] init];
        
        NSData *jsonData = [returnString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingAllowFragments
                                                          error:&error];
        if(jsonObject != nil && error == nil){
            if([jsonObject isKindOfClass:[NSDictionary class]]){
                outputDic = (NSDictionary *)jsonObject;
            }
        }

    return [[outputDic objectForKey:@"code"] integerValue];
    }
    else return (-1);
}

+ (void) showAlert:(NSString *)messageToDisplay{
    UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:nil message:messageToDisplay delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertV performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:YES];
}

#pragma mark -
#pragma mark MBProgressHUDDelegate methods

- (void)hudWasHidden {
    // Remove HUD from screen when the HUD was hidded
    [HUD removeFromSuperview];
}

@end
