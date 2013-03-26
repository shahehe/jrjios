//
//  Session.m
//  jrj
//
//  Created by jrj on 13-3-16.
//  Copyright (c) 2013年 jrj. All rights reserved.
//

#import "Session.h"

@interface Session ()

@property NSMutableArray *reportsData;

@end

@implementation Session

static Session *shareInstance = nil;

+(Session *) sharedInstance
{
	if (!shareInstance) {
		shareInstance = [[self alloc]init];
        shareInstance.reportsData = [NSMutableArray arrayWithCapacity:0];
	}
	return shareInstance;
}

-(NSMutableArray *)getReportData
{
    return self.reportsData;
}

@end
