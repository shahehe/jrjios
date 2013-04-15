//
//  SuggestionViewController.h
//  financialDistrict
//
//  Created by USTB on 13-3-15.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "MBProgressHUD.h"


@interface SuggestionViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate, UITextFieldDelegate, NSURLConnectionDelegate, NSURLConnectionDataDelegate,AVAudioRecorderDelegate,MBProgressHUDDelegate>{
    MBProgressHUD *HUD;
}

@property (strong, nonatomic) AVAudioRecorder *audioRecorder;
@property (weak, nonatomic) IBOutlet UIButton *recordingButton;
@property (weak, nonatomic) IBOutlet UIButton *feedbackButton;

@property (weak, nonatomic) IBOutlet UIImageView *imageToUpload;
@property (weak, nonatomic) IBOutlet UILabel *placeInfo;
@property (weak, nonatomic) IBOutlet UITextField *phoneContact;
@property (weak, nonatomic) IBOutlet UITextView *problemDescription;
@property double returnedLatitude;
@property double returnedLongitude;
@property BOOL hasPlaceInfo;
@property BOOL needFeedback;

@end
