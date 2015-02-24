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

@interface UserDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *volunteerNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *volunteerLocationLabel;


@end

@implementation UserDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  Volunteer *volunteer = [NSEntityDescription insertNewObjectForEntityForName:@"Volunteer" inManagedObjectContext:[[FetchService sharedServices]coreDataStack].managedObjectContext];
  volunteer.firstName = self.volunteerNameLabel.text;
  volunteer.location = self.volunteerLocationLabel.text;
  
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
