//
//  FetchService.m
//  VolunCode
//
//  Created by Annemarie Ketola on 2/25/15.
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

//-(Login *)generateLogin:(NSDictionary *)loginDictionary {
//  NSManagedObjectContext *context = [[[FetchService sharedServices]coreDataStack]managedObjectContext];
//  Login *login = [NSEntityDescription insertNewObjectForEntityForName:@"Login" inManagedObjectContext:context];
//  login.email = loginDictionary[@"email"];
//  login.password = loginDictionary[@"password"];
//  login.role = loginDictionary[@"role"];
//  login.type = loginDictionary[@"type"];
//
//  NSError *saveError;
//  [context save:&saveError];
//  if (saveError) {
//    NSLog(@"%@", saveError);
//  }
//  return login;
//}

-(Volunteer *)parseForVolunteer:(NSDictionary *)volunteerDictionary {
  NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"Volunteer"];
  NSError *fetchError;
  NSInteger fetchResults = [[[[FetchService sharedServices]coreDataStack]managedObjectContext] countForFetchRequest:fetchRequest error:&fetchError];
  NSManagedObjectContext *context = [[[FetchService sharedServices]coreDataStack]managedObjectContext];
  Volunteer *volunteer = [NSEntityDescription insertNewObjectForEntityForName:@"Volunteer" inManagedObjectContext:context];
  NSLog(@"%ld", (long)fetchResults);
  
  if (fetchResults == 0) {
//    NSURL *url = [[NSBundle mainBundle]URLForResource:@"test2" withExtension:@"json"];
//    NSData *data = [[NSData alloc]initWithContentsOfURL:url];
//    NSError *error;
    //    NSDictionary *fetchDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    //if (!error) {
      NSString *email = volunteerDictionary[@"email"];
      BOOL ageReq = volunteerDictionary[@"ageReq"];
      NSString *city = volunteerDictionary[@"city"];
      NSString *bio = volunteerDictionary[@"bio"];
      NSDictionary *nameDictionary = volunteerDictionary[@"name"];
      NSString *firstName = nameDictionary[@"firstname"];
      NSString *lastName = nameDictionary[@"lastname"];
      
      NSError *saveError;
      [context save:&saveError];
      if (saveError) {
        NSLog(@"%@", saveError);
      }
    return volunteer;
  }
  return nil;
}


-(Organization *)parseForOrganization:(NSDictionary *)orgDictionary {
  NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"Organization"];
  NSError *fetchError;
  NSInteger fetchResults = [[[[FetchService sharedServices]coreDataStack]managedObjectContext] countForFetchRequest:fetchRequest error:&fetchError];
  NSManagedObjectContext *context = [[[FetchService sharedServices]coreDataStack]managedObjectContext];
  Organization *organization = [NSEntityDescription insertNewObjectForEntityForName:@"Organization" inManagedObjectContext:context];
  NSLog(@"%ld", (long)fetchResults);
  
  if (fetchResults == 0) {
//    NSURL *url = [[NSBundle mainBundle]URLForResource:@"test2" withExtension:@"json"];
//    NSData *data = [[NSData alloc]initWithContentsOfURL:url];
//    NSError *error;
    //    NSDictionary *fetchDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    //if (!error) {
      NSString *address = orgDictionary[@"address"];
      NSString *name = orgDictionary[@"name"];
      NSString *city = orgDictionary[@"city"];
      NSString *email = orgDictionary[@"email"];
      NSString *firstNameContact = orgDictionary[@"firstNameContact"];
      NSString *lastNameContact = orgDictionary[@"lastNameContact"];
      NSString *mission = orgDictionary[@"mission"];
      NSString *phone = orgDictionary[@"phone"];
      NSString *website = orgDictionary[@"website"];
      
      NSError *saveError;
      [context save:&saveError];
      if (saveError) {
        NSLog(@"%@", saveError);
      }
      return organization;
    //}
  }
  return nil;
}

-(Event *)parseForEvent:(NSDictionary *)eventDictionary {
  NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"Event"];
  NSError *fetchError;
  NSInteger fetchResults = [[[[FetchService sharedServices]coreDataStack]managedObjectContext] countForFetchRequest:fetchRequest error:&fetchError];
  NSManagedObjectContext *context = [[[FetchService sharedServices]coreDataStack]managedObjectContext];
  Event *event = [NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:context];
  NSLog(@"%ld", (long)fetchResults);
  if (fetchResults == 0) {
//    NSURL *url = [[NSBundle mainBundle]URLForResource:@"test2" withExtension:@"json"];
//    NSData *data = [[NSData alloc]initWithContentsOfURL:url];
//    NSError *error;
    //if (!error) {
      NSDate *date = eventDictionary[@"date"];
      NSDate *time = eventDictionary[@"time"];
      NSString *title = eventDictionary[@"title"];
      NSString *location = eventDictionary[@"location"];
      NSString *eventDescription = eventDictionary[@"description"];
      
      NSError *saveError;
      [context save:&saveError];
      if (saveError) {
        NSLog(@"%@", saveError);
      }
      return event;
    //}
  }
  return nil;
}


@end

