//
//  LoginViewController.h
//  financialDistrict
//
//  Created by USTB on 13-3-11.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIDevice+IdentifierAddition.h"
#import <QuartzCore/QuartzCore.h>


@interface LoginViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
@property (weak, nonatomic) IBOutlet UIView *userNameView;
@property (weak, nonatomic) IBOutlet UIView *pwView;

@end
