//
//  UserDetailViewController.m
//  VolunCode
//
//  Created by Clint on 2/23/15.
//  Copyright (c) 2015 Clint Akins. All rights reserved.
//

#import "UserDetailViewController.h"
#import "Volunteer.h"
#import "FetchService.h"
#import "Login.h"

@interface UserDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *volunteerNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *volunteerLocationLabel;
@property (weak, nonatomic) IBOutlet UITextView *volunteerBioLabel;
@property (weak, nonatomic) IBOutlet UIImageView *volunteerAvatarImage;
//@property (strong, nonatomic) NSArray *volunteers;

@end

@implementation UserDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

  // ********* Below code used to test parsing of Volunteer, use FetchService parseForVolunteer method instead *********
  
  NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"Volunteer"];
  NSError *fetchError;
  
  NSInteger fetchResults = [[[[FetchService sharedServices]coreDataStack]managedObjectContext] countForFetchRequest:fetchRequest error:&fetchError];
  NSLog(@"%ld", (long)fetchResults);
  
  if (fetchResults == 0) {
    NSURL *url = [[NSBundle mainBundle]URLForResource:@"test2" withExtension:@"json"];
    NSData *data = [[NSData alloc]initWithContentsOfURL:url];
    NSError *error;
    NSDictionary *fetchDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    if (!error) {
      NSString *email = fetchDictionary[@"email"];
      BOOL ageReq = fetchDictionary[@"ageReq"];
      NSString *city = fetchDictionary[@"city"];
      NSString *bio = fetchDictionary[@"bio"];
      NSDictionary *nameDictionary = fetchDictionary[@"name"];
      NSString *firstName = nameDictionary[@"firstname"];
      NSString *lastName = nameDictionary[@"lastname"];
      
      NSLog(@"%@", firstName);
  // ********* Above code used to test parsing of Volunteer, use FetchService parseForVolunteer method instead  *********
      
      
      _volunteerLocationLabel.text = city;
      _volunteerNameLabel.text = firstName;
      
    }
  }

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  return NO;
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
