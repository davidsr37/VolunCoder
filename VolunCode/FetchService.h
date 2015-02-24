//
//  FetchService.h
//  VolunCode
//
//  Created by Clint on 2/24/15.
//  Copyright (c) 2015 Clint Akins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreDataStack.h"
#import "Volunteer.h"

@interface FetchService : NSObject

@property (strong, nonatomic) CoreDataStack *coreDataStack;

+(id)sharedServices;

-(Volunteer *) saveFetch;


@end