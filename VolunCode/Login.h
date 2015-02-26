//
//  Login.h
//  VolunCode
//
//  Created by Clint on 2/25/15.
//  Copyright (c) 2015 Clint Akins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Organization, Volunteer;

@interface Login : NSManagedObject

@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * role;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) Organization *organization;
@property (nonatomic, retain) Volunteer *volunteer;

@end
