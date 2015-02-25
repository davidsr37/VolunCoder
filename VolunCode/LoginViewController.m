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

- (IBAction)loginButtonPressed:(id)sender {
  
// ******************* Make loginDictionary *******************
NSDictionary *loginDictionary = @{@"email" : self.logEmailTextField,
                                  @"password" : self.logPasswordTextField,
                                  };
  
//[PostAndFetchService sharedService] postLoginIDs:loginDictionary completionHandler:^(NSArray *results, NSString *loginError) {
//   
//   
//   if (Login.role = @"Volunteer") {
//     destinationVC = VOLUNTEER_PROFILE;
//   } else {
//     destinationVC = ORGANIZATION_PROFILE;
//   }
// }

  
// ******* DO a PUSH instead of a segue **********
  
} // close loginButtonPressed



- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
