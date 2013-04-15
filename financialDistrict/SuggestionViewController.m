//
//  SuggestionViewController.m
//  financialDistrict
//
//  Created by USTB on 13-3-15.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import "SuggestionViewController.h"
#import "UIColor+NavigationColor.h"
#import <QuartzCore/QuartzCore.h>
#import "StringsJsonParser.h"
#import "ApiService.h"


@interface SuggestionViewController (){

    BOOL firstWriteDescription;
    NSMutableData *dataFromRequest2;
    UIActivityIndicatorView *uploadActivity;

}
@end

@implementation SuggestionViewController

@synthesize imageToUpload;
@synthesize placeInfo;
@synthesize returnedLatitude;
@synthesize returnedLongitude;
@synthesize hasPlaceInfo;
@synthesize phoneContact;
@synthesize problemDescription;
@synthesize feedbackButton;
@synthesize needFeedback;


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
    hasPlaceInfo = FALSE;
    self.view.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.tintColor = [UIColor NaviColor];
    
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[UIColor blackColor],[UIFont systemFontOfSize:20.0f],[UIColor colorWithWhite:0.0 alpha:1], nil] forKeys:[NSArray arrayWithObjects:UITextAttributeTextColor,UITextAttributeFont,UITextAttributeTextShadowColor, nil]];
    [self customText];
    firstWriteDescription = YES;
    
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
    temporaryBarButtonItem.title = @"返回";
    self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
    
}

- (void)viewWillAppear:(BOOL)animated{
    if(!hasPlaceInfo){
        [placeInfo setAlpha:0.0];
    }
    else{
        placeInfo.text = [NSString stringWithFormat:@"位置%f,%f",returnedLatitude,returnedLongitude];
        [placeInfo setAlpha:0.0];
        [UIView animateWithDuration:1.0
                              delay:0.1
                            options:UIViewAnimationCurveLinear | UIViewAnimationOptionAllowUserInteraction
                         animations:^(void){[placeInfo setAlpha:1.0];}
                         completion:^(BOOL finished){
                                    if(finished)
                                    {
                                        [UIView animateWithDuration:1.5
                                                              delay:0.5
                                                            options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction
                                                         animations:^(void){[placeInfo setAlpha:0.0];}
                                                         completion:^(BOOL finished){}];
                                    }
                         }
         ];
        hasPlaceInfo = FALSE;
    }
    
    
}


- (void)customText{
    phoneContact.backgroundColor = [UIColor whiteColor];
    phoneContact.delegate = self;
    UIView *paddingView           = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    phoneContact.leftView             = paddingView;
    phoneContact.leftViewMode         = UITextFieldViewModeAlways;
    
    [[problemDescription layer] setBorderColor:[UIColor clearColor].CGColor];
    problemDescription.layer.borderWidth = 1.5f;
    problemDescription.text = @"描述";
    problemDescription.textColor = [UIColor lightGrayColor];
    problemDescription.delegate = self;
       
}

- (void) textFieldDidBeginEditing:(UITextField *)textField
{
    phoneContact.layer.borderWidth = 1.5f;
    phoneContact.layer.borderColor = [UIColor orangeColor].CGColor;
}


-(void) textFieldDidEndEditing:(UITextField *)textField
{
    phoneContact.layer.borderColor = [UIColor clearColor].CGColor;
}



- (void) textViewDidBeginEditing:(UITextView *)textView
{
    [[problemDescription layer] setBorderColor:[UIColor orangeColor].CGColor];
    problemDescription.textColor = [UIColor blackColor];
        
    if(firstWriteDescription){
            problemDescription.text = @"";
    }
}


- (void) textViewDidChange:(UITextView *)textView
{
    if(problemDescription.text.length == 0){
        problemDescription.textColor = [UIColor lightGrayColor];
        problemDescription.text = @"描述";
        [problemDescription resignFirstResponder];
        firstWriteDescription = YES;
    }
}

- (void) textViewDidEndEditing:(UITextView *)textView
{
    [[problemDescription layer] setBorderColor:[UIColor clearColor].CGColor];
    firstWriteDescription = NO;

}

//close the keyboard
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.phoneContact endEditing:YES];
    [self.problemDescription endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)useCamera:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.allowsEditing = NO;
        imagePicker.delegate = self;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"相机无法使用" delegate:nil cancelButtonTitle:@"关闭" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (IBAction)usePhoto:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]){
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        imagePicker.allowsEditing = NO;
        imagePicker.delegate = self;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"无法启用照片" delegate:nil cancelButtonTitle:@"关闭" otherButtonTitles:nil, nil];
        [alert show];
    }

}


#pragma UIImagePickerController Delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissViewControllerAnimated:YES completion:nil];
    imageToUpload.image = [info objectForKey:UIImagePickerControllerOriginalImage];
}


- (IBAction)feedbackNeeded:(id)sender {
    
    if (needFeedback == 0){
        [feedbackButton setSelected:YES];
        needFeedback = YES;
    }
    else {
        [feedbackButton setSelected:NO];
        needFeedback = NO;
        }

}


