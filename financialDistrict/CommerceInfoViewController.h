//
//  CommerceInfoViewController.h
//  financialDistrict
//
//  Created by USTB on 13-6-13.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommerceInfoViewController : UIViewController

@property id itemObj;
@property IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UITextView *contentView;




@end
