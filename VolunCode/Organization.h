//
//  Organization.h
//  VolunCode
//
//  Created by Clint on 2/24/15.
//  Copyright (c) 2015 Clint Akins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Cause, Event, Login, Messenge;

@interface Organization : NSManagedObject

@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * firstNameContact;
@property (nonatomic, retain) NSString * lastNameContact;
@property (nonatomic, retain) id logo;
@property (nonatomic, retain) NSString * mission;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * phone;
@property (nonatomic, retain) NSString * website;
@property (nonatomic, retain) Cause *cause;
@property (nonatomic, retain) NSSet *event;
@property (nonatomic, retain) Login *login;
@property (nonatomic, retain) NSSet *messenge;
@end

@interface Organization (CoreDataGeneratedAccessors)

- (void)addEventObject:(Event *)value;
- (void)removeEventObject:(Event *)value;
- (void)addEvent:(NSSet *)values;
- (void)removeEvent:(NSSet *)values;

- (void)addMessengeObject:(Messenge *)value;
- (void)removeMessengeObject:(Messenge *)value;
- (void)addMessenge:(NSSet *)values;
- (void)removeMessenge:(NSSet *)values;

@end
