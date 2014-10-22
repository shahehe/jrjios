//
//  ReportCategoryCell.m
//  fdemo
//
//  Created by jrj on 13-3-16.
//  Copyright (c) 2013年 jrj. All rights reserved.
//

#import "ReportCategoryCell.h"
#import "UIImageView+WebCache.h"
#import "ApiService.h"
#import <QuartzCore/QuartzCore.h>

@implementation ReportCategoryCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setData:(id)data
{
    @try {
        self.titleLabel.text = [data valueForKey:@"title"];
        self.descLabel.text = [data valueForKey:@"desc"];
        NSString *img = [data valueForKey:@"image"];
        if(img != nil && img.length > 4){
            self.imgView.hidden = NO;
            NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@/jrj/image/%@",[ApiService sharedInstance].host,img]];
            [self.imgView setImageWithURL:url placeholderImage:[UIImage imageNamed:@"no-image.png"]];
            
            self.imgView.layer.masksToBounds = YES;
            self.imgView.layer.cornerRadius = 0;
            self.imgView.layer.borderWidth = 1;
            self.imgView.layer.borderColor = [[UIColor grayColor] CGColor];
        }else{
            self.imgView.hidden = YES;
        }
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
}

- (void)layoutSubviews
{
	[super layoutSubviews];
    CGRect titleFrame = self.titleLabel.frame;
    CGRect descFrame = self.descLabel.frame;
    if(self.imgView.hidden){
        self.titleLabel.frame = CGRectMake(titleFrame.origin.x, titleFrame.origin.y, 288.0f, titleFrame.size.height);
        self.descLabel.frame = CGRectMake(descFrame.origin.x, descFrame.origin.y, 288.0f, descFrame.size.height);
    }else{
        self.titleLabel.frame = CGRectMake(titleFrame.origin.x, titleFrame.origin.y, 240.0f, titleFrame.size.height);
        self.descLabel.frame = CGRectMake(descFrame.origin.x, descFrame.origin.y, 240.0f, descFrame.size.height);
    }
}

@end
