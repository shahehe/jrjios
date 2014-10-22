//
//  RehabCategoryViewController.m
//  financialDistrict
//
//  Created by USTB on 13-6-7.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import "RehabCategoryViewController.h"
#import "RehabContextViewController.h"
#import "ProcedureGongShangCell.h"

@interface RehabCategoryViewController ()

@end

@implementation RehabCategoryViewController

@synthesize rcArray;
@synthesize whichCategory;
@synthesize pageName;

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
    //[self.tableView setSeparatorColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"product_line.png"]]];
    [self.view setBackgroundColor:[UIColor clearColor]];
    self.tableView.backgroundView = [[UIView alloc]init];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    
    self.navigationItem.title = pageName;
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
    temporaryBarButtonItem.title = @"返回";
    self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
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
    return [rcArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"RehabCell";
    ProcedureGongShangCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.procedureTitle.text = rcArray[indexPath.row];
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"health"
                                                          ofType:@"png"];
    
    cell.procedureIcon.image = [UIImage imageWithContentsOfFile:imagePath];
    //cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cellBar.png"]];
    
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
    // Navigation logic may go here. Create and push another view controller.

    RehabContextViewController *rContextVC = [self.storyboard instantiateViewControllerWithIdentifier:@"rehabContextVC"];
    
    NSString *nameNum = [NSString stringWithFormat:@"%d",indexPath.row +1];
    rContextVC.htmlName = [NSString stringWithFormat:@"h%@0%@",whichCategory,nameNum];
    
    [self.navigationController pushViewController:rContextVC animated:YES];
}

@end
