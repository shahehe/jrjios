//
//  PhoneCell.h
//  financialDistrict
//
//  Created by USTB on 13-4-7.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhoneCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *phoneIcon;
@property (weak, nonatomic) IBOutlet UILabel *phoneTitle;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumber;

@end
