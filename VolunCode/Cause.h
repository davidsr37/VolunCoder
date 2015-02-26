//
//  Cause.h
//  VolunCode
//
//  Created by Clint on 2/25/15.
//  Copyright (c) 2015 Clint Akins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Organization, Volunteer;

@interface Cause : NSManagedObject

@property (nonatomic, retain) NSNumber * isInterested;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSSet *organization;
@property (nonatomic, retain) NSSet *volunteer;
@end

@interface Cause (CoreDataGeneratedAccessors)

- (void)addOrganizationObject:(Organization *)value;
- (void)removeOrganizationObject:(Organization *)value;
- (void)addOrganization:(NSSet *)values;
- (void)removeOrganization:(NSSet *)values;

- (void)addVolunteerObject:(Volunteer *)value;
- (void)removeVolunteerObject:(Volunteer *)value;
- (void)addVolunteer:(NSSet *)values;
- (void)removeVolunteer:(NSSet *)values;

@end
