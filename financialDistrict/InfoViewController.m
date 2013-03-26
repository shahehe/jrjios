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
#import "UIColor+NavigationColor.h"
#import <QuartzCore/QuartzCore.h>

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
    self.tableView.scrollEnabled = NO; 

    
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

    self.view.backgroundColor = [UIColor clearColor];
    [self.tableView setSeparatorColor:[UIColor clearColor]];
    self.navigationController.navigationBar.tintColor = [UIColor NaviColor];
    [[UIBarButtonItem appearance] setTintColor: [UIColor blackColor]];

    
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[UIColor blackColor],[UIFont systemFontOfSize:20.0f],[UIColor colorWithWhite:0.0 alpha:1], nil] forKeys:[NSArray arrayWithObjects:UITextAttributeTextColor,UITextAttributeFont,UITextAttributeTextShadowColor, nil]];
    
    
    self.tabBarController.tabBar.tintColor = [UIColor NaviColor];
    self.tabBarController.tabBar.selectedImageTintColor = [UIColor blackColor];


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
    return [self.infoMenu count];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return 1;
}


- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if(section == 0){
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
        [headerView setBackgroundColor:[UIColor clearColor]];
        return headerView;
    }
    else{
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 10)];
        [headerView setBackgroundColor:[UIColor clearColor]];
        return headerView;
    }
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *CellIdentifier = @"InfoCell";

    InfoCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    

    cell.infoText.text = [self.infoMenu objectAtIndex:indexPath.section];
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"info%d",indexPath.section]
                                                          ofType:@"png"];
    cell.infoImage.image = [UIImage imageWithContentsOfFile:imagePath];

    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"menuButton.png"]];
   
    cell.contentView.layer.masksToBounds = YES;
    cell.contentView.layer.cornerRadius = 10;
    


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
    
    NSInteger section = [indexPath section];
    switch(section){
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
