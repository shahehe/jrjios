//
//  YuXiangCell.m
//  financialDistrict
//
//  Created by USTB on 13-3-14.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import "YuXiangCell.h"

@implementation YuXiangCell

@synthesize yuXiangImage;
@synthesize yXAddressLabel;
@synthesize yXContentLabel;
@synthesize yXTitleLabel;


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

@end
