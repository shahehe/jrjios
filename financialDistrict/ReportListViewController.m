//
//  ReportListViewController.m
//  fdemo
//
//  Created by jrj on 13-3-16.
//  Copyright (c) 2013年 jrj. All rights reserved.
//

#import "ReportListViewController.h"
#import "ApiService.h"
#import "ReportCategoryCell.h"
#import "ReportInfoViewController.h"

@interface ReportListViewController ()

@end

@implementation ReportListViewController

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
    self.data = [NSMutableArray arrayWithCapacity:0];
    [self getData];
    self.refreshControl = [[UIRefreshControl alloc]init];
    [self.refreshControl addTarget:self action:@selector(getData) forControlEvents:UIControlEventValueChanged];
    
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

-(void)getData
{
    [ApiService getReport:[self.item valueForKey:@"file"] andSuccess:^(ApiResult *result) {
        if([self.refreshControl isRefreshing]){
            [self.data removeAllObjects];
        }
        [self.data addObjectsFromArray:[[result.data valueForKey:@"items"] valueForKey:@"section"]];
        [self.tableView reloadData];
        [self.refreshControl endRefreshing];
    } andFailure:^(int code, NSString *message) {
        UIAlertView *av =[[UIAlertView alloc] initWithTitle:@"错误" message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [av show];
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.data count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id item = [[self.data objectAtIndex:section] objectForKey:@"item"];
    
    if([item isKindOfClass:[NSArray class]]){
        return [item count];
    }else{
        return 1;
    }
}

-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90.0f;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    id s = [self.data objectAtIndex:section];
    return [s valueForKey:@"title"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ReportListCell";
    ReportCategoryCell *cell = (ReportCategoryCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    id item = [[self.data objectAtIndex:indexPath.section] objectForKey:@"item"];
    if([item isKindOfClass:[NSArray class]]){
        [cell setData:[item objectAtIndex:indexPath.row]];
    }else{
        [cell setData:item];
    }
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
    id item = [[self.data objectAtIndex:indexPath.section] objectForKey:@"item"];
    id sender;
    if([item isKindOfClass:[NSArray class]]){
         sender = [item objectAtIndex:indexPath.row];
    }else{
        sender = item;
    }

    [self performSegueWithIdentifier:@"info" sender:sender];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"info"]){
        ReportInfoViewController *v = segue.destinationViewController;
        v.item = sender;
        v.title = [self.item valueForKey:@"title"];
    }
}

@end
