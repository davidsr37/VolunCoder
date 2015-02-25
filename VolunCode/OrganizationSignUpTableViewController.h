//
//  OrganizationSignUpTableViewController.h
//  VolunCode
//
//  Created by Annemarie Ketola on 2/24/15.
//  Copyright (c) 2015 Clint Akins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMPickerView.h"

@interface OrganizationSignUpTableViewController : UITableViewController


//@property(nonatomic ,retain)NSArray *theArray;
//@property(nonatomic)NSUInteger selectedRow;

- (IBAction)showPickerViewButtonPressed:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *buttonForCause;
//- (void)insertObject:atIndex;
//- (void)exchangeObjectAtIndex:(NSUInteger)0 withObjectAtIndex:(NSUInteger)1;
@end
