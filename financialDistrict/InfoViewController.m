//
//  InfoViewController.m
//  financialDistrict
//
//  Created by USTB on 13-3-11.
//  Copyright (c) 2013年 USTB. All rights reserved.
//

#import "InfoViewController.h"
#import "IntroViewController.h"
#import "ProcedureViewController.h"
#import "GongShangViewController.h"
#import "PhoneViewController.h"
#import "YuXiangViewController.h"
#import "StringsJsonParser.h"

@interface InfoViewController ()

@property (nonatomic,strong) NSMutableArray *procedureArray;
@property (nonatomic,strong) NSMutableArray *gongshangArray;
@property (nonatomic,strong) NSMutableArray *phoneNamesArray;
@property (nonatomic,strong) NSMutableArray *phoneNumbersArray;

@end

@implementation InfoViewController

@synthesize infoMenu;
@synthesize stringsDictionary;
@synthesize procedureArray;
@synthesize gongshangArray;
@synthesize phoneNamesArray;
@synthesize phoneNumbersArray;

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

    
    infoMenu = [NSMutableArray arrayWithObjects:@"金融街简介",@"办事程序",@"联系电话",@"宇翔图册",@"工商业务办理", nil];
    

    stringsDictionary = [StringsJsonParser parseStringsJson:@"strings"];
    NSArray *dicArray = [stringsDictionary objectForKey:@"string-array"];
    for(NSDictionary* dic in dicArray){
        if([[dic valueForKey:@"name"] isEqualToString:@"procedure_array"]){
            procedureArray = [dic valueForKey:@"item"];
        }
        else if([[dic valueForKey:@"name"] isEqualToString:@"gongshang_array"]){
            gongshangArray = [dic valueForKey:@"item"];
        }
        else if([[dic valueForKey:@"name"] isEqualToString:@"phone_names"]){
            phoneNamesArray = [dic valueForKey:@"item"];
        }
        else if([[dic valueForKey:@"name"] isEqualToString:@"phone_nums"]){
            phoneNumbersArray = [dic valueForKey:@"item"];
        }

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
    return [self.infoMenu count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *CellIdentifier = @"InfoCell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    

    cell.textLabel.text = [self.infoMenu objectAtIndex:indexPath.row];
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"info%d",indexPath.row]
                                                          ofType:@"png"];
    cell.imageView.image = [UIImage imageWithContentsOfFile:imagePath];

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
    
    NSInteger row = [indexPath row];
    switch(row){
        case 0:{
            IntroViewController *introVC = [self.storyboard instantiateViewControllerWithIdentifier:@"IntroVC"];
            [self.navigationController pushViewController:introVC animated:YES];
            break;
        }
        case 1:{
            ProcedureViewController *procedureVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ProcedureVC"];
            procedureVC.procedureMenu =procedureArray;
            [self.navigationController pushViewController:procedureVC animated:YES];
            break;
        }
        case 2:{
            PhoneViewController *phoneVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PhoneVC"];
            phoneVC.contactsMenu =phoneNamesArray;
            phoneVC.numbersMenu =phoneNumbersArray;
            [self.navigationController pushViewController:phoneVC animated:YES];
            break;
        }
        case 3:{
            YuXiangViewController *yxVC = [self.storyboard instantiateViewControllerWithIdentifier:@"YuXiangVC"];
            [self.navigationController pushViewController:yxVC animated:YES];
            break;
        }
        case 4:{
            GongShangViewController *gongshangVC = [self.storyboard instantiateViewControllerWithIdentifier:@"GongShangVC"];
            gongshangVC.gongshangMenu =gongshangArray;
            [self.navigationController pushViewController:gongshangVC animated:YES];
            break;
        }
    }

    

}

@end
