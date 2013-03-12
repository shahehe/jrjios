//
//  ProcedureViewController.m
//  financialDistrict
//
//  Created by USTB on 13-3-11.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import "ProcedureViewController.h"
<<<<<<< HEAD
#import "TextOfProcedureViewController.h"
=======
>>>>>>> 674030f6ebc61d1d9f0a371b2e82b54139107eb1

@interface ProcedureViewController ()

@end

@implementation ProcedureViewController

<<<<<<< HEAD
@synthesize procedureMenu;

=======
>>>>>>> 674030f6ebc61d1d9f0a371b2e82b54139107eb1
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
<<<<<<< HEAD
    
    procedureMenu = [NSMutableArray arrayWithObjects:@"办理\"一小\"大病医疗保险",@"人口与计生",@"办理子女关系证明",@"党群事务",@"办理\"一老\"医保依据和流程",@"失业人员档案转移管理",@"社会事务",@"办理职业介绍",@"办理居民低谷电补贴",@"办理失业人员开具证明",@"办理社会化退休人员开具证明",@"办理《就业失业登记证》",nil];
=======
>>>>>>> 674030f6ebc61d1d9f0a371b2e82b54139107eb1

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
<<<<<<< HEAD
    // Return the number of sections.
    return 1;
=======
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
>>>>>>> 674030f6ebc61d1d9f0a371b2e82b54139107eb1
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
<<<<<<< HEAD
    // Return the number of rows in the section.
    return [self.procedureMenu count];
=======
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
>>>>>>> 674030f6ebc61d1d9f0a371b2e82b54139107eb1
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
<<<<<<< HEAD
    static NSString *CellIdentifier = @"ProcedureCell";
=======
    static NSString *CellIdentifier = @"Cell";
>>>>>>> 674030f6ebc61d1d9f0a371b2e82b54139107eb1
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
<<<<<<< HEAD
    cell.textLabel.text = [self.procedureMenu objectAtIndex:indexPath.row];

    
=======
>>>>>>> 674030f6ebc61d1d9f0a371b2e82b54139107eb1
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
<<<<<<< HEAD
    TextOfProcedureViewController *textProcedureVC = [self.storyboard instantiateViewControllerWithIdentifier:@"TextPVC"];
    
    textProcedureVC.fileNumber = [indexPath row];
    textProcedureVC.titleName = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    [self.navigationController pushViewController:textProcedureVC animated:YES];
=======
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
>>>>>>> 674030f6ebc61d1d9f0a371b2e82b54139107eb1
}

@end
