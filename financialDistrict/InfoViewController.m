//
//  InfoViewController.m
//  financialDistrict
//
//  Created by USTB on 13-3-11.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import "InfoViewController.h"
#import "IntroViewController.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

<<<<<<< HEAD
@synthesize infoMenu;

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
     
    infoMenu = [NSMutableArray arrayWithObjects:@"金融街简介",@"办事程序",@"联系电话",@"宇翔图册",@"工商业务办理", nil];
    
    
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
    return [self.infoMenu count];
=======
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
>>>>>>> 674030f6ebc61d1d9f0a371b2e82b54139107eb1
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
<<<<<<< HEAD
    static NSString *CellIdentifier = @"InfoCell";
=======
    static NSString *CellIdentifier = @"Cell";
>>>>>>> 674030f6ebc61d1d9f0a371b2e82b54139107eb1
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
<<<<<<< HEAD
    cell.textLabel.text = [self.infoMenu objectAtIndex:indexPath.row];
    
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
    
    NSInteger row = [indexPath row];
    switch(row){
        case 0:{
            IntroViewController *introVC = [self.storyboard instantiateViewControllerWithIdentifier:@"IntroVC"];
            [self.navigationController pushViewController:introVC animated:YES];
            break;
        }
        case 1:{
            IntroViewController *procedureVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ProcedureVC"];
            [self.navigationController pushViewController:procedureVC animated:YES];
            break;
        }
        case 2:{
            break;
        }
        case 3:{
            break;
        }
        case 4:{
            break;
        }
    }

    



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
