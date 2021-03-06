//
//  FetchService.h
//  VolunCode
//
//  Created by Annemarie Ketola on 2/25/15.
//  Created by Clint on 2/24/15.
//  Copyright (c) 2015 Clint Akins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreDataStack.h"
#import "Volunteer.h"
#import "Organization.h"
#import "Login.h"
#import "Event.h"

@interface FetchService : NSObject

@property (strong, nonatomic) CoreDataStack *coreDataStack;

+(id)sharedServices;

-(Volunteer *) saveFetch;

-(Volunteer *)parseForVolunteer:(NSDictionary *)volunteerDictionary;
-(Organization *)parseForOrganization:(NSDictionary *)orgDictionary;
-(Event *)parseForEvent:(NSDictionary *)eventDictionary;
-(Login *)generateLogin:(NSDictionary *)loginDictionary;



@end
