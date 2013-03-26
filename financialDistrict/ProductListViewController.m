//
//  ProductListViewController.m
//  jrj
//
//  Created by jrj on 13-3-25.
//  Copyright (c) 2013年 jrj. All rights reserved.
//

#import "ProductListViewController.h"
#import "ApiService.h"
#import "MBProgressHUD.h"
#import "ProductListHeader.h"
#import "ProductInfoViewController.h"

@interface ProductListViewController ()

@end

@implementation ProductListViewController

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
    [ApiService getProductList:^(ApiResult *result) {
        NSLog(@"%@",result.data);
        if([self.refreshControl isRefreshing]){
            [self.data removeAllObjects];
        }
        [self.data addObjectsFromArray:[result.data valueForKey:@"products"]];
        [self.tableView reloadData];
        [self.refreshControl endRefreshing];
        [self checkUpdate];
    } andFailure:^(int code, NSString *message) {
        
    }];
}

-(void)checkUpdate
{
    UIActivityIndicatorView *aiv = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    aiv.frame = CGRectMake(290.0f, 11.0f, 20.0f, 20.0f);
    [aiv startAnimating];
    [self.navigationController.navigationBar addSubview:aiv];
    [ApiService checkUpdateForProduct:^(ApiResult *result) {
        [aiv stopAnimating];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"已经更新！";
        [hud hide:YES afterDelay:1];
        [self.data removeAllObjects];
        [self.data addObjectsFromArray:[result.data valueForKey:@"products"]];
        [self.tableView reloadData];
    } andFailure:^(int code, NSString *message) {
        if(code == 1){
            [aiv stopAnimating];
        }else{
            UIAlertView *av =[[UIAlertView alloc] initWithTitle:@"错误" message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [av show];
        }
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%i",[[[self.data objectAtIndex:section] objectForKey:@"items"] count]);
    return [[[self.data objectAtIndex:section] objectForKey:@"items"] count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 32.0f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    ProductListHeader *v = [[[NSBundle mainBundle] loadNibNamed:@"ProductListHeader" owner:self options:nil] lastObject];
    [v setData:[self.data objectAtIndex:section]];
    return v;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.textLabel.font = [UIFont systemFontOfSize:14.0f];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    // Configure the cell...
    id sec = [self.data objectAtIndex:indexPath.section];
    NSLog(@"%@",[sec valueForKey:@"items"]);
    id item = [[[self.data objectAtIndex:indexPath.section] objectForKey:@"items"] objectAtIndex:indexPath.row];;
    cell.textLabel.text = [NSString stringWithFormat:@"%@:%@",[item objectForKey:@"number"],[item objectForKey:@"name"]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"商标：%@；标注生产单位名称：%@；规格型号：%@",[item valueForKey:@"brand"],[item valueForKey:@"company"],[item valueForKey:@"model"]];
    ;
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id item = [[[self.data objectAtIndex:indexPath.section] valueForKey:@"items"] objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"info" sender:item];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"info"]){
        ProductInfoViewController *v = segue.destinationViewController;
        v.item = sender;
        //v.title = [sender valueForKey:@"name"];
    }
}




@end
