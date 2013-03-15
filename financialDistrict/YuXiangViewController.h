//
//  YuXiangViewController.h
//  financialDistrict
//
//  Created by USTB on 13-3-14.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YuXiangViewController : UITableViewController

@property (nonatomic,strong) NSDictionary *yuXiangDictionary;
@property (nonatomic,strong) NSMutableArray *yximageNumberArray;
@property (nonatomic,strong) NSMutableArray *yxtitleArray;
@property (nonatomic,strong) NSMutableArray *yxcontentArray;
@property (nonatomic,strong) NSMutableArray *yxaddressArray;

@end
