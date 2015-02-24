//
//  VolunteerProject.h
//  VolunCode
//
//  Created by Clint on 2/24/15.
//  Copyright (c) 2015 Clint Akins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Event, Skill, Volunteer;

@interface VolunteerProject : NSManagedObject

@property (nonatomic, retain) NSNumber * numberOfVolunteers;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) Event *event;
@property (nonatomic, retain) NSSet *skill;
@property (nonatomic, retain) NSSet *volunteer;
@end

@interface VolunteerProject (CoreDataGeneratedAccessors)

- (void)addSkillObject:(Skill *)value;
- (void)removeSkillObject:(Skill *)value;
- (void)addSkill:(NSSet *)values;
- (void)removeSkill:(NSSet *)values;

- (void)addVolunteerObject:(Volunteer *)value;
- (void)removeVolunteerObject:(Volunteer *)value;
- (void)addVolunteer:(NSSet *)values;
- (void)removeVolunteer:(NSSet *)values;

@end
