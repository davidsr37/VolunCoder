//
//  Messenge.h
//  VolunCode
//
//  Created by Clint on 2/25/15.
//  Copyright (c) 2015 Clint Akins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Event, Organization, Volunteer;

@interface Messenge : NSManagedObject

@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) NSDate * timeStamp;
@property (nonatomic, retain) Event *event;
@property (nonatomic, retain) Organization *organization;
@property (nonatomic, retain) Volunteer *volunteer;

@end
