//
//  YuXiangViewController.m
//  financialDistrict
//
//  Created by USTB on 13-3-14.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import "YuXiangViewController.h"
#import "YuXiangCell.h"
#import "TextOfYuXiangViewController.h"
#import "StringsJsonParser.h"

@interface YuXiangViewController ()

@end

@implementation YuXiangViewController

@synthesize yuXiangDictionary;
@synthesize yximageNumberArray;
@synthesize yxtitleArray;
@synthesize yxaddressArray;
@synthesize yxcontentArray;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"宇翔图册";
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
    temporaryBarButtonItem.title = @"返回";
    self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
 
    yximageNumberArray = [[NSMutableArray alloc] init];
    yxtitleArray       = [[NSMutableArray alloc] init];
    yxaddressArray     = [[NSMutableArray alloc] init];
    yxcontentArray     = [[NSMutableArray alloc] init];
    
    yuXiangDictionary = [StringsJsonParser parseStringsJson:@"yuxiang"];
    NSArray *yxInfoDicArray = [yuXiangDictionary objectForKey:@"Row"];
    
    for(NSDictionary* dic in yxInfoDicArray){
        
        [yximageNumberArray addObject:[dic valueForKey:@"Column"]];
        [yxtitleArray       addObject:[dic valueForKey:@"Column2"]];
        [yxaddressArray     addObject:[dic valueForKey:@"Column3"]];
        [yxcontentArray     addObject:[dic valueForKey:@"Column11"]];
        
    }

  

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self.yximageNumberArray count];
}

//Here we use a customized Table Cell 'YuXiangCell'
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"yxCell";
    YuXiangCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.yXTitleLabel.text   = [self.yxtitleArray objectAtIndex:indexPath.row];
    cell.yXAddressLabel.text = [self.yxaddressArray objectAtIndex:indexPath.row];
    cell.yXContentLabel.text = [self.yxcontentArray objectAtIndex:indexPath.row];
    NSString* imageNum = [self.yximageNumberArray objectAtIndex:indexPath.row];
    
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageNum
                                                         ofType:@"png"];
    cell.yuXiangImage.image  = [UIImage imageWithContentsOfFile:imagePath];
    
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TextOfYuXiangViewController *textYXVC = [self.storyboard instantiateViewControllerWithIdentifier:@"TextYXVC"];
    
    textYXVC.htmlNum = [[self.yximageNumberArray objectAtIndex:indexPath.row] intValue];

    [self.navigationController pushViewController:textYXVC animated:YES];

  
}

@end
