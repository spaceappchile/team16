//
//  MeteorsViewController.m
//  wishmaker_ios
//
//  Created by Javier Giovannini on 20-04-13.
//  Copyright (c) 2013 Javier Giovannini. All rights reserved.
//

#import "MeteorsViewController.h"
#import "Meteor.h"
#import "MeteorCell.h"
#import "MeteorViewController.h"

@interface MeteorsViewController ()

@end

@implementation MeteorsViewController

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    RKLogConfigureByName("RestKit/Network", RKLogLevelTrace);

    self.meteors = [[NSMutableArray alloc] init];
    
    [[NSNotificationCenter defaultCenter]  addObserver:self selector:@selector(handleNotification:) name:@"MyNotification" object:nil];

    //object manager singleton
    RKObjectManager *manager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:WEBSERVER]];
    
    //map events
    RKObjectMapping *eventMapping = [RKObjectMapping mappingForClass:[Meteor class]];
    [eventMapping addAttributeMappingsFromDictionary: [Meteor mapping]];
    
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:eventMapping pathPattern:nil keyPath:nil statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    
    [manager addResponseDescriptor:responseDescriptor];
    
    
    [manager getObjectsAtPath:@"meteors.json" parameters:nil
                      success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                          NSArray* meteors = [mappingResult array];
                          for (Meteor *meteor in meteors) {
                              [self.meteors addObject:meteor];
                              
                          }
                          [self.tableView reloadData];
                          
                      }
                      failure:^(RKObjectRequestOperation *operation, NSError *error) {
                          NSLog(@"Failed with error: %@", [error localizedDescription]);
                          
                      }
     ];
}

-(void)handleNotification:(NSNotification *)notification
{
    NSDictionary *object = notification.object;
    
        NSString *message = [[object valueForKey:@"aps"] valueForKey:@"alert"];
        NSLog(@"message string: %@", message);
//    NSNumber *store_id = [object valueForKey:@"store_id"];
//    NSLog(@"id received: %@", store_id);
//    NSString *title = [object valueForKey:@"title"];
//    NSString *message = [object valueForKey:@"description_brief"];
    
    UIAlertView *notificationAlert = [[UIAlertView alloc]
                              initWithTitle:@"Ask for a wish"
                              message:message
                              delegate:self
                              cancelButtonTitle:@"Ver"
                              otherButtonTitles: @"OK", nil];
    
    [notificationAlert show];
    
    
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
    return [self.meteors count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    MeteorCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        
    if (cell == nil) {
        cell = [[MeteorCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    int photonumber = indexPath.row % 6+1;
    NSString *imagename = [NSString stringWithFormat:@"%i.jpg", photonumber];
    cell.image.image = [UIImage imageNamed:imagename];
//    cell.image.layer.cornerRadius = 10;
//    cell.image.clipsToBounds = YES;
    
    cell.backgroundColor = [UIColor whiteColor];
    cell.title.text = [[self.meteors objectAtIndex:indexPath.row] title];
    cell.subtitle.text = [[self.meteors objectAtIndex:indexPath.row] address];
    cell.date.text =  [self stringFromDate:[[self.meteors objectAtIndex:indexPath.row] created_at]];

    
    return cell;
}

-(NSString*) stringFromDate : (NSDate *) date{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-yyyy HH:mm"];
    
    //Optionally for time zone converstions
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"..."]];
    
    NSString *string = [formatter stringFromDate:date];
    
    return string;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    MeteorViewController *detailViewController = segue.destinationViewController;
    NSUInteger selectedRow =  self.tableView.indexPathForSelectedRow.row;
    detailViewController.meteor = [self.meteors objectAtIndex:selectedRow];
    detailViewController.index = selectedRow;
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
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