- (IBAction)uploadSuggestion:(id)sender {
    /*
	 turning the image into a NSData object
	 getting the image back out of the UIImageView
	 setting the quality to 90
     */
    
    NSData *imageData = UIImageJPEGRepresentation(imageToUpload.image, 0.000000001);
    NSData *phoneData = [[NSString stringWithFormat:@"%@",phoneContact.text] dataUsingEncoding:NSUTF8StringEncoding];
    NSData *problemData = [[NSString stringWithFormat:@"%@",problemDescription.text] dataUsingEncoding:NSUTF8StringEncoding];   
    NSMutableArray *dataArray = [[NSMutableArray alloc]initWithObjects:imageData,phoneData,problemData, nil];
    
    
    HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:HUD];
    HUD.delegate = self;
    HUD.labelText = @"正在上传";
    [HUD showWhileExecuting:@selector(uploadTask:) onTarget:self withObject:dataArray animated:YES];
    
}


-(void) uploadTask:(NSMutableArray *) infoArray{

    
	// setting up the URL to post to
    NSString *urlString =[NSString stringWithFormat:@"http://%@/jrj/receiveMessage.php",[ApiService sharedInstance].host];
    NSString *imageName = @"image.jpg";
	
	// setting up the request object now
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
	[request setURL:[NSURL URLWithString:urlString]];
	[request setHTTPMethod:@"POST"];
	
	/*
	 add some header info now
	 we always need a boundary when we post a file
	 also we need to set the content type
	 
	 might change to random boundary
     */
	NSString *boundary = @"---------------------------147378098314664";
	NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
	[request addValue:contentType forHTTPHeaderField: @"Content-Type"];
	
	/*
	 now lets create the body of the post
     */
	NSMutableData *body = [NSMutableData data];
    
    /*
     set latitude,longitude,feedback,name,mobile,address,create_time value
     */
    
    //latitude
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[@"Content-Disposition: form-data; name=\"latitude\"\n\n " dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[[NSString stringWithFormat:@"%f",returnedLatitude] dataUsingEncoding:NSUTF8StringEncoding]];
    //longitude
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[@"Content-Disposition: form-data; name=\"longitude\"\n\n " dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[[NSString stringWithFormat:@"%f",returnedLongitude] dataUsingEncoding:NSUTF8StringEncoding]];
    //feedback
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[@"Content-Disposition: form-data; name=\"feedback\"\n\n " dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[[NSString stringWithFormat:@"%d",needFeedback] dataUsingEncoding:NSUTF8StringEncoding]];
    //mobile
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[@"Content-Disposition: form-data; name=\"mobile\"\n\n " dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:infoArray[1]];
    //address
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[@"Content-Disposition: form-data; name=\"address\"\n\n " dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:infoArray[2]];
    //create_time
    NSDate* currentDate = [NSDate date];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[@"Content-Disposition: form-data; name=\"create_time\"\n\n " dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[[NSString stringWithFormat:@"%@",[currentDate description]] dataUsingEncoding:NSUTF8StringEncoding]];
    //uid
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[@"Content-Disposition: form-data; name=\"uid\"\n\n " dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[[NSString stringWithFormat:@"0"] dataUsingEncoding:NSUTF8StringEncoding]];
    //name
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[@"Content-Disposition: form-data; name=\"name\"\n\n " dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[[NSString stringWithFormat:@"MyName"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    /*
     set picture
     */
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[[NSString stringWithFormat: @"Content-Disposition: form-data; name=\"file\"; filename=\"%@\"\r\n",imageName] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:infoArray[0]];
	[body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	// setting the body of the post to the reqeust
	[request setHTTPBody:body];
    
	// now lets make the connection to the web
	NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
	NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
	
	NSLog(@"%@",returnString);
    
    
    /*
     Picture has been uploaded, and info has been inserted
     Now parse the return dictionary using JSON parser
     send to feedback.php if success
     */
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
    
    if([[outputDic objectForKey:@"code"] integerValue] == 1){
        [self showAlert:@"上传成功"];
        
        //connect to feedback.php
        
        [self performSelectorOnMainThread:@selector(connectFeedback) withObject:nil waitUntilDone:YES];

        
    }
    else {
        NSLog(@"The return value from receiveMessage is failure");
        [self showAlert:@"上传不成功"];
    }

}

-(void) connectFeedback{
    
    NSMutableURLRequest *request2 = [[NSMutableURLRequest alloc] init];
    NSString *url2 =[NSString stringWithFormat:@"http://%@/jrj/feedback.php",[ApiService sharedInstance].host];
    
    [request2 setURL:[NSURL URLWithString:url2]];
    [request2 setHTTPMethod:@"GET"];
    
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request2 delegate:self startImmediately:YES];
    
    if(!connection) {
        NSLog(@"connection to feedback failed :(");
    } else {
        NSLog(@"connection to feedback is set... :)");
        
    }
}

#pragma mark showAlert

- (void) showAlert:(NSString *)messageToDisplay{
    UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:nil message:messageToDisplay delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertV performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:YES];
}


#pragma mark NSURLConnection delegate methods

-(void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    dataFromRequest2 = [[NSMutableData alloc] init];
}

-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [dataFromRequest2 appendData:data];
}

-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"error");
}

-(void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Done with Feedback!");
}

#pragma mark -
#pragma mark MBProgressHUDDelegate methods

- (void)hudWasHidden {
    // Remove HUD from screen when the HUD was hidded
    [HUD removeFromSuperview];
}

@end
