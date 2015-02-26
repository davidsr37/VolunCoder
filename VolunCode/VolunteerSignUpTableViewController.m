//
//  VolunteerSignUpTableViewController.m
//  VolunCode
//
//  Created by Annemarie Ketola on 2/24/15.
//  Copyright (c) 2015 Clint Akins. All rights reserved.
//

#import "VolunteerSignUpTableViewController.h"
#import "PostAndFetchService.h"

@interface VolunteerSignUpTableViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *vEmailTextField;
@property (weak, nonatomic) IBOutlet UITextField *vPasswordTextField;
@property (weak, nonatomic) IBOutlet UITextField *vFirstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *vLastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *vCityTextField;
@property (weak, nonatomic) IBOutlet UIImageView *vAvatarImage;
@property (weak, nonatomic) IBOutlet UITextView *vBioTextField;
@property (weak, nonatomic) IBOutlet UISwitch *vAgeReqSwitch;
@property (strong, nonatomic) NSString *avatarString;

@end

@implementation VolunteerSignUpTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (IBAction)addAvatarImageButtonPressed:(id)sender {
  
  if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
  //iniatates the UIImagePickerController
  UIImagePickerController *pickerC = [[UIImagePickerController alloc] init];
  // sets itself as the delegate
  pickerC.delegate = self;
    pickerC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    pickerC.mediaTypes = [NSArray arrayWithObjects:(NSString *) kUTTypeImage, nil];
    pickerC.allowsEditing = NO;
  [self presentViewController:pickerC animated:YES completion:nil];
  }
  
}

// dismisses the UIPickerController when you are done picking an image
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
  NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
  [self dismissViewControllerAnimated:YES completion:nil];
  if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
    UIImage *avatarImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.vAvatarImage.image = avatarImage;
    
    NSData *avatarData = UIImagePNGRepresentation(avatarImage);
    self.avatarString = [[NSString alloc] initWithData:avatarData encoding:NSUTF8StringEncoding];
    //[UIImagePNGRepresentation(avatarImage) base64EncodedDataWithOptions:nil];
  }
  NSLog(@"%@", info);
}

// dismisses the UIPickerController if you decide to cancel
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)submitVolunteerProfileButtonPressed:(id)sender {
  
  //Make dictionary to hold volunteer's Login inputs
  NSDictionary *profileLoginDictionary = @{@"email" : self.vEmailTextField,
                                           @"password" : self.vPasswordTextField,
                                           @"role" : @"volunteer",
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
  
  NSDictionary *profileDictionary = @{@"firstname" : self.vFirstNameTextField,
                                      @"lastname" : self.vLastNameTextField,
                                      @"city" : self.vCityTextField,
                                      @"bio" : self.vBioTextField,
                                      @"ageReq" : self.vAgeReqSwitch,
                                      @"avatar" : self.avatarString,
                                      };
  
  // not sure what to do with the @"avatar" : self.vAvatarImage,
  
[[PostAndFetchService sharedService]createVolunteerProfile:profileDictionary completionHandler:^(NSArray *results, NSString *createProfileError) {
  
  
}];
  

  
  
} // close submitVolunteerProfileButtonPressed


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
