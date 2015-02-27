//
//  CausesViewController.m
//  VolunCode
//
//  Created by Clint on 2/23/15.
//  Copyright (c) 2015 Clint Akins. All rights reserved.
//

#import "CausesViewController.h"

@interface CausesViewController ()

@property (strong, nonatomic) IBOutlet UISwitch *cAnimalsSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *cEnvironmentSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *cSportsSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *cEducationSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *cPoverty;
@property (strong, nonatomic) IBOutlet UISwitch *cReligionSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *cChildrenSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *cDomesticViolenceSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *cHealthSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *cElderlySwitch;
@property (strong, nonatomic) IBOutlet UISwitch *cCultureSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *cArtsSwitch;





@end

@implementation CausesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
