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

@property (strong, nonatomic) IBOutlet UITextField *oLabelOfCause;
@property (strong, nonatomic) IBOutlet UITextField *oLabelOfLocale;


@property (weak, nonatomic) IBOutlet UITextField *oLogoURL;


@property (weak, nonatomic) IBOutlet UIImageView *oLogoImage;
@property (weak, nonatomic) IBOutlet UITextField *oOrganizationNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *oMissionTextField;
@property (weak, nonatomic) IBOutlet UITextField *oAddressTextField;
@property (weak, nonatomic) IBOutlet UITextField *oPhoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *oWebsiteTextField;

@property (strong, nonatomic) IBOutlet UITableViewCell *causeCell;



@property (nonatomic, strong) NSArray *stringsArrayForCause;

@property (nonatomic, strong) NSArray *stringsArrayForLocale;

@property (nonatomic, strong) NSArray *objectsArrayForCause;
@property (nonatomic, strong) NSArray *objectsArrayForLocale;
@property (nonatomic, strong) NSArray *numbersArray;
@property (nonatomic, assign) id selectedObjectForCause;
@property (nonatomic, assign) id selectedObjectForLocale;

@property (nonatomic, strong) NSString * selectedCause;
@property (nonatomic, strong) NSString * selectedLocale;

//@property (nonatomic, retain) NSMutableArray *mutableArray; //put in .h
//- (void)insertObject:atIndex;

@end



@implementation OrganizationSignUpTableViewController

//@synthesize mutableArray;

- (void)viewDidLoad {
    [super viewDidLoad];
  
  //_stringsArray = [[NSArray alloc]initWithArray:[NSArray arrayWithObjects:@"Please Select Cause", @"Animals", @"Environment", @"Sports", @"Education", @"Poverty", @"Religion", @"Children", @"Domestic Violence", @"Health", @"Elderly", @"Culture", @"Arts", nil]];
  _stringsArrayForCause = @[@"Please Select Cause", @"Animals", @"Environment", @"Sports", @"Education", @"Poverty", @"Religion", @"Children", @"Domestic Violence", @"Health", @"Elderly", @"Culture", @"Arts"];
  
  _stringsArrayForLocale = @[@"Seattle Area", @"Remote"];
  
  _selectedObjectForCause = [_objectsArrayForCause objectAtIndex:0];
  _selectedCause = [_stringsArrayForCause objectAtIndex:0];
  
  _selectedObjectForLocale = [_objectsArrayForLocale objectAtIndex:0];
  _selectedLocale = [_stringsArrayForLocale objectAtIndex:0];
  
//  if (_selectedObject == nil) {
//    _selectedObject = [_objectsArray objectAtIndex:0];
//    
//  }
//  
//  if (_selectedString == nil) {
//    _selectedString = [_stringsArray objectAtIndex:0];
//}


  
  // Uncomment the following line to preserve selection between presentations.
  //self.clearsSelectionOnViewWillAppear = NO;
  
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

/*
- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  
  if (_selectedObject == nil) {
    _selectedObject = [_objectsArray objectAtIndex:0];
    
  }
  
  if (_selectedString == nil) {
    _selectedString = [_stringsArray objectAtIndex:0];
  }
  
}

*/


- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  [[self view] endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
  [textField resignFirstResponder];
  return YES;
}

- (IBAction)showPickerViewButtonPressedForLocale:(id)sender {
  
  //[[self view] endEditing:YES];
  
  [MMPickerView showPickerViewInView:self.view
                         withStrings:_stringsArrayForLocale
                         withOptions:@{MMbackgroundColor: [UIColor whiteColor],
                                       MMtextColor: [UIColor blackColor],
                                       MMtoolbarColor: [UIColor whiteColor],
                                       MMbuttonColor: [UIColor blueColor],
                                       MMfont: [UIFont systemFontOfSize:18],
                                       MMvalueY: @3,
                                       MMselectedObject:_selectedLocale,
                                       MMtextAlignment:@1}
                          completion:^(NSString *selectedString) {
                            
                            _oLabelOfLocale.text = selectedString;
                            _selectedLocale = selectedString;
                          }];
  
  
  
  
}

- (IBAction)showPickerViewButtonPressedForCause:(id)sender {
  
  //[[self view] endEditing:YES];
  
  
  [MMPickerView showPickerViewInView:self.view
                         withStrings:_stringsArrayForCause
                         withOptions:@{MMbackgroundColor: [UIColor whiteColor],
                                       MMtextColor: [UIColor blackColor],
                                       MMtoolbarColor: [UIColor whiteColor],
                                       MMbuttonColor: [UIColor blueColor],
                                       MMfont: [UIFont systemFontOfSize:18],
                                       MMvalueY: @3,
                                       MMselectedObject:_selectedCause,
                                       MMtextAlignment:@1}
                          completion:^(NSString *selectedString) {
                            
                            _oLabelOfCause.text = selectedString;
                            _selectedCause = selectedString;
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
