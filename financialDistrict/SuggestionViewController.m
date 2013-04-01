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

@interface SuggestionViewController (){

    BOOL firstWriteDescription;

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
                                                              delay:0.8
                                                            options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction
                                                         animations:^(void){[placeInfo setAlpha:0.0];}
                                                         completion:^(BOOL finished){}];
                                    }
                         }
         ];
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



@end
