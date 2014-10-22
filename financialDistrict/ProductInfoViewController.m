//
//  ProductInfoViewController.m
//  jrj
//
//  Created by jrj on 13-3-25.
//  Copyright (c) 2013年 jrj. All rights reserved.
//

#import "ProductInfoViewController.h"

@interface ProductInfoViewController ()

@end

@implementation ProductInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.webView setBackgroundColor:[UIColor clearColor]];
    [self hideGradientBackground:self.webView];
    [self showData];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) hideGradientBackground:(UIView*)theView
{
    for (UIView* subview in theView.subviews)
    {
        if ([subview isKindOfClass:[UIImageView class]])
            subview.hidden = YES;
        
        [self hideGradientBackground:subview];
    }
}

-(void)showData
{
    self.name.text = [self.item valueForKey:@"name"];
    //[MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    NSMutableString *html = [NSMutableString stringWithCapacity:0];
    [html appendString:@"<!DOCTYPE HTML><html><head><meta charset=\"utf-8\"><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no\"><style>body{padding:0px;margin:0px;}div.box{border-radius: 6px;border:1px solid #f6d8b9;margin:10px;line-height: 32px;} div.t{width: 40%;float:left;color:gray;font-size: 12px;} div.c{font-size: 12px;width: 59%;border-left: 1px solid #ccc;float: left;}div.cl{clear:both;}</style></head><body >"];
    
    [html appendFormat:@"<div class=box><div class=t>&nbsp;商标</div><div class=c>&nbsp;%@</div><div class=cl></div></div>",[self.item valueForKey:@"brand"]];
    
    [html appendFormat:@"<div class=box><div class=t>&nbsp;规格型号</div><div class=c>&nbsp;%@</div><div class=cl></div></div>",[self.item valueForKey:@"model"]];
    
    [html appendFormat:@"<div class=box><div class=t>&nbsp;生产批次</div><div class=c>&nbsp;%@</div><div class=cl></div></div>",[self.item valueForKey:@"batch"]];
    
    [html appendFormat:@"<div class=box><div class=t>&nbsp;不合格项目</div><div class=c>&nbsp;%@</div><div class=cl></div></div>",[self.item valueForKey:@"item"]];
    
    [html appendFormat:@"<div class=box><div class=t>&nbsp;生产单位名称</div><div class=c>&nbsp;%@</div><div class=cl></div></div>",[self.item valueForKey:@"company"]];
    
    [html appendFormat:@"<div class=box><div class=t>&nbsp;当事人姓名或名称</div><div class=c>&nbsp;%@</div><div class=cl></div></div>",[self.item valueForKey:@"party"]];
    
    [html appendString:@"</body></html>"];
    // NSLog(@"html:%@",html);
    [self.webView loadHTMLString:html baseURL:nil];
}
@end
