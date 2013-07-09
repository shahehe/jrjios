//
//  HealthRehabViewController.m
//  financialDistrict
//
//  Created by USTB on 13-5-22.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import "HealthRehabViewController.h"
#import "stringsJsonParser.h"
#import "RehabCategoryViewController.h"
#import "ProcedureGongShangCell.h"
#import "HealthIntroViewController.h"

@interface HealthRehabViewController ()

@end

@implementation HealthRehabViewController

@synthesize healthDictionary;
@synthesize healthCategoryArray;
@synthesize array1;
@synthesize array2;
@synthesize array3;
@synthesize array4;

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
    
    self.navigationItem.title = @"亚健康体健康复中心";
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
    temporaryBarButtonItem.title = @"返回";
    self.navigationItem.backBarButtonItem = temporaryBarButtonItem;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    healthDictionary = [StringsJsonParser parseStringsJson:@"health"];
    
    healthCategoryArray = [[NSMutableArray alloc] init];
    array1 = [[NSMutableArray alloc] init];
    array2 = [[NSMutableArray alloc] init];
    array3 = [[NSMutableArray alloc] init];
    array4 = [[NSMutableArray alloc] init];
    
    int i=1;
    NSArray *rowArray = [healthDictionary objectForKey:@"row"];
    for(NSDictionary* dic in rowArray){
        
        [healthCategoryArray addObject:[dic valueForKey:@"name"]];
        NSMutableArray *tempArray = [dic valueForKey:@"content"];
        switch (i) {
            case 1:
                array1  = tempArray;
                break;
            case 2:
                array2  = tempArray;
                break;
            case 3:
                array3  = tempArray;
                break;
            case 4:
                array4  = tempArray;
                break;
                
            default:
                break;
        }
        i++;
        
    }
    
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
    return 3;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 1){
        return [healthCategoryArray count];
    }
    else return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
        static NSString *CellIdentifier = @"RehabCell";
        ProcedureGongShangCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
      if(indexPath.section == 1){
        // Configure the cell...
        cell.procedureTitle.text = healthCategoryArray[indexPath.row];
        NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"health"
                                                          ofType:@"png"];

        cell.procedureIcon.image = [UIImage imageWithContentsOfFile:imagePath];
      }
      else if(indexPath.section == 0){
          cell.procedureTitle.text = @"中心简介";
      }
      else if(indexPath.section == 2){
          cell.procedureTitle.text = @"联系电话";
      }
    
     //cell.contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cellBar.png"]];

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
    if(indexPath.section == 1){
        RehabCategoryViewController *rcVC = [self.storyboard instantiateViewControllerWithIdentifier:@"RehabCVC"];
        rcVC.pageName = healthCategoryArray[indexPath.row];

        
        switch (indexPath.row) {
            case 0:
                rcVC.rcArray = array1;
                rcVC.whichCategory = @"a";
                break;
            case 1:
                rcVC.rcArray = array2;
                rcVC.whichCategory = @"b";
                break;
            case 2:
                rcVC.rcArray = array3;
                rcVC.whichCategory = @"c";
                break;
            case 3:
                rcVC.rcArray = array4;
                rcVC.whichCategory = @"d";
                break;
                
            default:
                break;
        }
        
        [self.navigationController pushViewController:rcVC animated:YES];
    }
    else if (indexPath.section == 0){
        HealthIntroViewController
            *hIntroVC = [self.storyboard instantiateViewControllerWithIdentifier:@"hIntroVC"];
        [self.navigationController pushViewController:hIntroVC animated:YES];
    }
    else if (indexPath.section == 2){
        NSString* phoneNum= @"010-66216988"; //亚健康呼叫中心电话
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"telprompt://%@",phoneNum]];
        [[UIApplication  sharedApplication] openURL:url];
    }
}

@end