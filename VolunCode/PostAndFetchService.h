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

-(void)postLoginIDs:(NSString *)loginString completionHandler:(void (^)(NSDictionary *, NSString *))completionHandler;

-(void)createVolunteerProfile:(NSDictionary *)volunteerProfileDictionary completionHandler:(void (^)(NSDictionary *, NSString *)) completionHandler;

-(void)createOrganizationProfile:(NSDictionary *)organizationProfileDictionary completionHandler:(void (^)(NSDictionary *, NSString *)) completionHandler;

-(void)createEvent:(NSDictionary *)createEventDictionary withToken:(NSString *)token completionHandler:(void (^)(NSDictionary *, NSString *)) completionHandler;

-(void)fetchEvents:(NSString *)token completionHandler:(void (^)(NSDictionary *, NSString *)) completionHandler;

@end
