//
//  OrgDetailViewController.m
//  VolunCode
//
//  Created by David Rogers on 2/25/15.
//  Copyright (c) 2015 Clint Akins. All rights reserved.
//

#import "OrgDetailViewController.h"
#import "Organization.h"
#import "FetchService.h"
#import "Event.h"



@interface OrgDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *OrgNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *OrgLocationLabel;
@property (weak, nonatomic) IBOutlet UILabel *OrgOwnerLabel;
@property (weak, nonatomic) IBOutlet UILabel *OrgMissionLabel;
@property (weak, nonatomic) IBOutlet UIImage *OrgLogoImage;





@end

@implementation OrgDetailViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"Organization"];
  NSError *fetchError;
  
  NSInteger fetchResults = [[[[FetchService sharedServices]coreDataStack]managedObjectContext] countForFetchRequest:fetchRequest error:&fetchError];
  NSLog(@"%ld", (long)fetchResults);
  
  if (fetchResults == 0) {
    NSURL *url = [[NSBundle mainBundle]URLForResource:@"orgtest" withExtension:@"json"];
    NSData *data = [[NSData alloc]initWithContentsOfURL:url];
    NSError *error;
    NSDictionary *fetchDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    if (!error) {
      NSString *email = fetchDictionary[@"email"];
      NSString *orgName = fetchDictionary[@"orgName"];
      NSString *firstName = fetchDictionary[@"firstname"];
      NSString *lastName = fetchDictionary[@"lastname"];
      NSString *type = fetchDictionary[@"type"];
      NSString *mission = fetchDictionary[@"mission"];
      NSString *address = fetchDictionary[@"address"];
      NSString *city = fetchDictionary[@"city"];
      NSString *phone = fetchDictionary[@"phone"];
      NSString *website = fetchDictionary[@"website"];
      
      NSArray *eventsArray = fetchDictionary[@"events"];
      for (NSDictionary *eventsDictionary in eventsArray) {
        Event *event = [NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:self.managedObjectContext];
      }
      
      NSLog(@"%@", firstName);
  

}

-(void)viewWillAppear {
  [super viewWillAppear];
  
  //reload tableview
  
  
  
  
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
