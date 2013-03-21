//
//  Session.h
//  fdemo
//
//  Created by jrj on 13-3-16.
//  Copyright (c) 2013年 jrj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKNetworkEngine.h"

@interface Session : NSObject

+(Session *) sharedInstance;

-(NSMutableArray *)getReportData;

-(void)setReportData:(NSMutableArray *)data;



@end
