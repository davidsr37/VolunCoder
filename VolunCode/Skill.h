//
//  Skill.h
//  VolunCode
//
//  Created by Clint on 2/25/15.
//  Copyright (c) 2015 Clint Akins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Volunteer, VolunteerProject;

@interface Skill : NSManagedObject

@property (nonatomic, retain) NSNumber * possessed;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSSet *volunteer;
@property (nonatomic, retain) NSSet *volunteerProject;
@end

@interface Skill (CoreDataGeneratedAccessors)

- (void)addVolunteerObject:(Volunteer *)value;
- (void)removeVolunteerObject:(Volunteer *)value;
- (void)addVolunteer:(NSSet *)values;
- (void)removeVolunteer:(NSSet *)values;

- (void)addVolunteerProjectObject:(VolunteerProject *)value;
- (void)removeVolunteerProjectObject:(VolunteerProject *)value;
- (void)addVolunteerProject:(NSSet *)values;
- (void)removeVolunteerProject:(NSSet *)values;

@end
