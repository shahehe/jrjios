//
//  GongShangViewController.m
//  financialDistrict
//
//  Created by USTB on 13-3-12.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import "GongShangViewController.h"
#import "TextOfGongShangViewController.h"
#import "ProcedureGongShangCell.h"

@interface GongShangViewController ()

@end

@implementation GongShangViewController

@synthesize gongshangMenu;

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
    self.navigationItem.title = @"工商业务办理";
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
    temporaryBarButtonItem.title = @"返回";
    self.navigationItem.backBarButtonItem = temporaryBarButtonItem;

     [self.tableView setSeparatorColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"product_line.png"]]];
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
    return [self.gongshangMenu count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"GongShangCell";
    ProcedureGongShangCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.procedureTitle.text = [self.gongshangMenu objectAtIndex:indexPath.row];
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"info4"
                                                          ofType:@"png"];
    cell.procedureIcon.image = [UIImage imageWithContentsOfFile:imagePath];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"cellBar.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0] ];
    
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
    TextOfGongShangViewController *textGSVC = [self.storyboard instantiateViewControllerWithIdentifier:@"TextGSVC"];
    
    ProcedureGongShangCell *cell = (ProcedureGongShangCell *)[tableView cellForRowAtIndexPath:indexPath];
    textGSVC.fileNumberGS = [indexPath row];
    textGSVC.titleNameGS = cell.procedureTitle.text;
    [self.navigationController pushViewController:textGSVC animated:YES];
    
    
}

@end
