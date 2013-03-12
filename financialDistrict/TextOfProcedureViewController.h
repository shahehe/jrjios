//
//  TextOfProcedureViewController.h
//  financialDistrict
//
//  Created by USTB on 13-3-11.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextOfProcedureViewController : UIViewController

@property  int fileNumber;
@property  (strong,nonatomic) NSString* titleName;


@property (weak, nonatomic) IBOutlet UITextView *procedureText;

@end
