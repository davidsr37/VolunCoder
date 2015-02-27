//
//  EventsViewController.m
//  VolunCode
//
//  Created by Clint on 2/23/15.
//  Copyright (c) 2015 Clint Akins. All rights reserved.
//

#import "EventsViewController.h"
#import "EventCell.h"
#import "PostAndFetchService.h"


@interface EventsViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation EventsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  return NO;
}

- (void)viewWillAppear:(BOOL)animated {
  
  
  NSString *token = @"4Lphc97wg13BNy0EA6XZY0F9xn5wI+fU1O+cAiokCTUn68j/Pv+XDi9s/ZW+to7ljZVxtjVTC5xAVeQ=";
  
[[PostAndFetchService sharedService]fetchEvents:token completionHandler:^(NSDictionary *results, NSString *fetchEventsError) {
    
  }];
  

  /*
   
   TODO:
   
   FETCH ALL EVENTS
   
   PARSE DATA INTO XIB FOR "EVENTS_CELL" PROTOTYPE CELL (EventsCell)
   
   RELOAD TABLEVIEW
   
   */
  
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//warning Incomplete method implementation.
  // Return the number of rows in the section.
  return 0;
  //return self.EVENTS.count;
}


 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EVENT_CELL" forIndexPath:indexPath];
 
 // Configure the cell... SEE EVENTCELL.M
 
 return cell;
 }
 




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
