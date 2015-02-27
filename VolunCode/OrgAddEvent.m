//
//  OrgAddEvent.m
//  VolunCode
//
//  Created by David Rogers on 2/25/15.
//  Copyright (c) 2015 Clint Akins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrgAddEvent.h"
#import "PostAndFetchService"

@interface OrgAddEvent ()

@property (strong, nonatomic) IBOutlet UITextField *evContactEmail;
@property (strong, nonatomic) IBOutlet UITextField *evEventTitle;
@property (strong, nonatomic) IBOutlet UITextField *evAddress;
@property (strong, nonatomic) IBOutlet UITextView *evDescription;
@property (strong, nonatomic) IBOutlet UITextField *evJobTitle;
@property (strong, nonatomic) IBOutlet UISwitch *evSkillWebSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *evSkillMobileSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *evSkillDBSwitch;
@property (strong, nonatomic) IBOutlet UIDatePicker *evDatePicker;
@property (strong, nonatomic) IBOutlet UIButton *evSubmitButton;


@end


@implementation OrgAddEvent

- (IBAction)evSubmitPressed:(id)sender {
  
  NSString *token = @"4Lphc97wg1jGMi0BBKDZY0F9xn5wI+fU1O+cAiokCTUn68j/Pv+XDi9s/ZW+t47njJV3vTVdBJJAVeQ=";
  
  
  NSDictionary *eventDictionary = @{
                                    @"organizerID" : @"def@def.com",
                                    @"title" : @"Title of my awesome event",
                                    @"date" : @"",
                                    @"time" : @"",
                                    @"location" : @"Our Charity Space, Seattle, Wa 98121",
                                    @"description" : @"Our cool event!",
                                    @"volunteerJobs" : @{
                                        @"title" : @"Make website",
                                        @"skills" : @"Website"
                                        },
                                    @"messages" : @{
                                        @"username" : @"Anne",
                                        @"body" : @"La la la la la "
                                        }
                                    };
  
[[PostAndFetchService sharedService]createEvent:eventDictionary withToken:token completionHandler:^(NSDictionary *results, NSString *createEventError) {
  
  }];
  
  
  
  //JSON POST event sending details of event that was created to the API database
  
}


- (void)viewDidLoad {
    [super viewDidLoad];
  /*
   
   preload organizer email but allow them to change it
   
   
   
   
   */
  
  
  
  
  
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}
*/
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
