//
//  TextOfGongShangViewController.h
//  financialDistrict
//
//  Created by USTB on 13-3-12.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextOfGongShangViewController : UIViewController

@property int fileNumberGS;
@property (strong,nonatomic) NSString* titleNameGS;

@property (weak, nonatomic) IBOutlet UITextView *gongShangText;

@end
