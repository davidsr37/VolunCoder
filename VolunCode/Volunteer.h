//
//  Volunteer.h
//  VolunCode
//
//  Created by Clint on 2/26/15.
//  Copyright (c) 2015 Clint Akins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Cause, Event, Login, Messenge, Skill, VolunteerProject;

@interface Volunteer : NSManagedObject

@property (nonatomic, retain) NSNumber * ageReq;
@property (nonatomic, retain) id avatar;
@property (nonatomic, retain) NSString * bio;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * role;
@property (nonatomic, retain) NSSet *cause;
@property (nonatomic, retain) NSSet *event;
@property (nonatomic, retain) Login *login;
@property (nonatomic, retain) NSSet *messenge;
@property (nonatomic, retain) NSSet *skill;
@property (nonatomic, retain) VolunteerProject *volunteerProject;
@end

@interface Volunteer (CoreDataGeneratedAccessors)

- (void)addCauseObject:(Cause *)value;
- (void)removeCauseObject:(Cause *)value;
- (void)addCause:(NSSet *)values;
- (void)removeCause:(NSSet *)values;

- (void)addEventObject:(Event *)value;
- (void)removeEventObject:(Event *)value;
- (void)addEvent:(NSSet *)values;
- (void)removeEvent:(NSSet *)values;

- (void)addMessengeObject:(Messenge *)value;
- (void)removeMessengeObject:(Messenge *)value;
- (void)addMessenge:(NSSet *)values;
- (void)removeMessenge:(NSSet *)values;

- (void)addSkillObject:(Skill *)value;
- (void)removeSkillObject:(Skill *)value;
- (void)addSkill:(NSSet *)values;
- (void)removeSkill:(NSSet *)values;

@end
