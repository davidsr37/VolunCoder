//
//  ViewController.m
//  VolunCode
//
//  Created by Clint on 2/23/15.
//  Copyright (c) 2015 Clint Akins. All rights reserved.
//

#import "LoginViewController.h"
#import "PostAndFetchService.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *logEmailTextField;
@property (weak, nonatomic) IBOutlet UITextField *logPasswordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  return NO;
}




- (IBAction)loginButtonPressed:(id)sender {
  
// ******************* Make loginDictionary *******************
//NSDictionary *loginDictionary = @{@"email" : self.logEmailTextField.text,
//                                  @"password" : self.logPasswordTextField.text,
//
//};
  
  NSLog(@"email = %@", self.logEmailTextField.text);
  NSLog(@"password = %@", self.logPasswordTextField.text);
  
  NSString *email = self.logEmailTextField.text;
  NSString *password = self.logPasswordTextField.text;
  NSString *colon = @":";
  
  NSString *loginString = [NSString stringWithFormat: @"%@%@%@", email, colon, password];
  

  
//NSDictionary *loginDictionary = @{@"email" : @"456@abc.com",
//                                    @"password" : @"12345",
//                                    };
  
  NSLog(@"loginString = %@", loginString);
  
  
[[PostAndFetchService sharedService] postLoginIDs:loginString completionHandler:^(NSDictionary *results, NSString *loginError) {
   
   
//   if (Login.role = @"Volunteer") {
//     destinationVC = VOLUNTEER_PROFILE;
//   } else {
//     destinationVC = ORGANIZATION_PROFILE;
//   }
}];

  
// ******* DO a PUSH instead of a segue ********** (can do push and segue together?)
  
} // close loginButtonPressed



- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
