//
//  CoreDataStack.m
//  VolunCode
//
//  Created by Clint on 2/24/15.
//  Copyright (c) 2015 Clint Akins. All rights reserved.
//

#import "CoreDataStack.h"
#import "Volunteer.h"

@implementation CoreDataStack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

-(instancetype)init {
  self = [super init];
  if (self) {
    [self seedDataBaseWithVolunteer];
  }
  return self;
}

-(void)seedDataBaseWithVolunteer {
  NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Volunteer"];
  NSError *fetchError;
  
  NSInteger fetchResults = [self.managedObjectContext countForFetchRequest:fetchRequest error:&fetchError];
  NSLog(@"%ld", (long)fetchResults);
  
  if (fetchResults == 0) {
    NSURL *seedURL = [[NSBundle mainBundle]URLForResource:@"testSeed" withExtension:@"json"];
    NSData *seedData = [[NSData alloc] initWithContentsOfURL:seedURL];
    NSError *seedError;
    NSDictionary *seedDictionary = [NSJSONSerialization JSONObjectWithData:seedData options:0 error:&seedError];
    if (!seedError) {
      NSArray *jsonArray = seedDictionary[@"userSchema"];
      for (NSDictionary *volunteerDictionary in jsonArray) {
        NSLog(@"%@", jsonArray);
        Volunteer *volunteer = [NSEntityDescription insertNewObjectForEntityForName:@"Volunteer" inManagedObjectContext:self.managedObjectContext];
        volunteer.firstName = volunteerDictionary[@"firstName"];
        volunteer.lastName = volunteerDictionary[@"lastName"];
        volunteer.location = volunteerDictionary[@"location"];
//        volunteer.avatar = volunteerDictionary[@"avatar"];
//        volunteer.bio = volunteerDictionary[@"bio"];
        NSLog(@"%@", volunteer.firstName);
        NSLog(@"%@", volunteer.lastName);
//        NSLog(@"%@", volunteer.avatar);
//        NSLog(@"%@", volunteer.bio);
      
      }
    
    NSError *saveError;
    [self.managedObjectContext save:&saveError];
    if (saveError) {
      NSLog(@"%@", saveError);
    }
    }
  }
  
}

- (NSURL *)applicationDocumentsDirectory {
  // The directory the application uses to store the Core Data store file. This code uses a directory named "ClintAkins.VolunCode" in the application's documents directory.
  return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
  // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
  if (_managedObjectModel != nil) {
    return _managedObjectModel;
  }
 _managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
  return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
  // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
  if (_persistentStoreCoordinator != nil) {
    return _persistentStoreCoordinator;
  }
  
  // Create the coordinator and store
  
  _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
  NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"VolunCode.sqlite"];
  NSError *error = nil;
  NSString *failureReason = @"There was an error creating or loading the application's saved data.";
  if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
    // Report any error we got.
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
    dict[NSLocalizedFailureReasonErrorKey] = failureReason;
    dict[NSUnderlyingErrorKey] = error;
    error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
    // Replace this with code to handle the error appropriately.
    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    abort();
  }
  
  return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
  // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
  if (_managedObjectContext != nil) {
    return _managedObjectContext;
  }
  
  NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
  if (!coordinator) {
    return nil;
  }
  _managedObjectContext = [[NSManagedObjectContext alloc] init];
  [_managedObjectContext setPersistentStoreCoordinator:coordinator];
  return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
  NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
  if (managedObjectContext != nil) {
    NSError *error = nil;
    if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
      // Replace this implementation with code to handle the error appropriately.
      // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
      NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
      abort();
    }
  }
}


@end
