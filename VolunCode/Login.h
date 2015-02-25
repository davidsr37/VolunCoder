//
//  Login.h
//  VolunCode
//
//  Created by Clint on 2/24/15.
//  Copyright (c) 2015 Clint Akins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Organization, Volunteer;

@interface Login : NSManagedObject

+(NSArray *)loginFromJson:(NSData *)jsonData;

@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) Organization *organization;
@property (nonatomic, retain) Volunteer *volunteer;

@end
