//
//  FetchService.h
//  VolunCode
//
<<<<<<< HEAD
//  Created by Annemarie Ketola on 2/25/15.
=======
//  Created by Clint on 2/24/15.
>>>>>>> master1
//  Copyright (c) 2015 Clint Akins. All rights reserved.
//

#import <Foundation/Foundation.h>
<<<<<<< HEAD

@interface FetchService : NSObject

=======
#import "CoreDataStack.h"
#import "Volunteer.h"
#import "Organization.h"
#import "Login.h"

@interface FetchService : NSObject

@property (strong, nonatomic) CoreDataStack *coreDataStack;

+(id)sharedServices;

-(Volunteer *) saveFetch;

- (Volunteer *)generateVolunteer:(NSDictionary *)volunteerDictionary;




>>>>>>> master1
@end
