//
//  SuggestionViewController.h
//  financialDistrict
//
//  Created by USTB on 13-3-15.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SuggestionViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate> 
@property (weak, nonatomic) IBOutlet UIImageView *imageToUpload;
@property (weak, nonatomic) IBOutlet UILabel *placeInfo;
@property double returnedLatitude;
@property double returnedLongitude;
@property BOOL hasPlaceInfo;

@end
