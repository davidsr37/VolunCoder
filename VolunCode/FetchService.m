//
//  FetchService.m
//  VolunCode
//
<<<<<<< HEAD
//  Created by Annemarie Ketola on 2/25/15.
=======
//  Created by Clint on 2/24/15.
>>>>>>> master1
//  Copyright (c) 2015 Clint Akins. All rights reserved.
//

#import "FetchService.h"

@implementation FetchService

<<<<<<< HEAD
=======
+(id)sharedServices {
  static FetchService *newSharedServices = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    newSharedServices = [[self alloc]init];
  });
  return newSharedServices;
}

-(instancetype)init {
  self = [super init];
  if(self) {
    self.coreDataStack = [[CoreDataStack alloc]init];
  }
  return self;
}

-(Login *)generateLogin:(NSDictionary *)loginDictionary {
  NSManagedObjectContext *context = [[[FetchService sharedServices]coreDataStack]managedObjectContext];
  Login *login = [NSEntityDescription insertNewObjectForEntityForName:@"Login" inManagedObjectContext:context];
  login.email = loginDictionary[@"email"];
  login.password = loginDictionary[@"password"];
  login.role = loginDictionary[@"role"];
  login.type = loginDictionary[@"type"];
  
  NSError *saveError;
  [context save:&saveError];
  if (saveError) {
    NSLog(@"%@", saveError);
  }
  return login;  
}

-(Volunteer *)generateVolunteer:(NSDictionary *)volunteerDictionary {

  NSManagedObjectContext *context = [[[FetchService sharedServices]coreDataStack]managedObjectContext];
  
  Volunteer *volunteer = [NSEntityDescription insertNewObjectForEntityForName:@"Volunteer" inManagedObjectContext:context];
  volunteer.firstName = volunteerDictionary[@"firstName"];
  volunteer.lastName = volunteerDictionary[@"lastName"];
  volunteer.location = volunteerDictionary[@"location"];
  volunteer.ageReq = volunteerDictionary[@"ageReq"];
  NSLog(@"%@", volunteer.firstName);
  NSLog(@"%@", volunteer.lastName);
  NSLog(@"%@", volunteer.location);
  NSLog(@"%@", volunteer.ageReq);
  
  NSError *saveError;
  [context save:&saveError];
  if (saveError) {
    NSLog(@"%@", saveError);
  }
  return volunteer;
}

-(Organization *)generateOrganization:(NSDictionary *)orgDictionary {
  NSManagedObjectContext *context = [[[FetchService sharedServices]coreDataStack]managedObjectContext];
  Organization *organization = [NSEntityDescription insertNewObjectForEntityForName:@"Organization" inManagedObjectContext:context];
  organization.name = orgDictionary[@"name"];
  organization.address = orgDictionary[@"address"];
  organization.city = orgDictionary[@"city"];
  organization.email = orgDictionary[@"email"];
  organization.firstNameContact = orgDictionary[@"firstNameContact"];
  organization.lastNameContact = orgDictionary[@"lastNameContact"];
  organization.mission = orgDictionary[@"mission"];
  organization.phone = orgDictionary[@"phone"];
  organization.website = orgDictionary[@"website"];
  organization.logo = orgDictionary[@"logo"];
  
  NSError *saveError;
  [context save:&saveError];
  if (saveError) {
    NSLog(@"%@", saveError);
  }
  return organization;
}





>>>>>>> master1
@end
