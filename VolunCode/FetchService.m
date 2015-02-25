//
//  FetchService.m
//  VolunCode
//
//  Created by Clint on 2/24/15.
//  Copyright (c) 2015 Clint Akins. All rights reserved.
//

#import "FetchService.h"

@implementation FetchService

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

- (Volunteer *)generateVolunteer:(NSDictionary *)volunteerDictionary {

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



@end
