//
//  PostAndFetchService.h
//  VolunCode
//
//  Created by Annemarie Ketola on 2/24/15.
//  Copyright (c) 2015 Clint Akins. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostAndFetchService : NSObject

+(id)sharedService;

-(void)postLoginIDs:(NSDictionary *)loginDictionary completionHandler:(void (^)(NSDictionary *, NSString *))completionHandler;

-(void)createVolunteerProfile:(NSDictionary *)volunteerProfileDictionary completionHandler:(void (^)(NSDictionary *, NSString *)) completionHandler;

-(void)createOrganizationProfile:(NSDictionary *)organizationProfileDictionary completionHandler:(void (^)(NSDictionary *, NSString *)) completionHandler;

-(void)createEvent:(NSDictionary *)createEventDictionary completionHandler:(void (^)(NSDictionary *, NSString *)) completionHandler;

-(void)fetchEvents:(NSDictionary *)tokenDictionary completionHandler:(void (^)(NSDictionary *, NSString *)) completionHandler;

@end