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

// covert JSON string to image - Option 1
//  NSData *dataImage = [[NSData alloc] initWithBase64EncodedString:jsonArray[key] options:0];
//  NSData *fromJsonDataImage = [[NSData alloc] initWithBase64EncodedString:volunteer.avatar options:0];
//  UIImage *img = UIImage imageWithData:fromJsonDataImage];
  
// covert JSON string to image - Option 2
//  NSData *imageData = [[NSData alloc]initWithBase64EncodedString:fromJsonDataImage options:NSDataBase64DecodingIgnoreUnknownCharacters];
//  UIImage *image = [UIImage imageWithData: imageData];
  
    // Do any additional setup after loading the view.
  
//  NSString *fullname = (@"%@ %@", volunteer.firstName, volunteer.lastName);
//  self.volunteerNameLabel.text = fullname;
//  self.volunteerLocationLabel.text = volunteer.location;
//  self.volunteerBioLabel.text = volunteer.bio;
//  self.volunteerAvatarImage = volunteer.avatar;
//  self.volunteerAvatarImage = img;
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
