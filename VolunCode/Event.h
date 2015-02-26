//
//  Event.h
//  VolunCode
//
//  Created by Clint on 2/25/15.
//  Copyright (c) 2015 Clint Akins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Messenge, Organization, Volunteer, VolunteerProject;

@interface Event : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * eventDescription;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSDate * time;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * volunteersNeeded;
@property (nonatomic, retain) NSSet *messenge;
@property (nonatomic, retain) Organization *organization;
@property (nonatomic, retain) NSSet *volunteer;
@property (nonatomic, retain) VolunteerProject *volunteerProject;
@end

@interface Event (CoreDataGeneratedAccessors)

- (void)addMessengeObject:(Messenge *)value;
- (void)removeMessengeObject:(Messenge *)value;
- (void)addMessenge:(NSSet *)values;
- (void)removeMessenge:(NSSet *)values;

- (void)addVolunteerObject:(Volunteer *)value;
- (void)removeVolunteerObject:(Volunteer *)value;
- (void)addVolunteer:(NSSet *)values;
- (void)removeVolunteer:(NSSet *)values;

@end
