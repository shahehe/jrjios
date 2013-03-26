//
//  SuggestionViewController.m
//  financialDistrict
//
//  Created by USTB on 13-3-15.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import "SuggestionViewController.h"
#import "UIColor+NavigationColor.h"


@interface SuggestionViewController ()

@end

@implementation SuggestionViewController
@synthesize imageToUpload;
@synthesize placeInfo;
@synthesize returnedLatitude;
@synthesize returnedLongitude;
@synthesize hasPlaceInfo;

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
