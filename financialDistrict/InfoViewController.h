//
//  InfoViewController.h
//  financialDistrict
//
//  Created by USTB on 13-3-11.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoCell.h"

@interface InfoViewController : UITableViewController

@property (nonatomic,strong) NSMutableArray *infoMenu;
@property (nonatomic,strong) NSDictionary *stringsDictionary;


@end
