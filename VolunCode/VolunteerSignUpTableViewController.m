//
//  VolunteerSignUpTableViewController.m
//  VolunCode
//
//  Created by Annemarie Ketola on 2/24/15.
//  Copyright (c) 2015 Clint Akins. All rights reserved.
//

#import "VolunteerSignUpTableViewController.h"

@interface VolunteerSignUpTableViewController () <UIImagePickerControllerDelegate, UINavigationBarDelegate>
@property (weak, nonatomic) IBOutlet UITextField *vEmailTextField;
@property (weak, nonatomic) IBOutlet UITextField *vPasswordTextField;
@property (weak, nonatomic) IBOutlet UITextField *vFirstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *vLastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *vCityTextField;
@property (weak, nonatomic) IBOutlet UIImageView *vAvatarImage;
@property (weak, nonatomic) IBOutlet UITextView *vBioTextField;
@property (weak, nonatomic) IBOutlet UISwitch *vAgeReqSwitch;

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
                                      };
  
  // not sure what to do with the @"avatar" : self.vAvatarImage,
  
  NSError *error;
  //  NSData *profileJsonData = [NSJSONSerialization dataWithJSONObject:profileDictionary options:kNilOptions error:&error];
  NSData *profileJsonData = [NSJSONSerialization dataWithJSONObject:profileDictionary options:NSJSONWritingPrettyPrinted error:&error];
  
  if (!profileJsonData) {
    //    NSLog(@"profileJsonDataError: ", error.localizedDescription);
  } else {
    NSString *JSONProfileString = [[NSString alloc] initWithBytes:[profileJsonData bytes] length:[profileJsonData length] encoding:NSUTF8StringEncoding];
    //    NSLog(@"profileJsonData: ", profileJsonData);
  }
  
  NSURL *url = [NSURL URLWithString:@"http://jsfiddle.net/chengzh2008/y7tcLL13/12/#"];
  
  NSMutableURLRequest *createVolunteerProfileRequest = [[NSMutableURLRequest alloc] initWithURL:url];
  
  [createVolunteerProfileRequest setHTTPMethod:@"POST"];
  [createVolunteerProfileRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
  [createVolunteerProfileRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  [createVolunteerProfileRequest setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[profileJsonData length]] forHTTPHeaderField:@"Content-Length"];
  [createVolunteerProfileRequest setHTTPBody:profileJsonData];
  
  NSURLConnection *connection = [NSURLConnection connectionWithRequest:createVolunteerProfileRequest delegate:self];
  
  
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
