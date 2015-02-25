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
@property (weak, nonatomic) IBOutlet UIImageView *oLogoImage;
@property (weak, nonatomic) IBOutlet UITextView *oOrganizationNameTextField;
@property (weak, nonatomic) IBOutlet UITextView *oMissionTextField;
@property (weak, nonatomic) IBOutlet UITextView *oAddressTextField;
@property (weak, nonatomic) IBOutlet UITextView *oPhoneTextField;
@property (weak, nonatomic) IBOutlet UITextView *oWebsiteTextField;

@end

@implementation OrganizationSignUpTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (IBAction)submitOrganizationProfileButtonPressed:(id)sender {
  
  //Make dictionary to hold volunteer's Login inputs
  NSDictionary *profileLoginDictionary = @{@"email" : self.oEmailTextField,
                                           @"password" : self.oPasswordTextField,
                                           @"role" : @"organization",
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

@end
