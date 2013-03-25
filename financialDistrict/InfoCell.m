//
//  InfoCell.m
//  financialDistrict
//
//  Created by USTB on 13-3-25.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import "InfoCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation InfoCell
@synthesize infoImage;
@synthesize infoArrow;
@synthesize infoText;


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


-(void)layoutSubviews
{
    [super layoutSubviews];
    CGRect frame = self.backgroundView.frame;
    frame.origin.x += 18;
    frame.size.width -= 36;
    self.backgroundView.frame = frame;
    frame = self.contentView.frame;
    frame.origin.x += 18;
    frame.size.width -= 36;
    self.contentView.frame = frame;
    self.backgroundView.backgroundColor = [UIColor whiteColor];
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    self.contentView.layer.masksToBounds = YES;
    self.contentView.layer.cornerRadius = 10;

}
@end
