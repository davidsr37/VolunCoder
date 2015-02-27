//
//  EventCell.m
//  VolunCode
//
//  Created by David Rogers on 2/26/15.
//  Copyright (c) 2015 Clint Akins. All rights reserved.
//

#import "EventCell.h"
/*
 OUTLETS @INTERFACE IN .H FILE
 
 */


@implementation EventCell

- (void)awakeFromNib {
    // Initialization code
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  return NO;
}

@end
