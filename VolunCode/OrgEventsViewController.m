//
//  OrgEventsViewController.m
//  VolunCode
//
//  Created by David Rogers on 2/25/15.
//  Copyright (c) 2015 Clint Akins. All rights reserved.
//

#import "OrgEventsViewController.h"
#include "PostAndFetchService.h"


@interface OrgEventsViewController ()

@property (strong, nonatomic) OrgAddEvent *orgAddEvent;

//-(IBAction)addEvent:(id)addEvent;

@end

@implementation OrgEventsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  NSString *token = @"4Lphc97wg13BNy0EA6XZY0F9xn5wI+fU1O+cAiokCTUn68j/Pv+XDi9s/ZW+to7ljZVxtjVTC5xAVeQ=";
  
[[PostAndFetchService sharedService]fetchEvents:token completionHandler:^(NSDictionary *results, NSString *fetchEventsError) {
    
  }];
  
/*
  UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                  target:self
                                  action:@selector(addEvent:)];
  
  self.navigationItem.rightBarButtonItem = rightButton;
 */ 
//  UIBarButtonItem *buttonAddEvent = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(Add:)];
  
//  _buttonAddEvent = UIBarButtonItem(UIBarButtonSystemItemAdd: UIBarButtonSystemItem.Add, target: self, action: "pressedButtonAddEvent")
//  self.navigationItem.rightBarButtonItem = buttonAddUserProfile
  
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  return NO;
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  
  //reload tableview with JSON data from FETCH EVENT
  
  
}






//-(IBAction) addEvent: (id) addEvent {
//  NSLog(@"User clicked %@", addEvent);
////  [self.tableView.superview addSubview:_orgAddEvent.view];
//  //addEventView will appear animated fade in
//  
//  
//  
//}

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
