//
//  ViewController.m
//  VolunCode
//
//  Created by Clint on 2/23/15.
//  Copyright (c) 2015 Clint Akins. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *lEmailTextField;
@property (weak, nonatomic) IBOutlet UITextField *lPasswordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)loginButtonPressed:(id)sender {
  
// ******************* Make loginDictionary *******************
NSDictionary *loginDictionary = @{@"email" : self.lEmailTextField,
                                  @"password" : self.lPasswordTextField,
                                  };
  
// ******************* Change the loginDictionary into a JSON file *******************
NSError *errorLogin;
//  NSData *loginJsonData = [NSJSONSerialization dataWithJSONObject:loginDictionary options:kNilOptions error:&error];
NSData *loginJsonData = [NSJSONSerialization dataWithJSONObject:loginDictionary options:NSJSONWritingPrettyPrinted error:&errorLogin];

if (!loginJsonData) {
  //    NSLog(@"loginJsonDataError: ", error.localizedDescription);
} else {
  NSString *JSONLoginString = [[NSString alloc] initWithBytes:[loginJsonData bytes] length:[loginJsonData length] encoding:NSUTF8StringEncoding];
  //    NSLog(@"profileJsonData: ", profileJsonData);
}
  
  
  
  
  
} // close loginButtonPressed

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
