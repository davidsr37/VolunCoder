//
//  EventCell.h
//  VolunCode
//
//  Created by David Rogers on 2/26/15.
//  Copyright (c) 2015 Clint Akins. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *eCause;
@property (strong, nonatomic) IBOutlet UILabel *eEvent;
@property (strong, nonatomic) IBOutlet UILabel *eOrganization;
@property (strong, nonatomic) IBOutlet UILabel *eSkills;
@property (strong, nonatomic) IBOutlet UILabel *eDate;







@end
