//
//  OrganizationSignUpTableViewController.m
//  VolunCode
//
//  Created by Annemarie Ketola on 2/24/15.
//  Copyright (c) 2015 Clint Akins. All rights reserved.
//

#import "OrganizationSignUpTableViewController.h"

@interface OrganizationSignUpTableViewController ()
@property (weak, nonatomic) IBOutlet UITextField *oEmailTextField;
@property (weak, nonatomic) IBOutlet UITextField *oPasswordTextField;
@property (weak, nonatomic) IBOutlet UITextField *oFirstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *oLastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *oCityTextField;

@property (weak, nonatomic) IBOutlet UITextField *oLogoURL;


@property (weak, nonatomic) IBOutlet UIImageView *oLogoImage;
@property (weak, nonatomic) IBOutlet UITextField *oOrganizationNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *oMissionTextField;
@property (weak, nonatomic) IBOutlet UITextField *oAddressTextField;
@property (weak, nonatomic) IBOutlet UITextField *oPhoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *oWebsiteTextField;

@property (nonatomic, strong) NSArray *stringsArray;
@property (nonatomic, strong) NSArray *objectsArray;
@property (nonatomic, strong) NSArray *numbersArray;
@property (nonatomic, assign) id selectedObject;

@property (nonatomic, strong) NSString * selectedString;
@property (strong, nonatomic) IBOutlet UIButton *buttonForCause;


@end

@implementation OrganizationSignUpTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  _stringsArray = @[@"Please Select Cause", @"Animals", @"Environment", @"Sports", @"Education", @"Poverty", @"Religion", @"Children", @"Domestic Violence", @"Health", @"Elderly", @"Culture", @"Arts"];
  
  
  
  // Uncomment the following line to preserve selection between presentations.
  self.clearsSelectionOnViewWillAppear = NO;
  
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  
  if (_selectedObject == nil) {
    _selectedObject = [_objectsArray objectAtIndex:0];
    
  }
  
  if (_selectedString == nil) {
    _selectedString = [_stringsArray objectAtIndex:0];
  }
  
}


- (IBAction)showPickerViewButtonPressed:(id)sender {
  
  
  
  [MMPickerView showPickerViewInView:self.view
                         withStrings:_stringsArray
                         withOptions:@{MMbackgroundColor: [UIColor blackColor],
                                       MMtextColor: [UIColor whiteColor],
                                       MMtoolbarColor: [UIColor blackColor],
                                       MMbuttonColor: [UIColor whiteColor],
                                       MMfont: [UIFont systemFontOfSize:18],
                                       MMvalueY: @3,
                                       MMselectedObject:_selectedString}
                          completion:^(NSString *selectedString) {
                            
                            _buttonForCause.titleLabel.text = selectedString;
                            _selectedString = selectedString;
                          }];
  
}



- (IBAction)submitOrganizationProfileButtonPressed:(id)sender {
  
  //Make dictionary to hold volunteer's Login inputs
  NSDictionary *profileLoginDictionary = @{@"email" : self.oEmailTextField,
                                           @"password" : self.oPasswordTextField,
                                           @"roll" : @"organization",
                                           };
  
  NSError *errorLogin;
  //  NSData *profileLoginJsonData = [NSJSONSerialization dataWithJSONObject:profileLoginDictionary options:kNilOptions error:&error];
  NSData *profileLoginJsonData = [NSJSONSerialization dataWithJSONObject:profileLoginDictionary options:NSJSONWritingPrettyPrinted error:&errorLogin];
  
  if (!profileLoginJsonData) {
    //    NSLog(@"profileJsonDataError: ", error.localizedDescription);
  } else {
    NSString *JSONProfileLoginString = [[NSString alloc] initWithBytes:[profileLoginJsonData bytes] length:[profileLoginJsonData length] encoding:NSUTF8StringEncoding];
    //    NSLog(@"profileJsonData: ", profileJsonData);
  }
  
  NSDictionary *profileDictionary = @{@"firstame" : self.oFirstNameTextField,
                                      @"lastname" : self.oLastNameTextField,
                                      @"city" : self.oCityTextField,
                                      @"organizationname" : self.oOrganizationNameTextField,
                                      @"mission" : self.oMissionTextField,
                                      @"address" : self.oAddressTextField,
                                      @"phone" : self.oPhoneTextField,
                                      @"website" : self.oWebsiteTextField,
                                      };
  
  // Not sure what to do with the Logo @"logo" : self.oLogoImage,
  
  NSError *error;
  //  NSData *profileJsonData = [NSJSONSerialization dataWithJSONObject:profileDictionary options:kNilOptions error:&error];
  NSData *profileJsonData = [NSJSONSerialization dataWithJSONObject:profileDictionary options:NSJSONWritingPrettyPrinted error:&error];
  
  if (!profileJsonData) {
    //    NSLog(@"profileJsonDataError: ", error.localizedDescription);
  } else {
    NSString *JSONProfileString = [[NSString alloc] initWithBytes:[profileJsonData bytes] length:[profileJsonData length] encoding:NSUTF8StringEncoding];
    //    NSLog(@"profileJsonData: ", profileJsonData);
  }
} // close the submitOrganizationProfileButtonPressed

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}

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
