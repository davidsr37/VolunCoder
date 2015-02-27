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

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  return NO;
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
//  NSDictionary *profileDictionary = @{
//                                      @"credential" : @{
//                                          @"Basic" : @{
//                                                         @"email" : self.vEmailTextField.text,
//                                                         @"password" : self.vPasswordTextField.text,
//                                                         },
//                                            @"role" : @"volunteer",
//                                           },
//                                        @"profileinfo" : @{
//                                          @"email" : self.vEmailTextField.text,
//                                          @"name" : @{
//                                                        @"firstname" : self.vFirstNameTextField.text,
//                                                        @"lastname" : self.vLastNameTextField.text,
//                                                    },
//                                          @"ageReq" : self.vAgeReqSwitch,
//                                          @"city" : self.vCityTextField.text,
//                                          @"bio" : self.vBioTextField.text,
//                                          @"avatar" : self.avatarString,
//                                                           }
//                                         };
//
  
  NSString *token = @"4Lphc97wg13BNy0EA6XZY0F9xn5wI+fU1O+cAiokCTUn68j/Pv+XDi9s/ZW+to7ljZVxtjVTC5xAVeQ=";
  
  [[PostAndFetchService sharedService]fetchEvents:token completionHandler:^(NSDictionary *results, NSString *fetchEventsError) {
    
  }];
  
//  NSDictionary *profileDictionary = @{
//                                      @"credential" : @{
//                                          @"basic" : @{
//                                              @"email" : @"test3.com",
//                                              @"password" : @"pass3",
//                                              },
//                                          @"role" : @"volunteer",
//                                          },
//                                      @"profileInfo" : @{
//                                          @"email" : @"test3.com",
//                                          @"name" : @{
//                                              @"firstname" : @"anne3",
//                                              @"lastname" : @"last3",
//                                              },
//                                          @"ageReq" : @true,
//                                          @"city" : @"Seattle",
//                                          @"bio" : @"Stuff about me!",
//                                          @"avatar" : @"imagestring3",
//                                          }
//                                      };
//  
//  // not sure what to do with the @"avatar" : self.vAvatarImage,
//  
//[[PostAndFetchService sharedService]createVolunteerProfile:profileDictionary completionHandler:^(NSDictionary *results, NSString *createProfileError) {
//}];
  

  
} // close submitVolunteerProfileButtonPressed


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - Table view data source
//
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
