//
//  NewsViewController.h
//  financialDistrict
//
//  Created by USTB on 13-3-11.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MosquittoClient.h"

@interface NewsViewController : UIViewController<MosquittoClientDelegate>

@property (readonly) MosquittoClient *mosquittoClient;

@end
