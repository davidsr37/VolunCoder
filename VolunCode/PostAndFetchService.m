//
//  PostAndFetchService.m
//  VolunCode
//
//  Created by Annemarie Ketola on 2/24/15.
//  Copyright (c) 2015 Clint Akins. All rights reserved.
//

#import "PostAndFetchService.h"
#import "Login.h"
#import "Volunteer.h"
#import "Organization.h"
#import "Event.h"
#import "FetchService.h"

@implementation PostAndFetchService

+(id)sharedService {
  static PostAndFetchService *mySharedService;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    mySharedService = [[PostAndFetchService alloc] init];
  });
  return mySharedService;
}

-(void)postLoginIDs:(NSDictionary *)loginDictionary completionHandler:(void (^)(NSDictionary *, NSString *))completionHandler {
  
  // ******************* Change the loginDictionary into a JSON file *******************
  NSError *errorLogin;
  //  NSData *loginJsonData = [NSJSONSerialization dataWithJSONObject:loginDictionary options:kNilOptions error:&error];
  NSData *loginJsonData = [NSJSONSerialization dataWithJSONObject:loginDictionary options:NSJSONWritingPrettyPrinted error:&errorLogin];
  NSLog(@"loginJsonData = %@", loginJsonData);
  
  // This is our URL to our server
  NSString *urlString = @"http://outcharityiosapp.herokuapp.com/api/v1/sign_in";
  // Make it an NSURL
  NSURL *url = [NSURL URLWithString:urlString];
  NSLog(@"urlString = %@", urlString);
  // Initialize the request
  NSMutableURLRequest *findLoginRoleRequest = [[NSMutableURLRequest alloc] initWithURL:url];
  NSLog(@"request = %@", findLoginRoleRequest);
  // make the post and body definitions
  [findLoginRoleRequest setHTTPMethod:@"POST"];
  [findLoginRoleRequest setHTTPBody:loginJsonData];
  
  NSString *lengthString = [NSString stringWithFormat:@"%lu",(unsigned long)loginJsonData.length];
  
  [findLoginRoleRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  [findLoginRoleRequest setValue:lengthString forHTTPHeaderField:@"Content-Length"];
  
  // start the NSURLSession
  NSURLSession *session = [NSURLSession sharedSession];
  // start the task and get data and response
  NSURLSessionTask *dataTask = [session dataTaskWithRequest:findLoginRoleRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    
    if (error) {
      completionHandler(nil,@"Could not connect");
    } else { // what we get if we got no error
      NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
      NSInteger statusCode = httpResponse.statusCode;
      NSLog(@"%ld", (long)statusCode);
      switch (statusCode) {
        case 200 ... 299: {
          NSLog(@"%ld", (long)statusCode);
          
          // if we got the correst code, then start doing the parse data
          NSDictionary *jsonResults = [[NSDictionary alloc] init];
          jsonResults = [NSJSONSerialization JSONObjectWithData:jsonResults options:nil error:nil];
          [[FetchService sharedServices]generateLogin:jsonResults];
//          NSArray *results = [Login loginFromJson:data];
//          if (login.type == @"volunteer" {
//            [[FetchService sharedService]generateVolunteer:jsonResults];
//          } else {
//            [[FetchService sharedService]generateOrganization:jsonResults];
//          }
          dispatch_async(dispatch_get_main_queue(), ^{
//            if (results) {
//              completionHandler(results, nil);
//            } else {
//              completionHandler(results, @"Login could not be completed");
//            }
          });
          break;
      }
        default:
      NSLog(@"%ld",(long)statusCode);
          break;
      }
    }
}];
  [dataTask resume];
  } // close postLoginIDs call
      
-(void)createVolunteerProfile:(NSDictionary *)volunteerProfileDictionary completionHandler:(void (^)(NSDictionary *, NSString *)) completionHandler {
  // ******************* Change the loginDictionary into a JSON file *******************
  NSError *errorVolunteerProfile;
  //  NSData *volunteerProfileJsonData = [NSJSONSerialization dataWithJSONObject:loginDictionary options:kNilOptions error:&error];
  NSData *volunteerProfileJsonData = [NSJSONSerialization dataWithJSONObject:volunteerProfileDictionary options:NSJSONWritingPrettyPrinted error:&errorVolunteerProfile];
  
  // This is our URL to our server
  NSString *urlString = @"http://outcharityiosapp.herokuapp.com/api/v1/create_user_volunteer/";
  // Make it an NSURL
  NSURL *url = [NSURL URLWithString:urlString];
  NSLog(@"urlString = %@", urlString);
  // Initialize the request
  NSMutableURLRequest *createVolunteerProfileRequest = [[NSMutableURLRequest alloc] initWithURL:url];
  NSLog(@"request = %@", createVolunteerProfileRequest);
  // make the post and body definitions
  [createVolunteerProfileRequest setHTTPMethod:@"POST"];
  [createVolunteerProfileRequest setHTTPBody:volunteerProfileJsonData];
  
  // start the NSURLSession
  NSURLSession *session = [NSURLSession sharedSession];
  // start the task and get data and response
  NSURLSessionTask *dataTask = [session dataTaskWithRequest:createVolunteerProfileRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    if (error) {
      completionHandler(nil,@"Could not connect");
    } else { // what we get if we got no error
      NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
      NSInteger statusCode = httpResponse.statusCode;
      switch (statusCode) {
        case 200 ... 299: {
          NSLog(@"%ld", (long)statusCode);
          // if we got the correct code, then start serializing it
          NSDictionary *jsonResults = [[NSDictionary alloc] init];
          jsonResults = [NSJSONSerialization JSONObjectWithData:data options:nil error:nil];
          [[FetchService sharedServices]generateVolunteer:jsonResults];
              dispatch_async(dispatch_get_main_queue(), ^{
            if (jsonResults) {
              completionHandler(jsonResults, nil);
            } else {
              completionHandler(jsonResults, @"volunteer profile could not be completed");
            }
          });
          break;
          }
          default:
          NSLog(@"%ld",(long)statusCode);
          break;
        }
      }
    }];
  [dataTask resume];
} // close createVolunteerProfile
              
-(void)createOrganizationProfile:(NSDictionary *)organizationProfileDictionary completionHandler:(void (^)(NSDictionary *, NSString *)) completionHandler {
  // ******************* Change the loginDictionary into a JSON file *******************
  NSError *errorOrgProfile;
  //  NSData *orgProfileJsonData = [NSJSONSerialization dataWithJSONObject:organizationProfileDictionary options:kNilOptions error:&error];
  NSData *orgProfileJsonData = [NSJSONSerialization dataWithJSONObject:organizationProfileDictionary options:NSJSONWritingPrettyPrinted error:&errorOrgProfile];
  
  // This is our URL to our server
  NSString *urlString = @"http://outcharityiosapp.herokuapp.com/api/v1/create_user_organizer";
  // Make it an NSURL
  NSURL *url = [NSURL URLWithString:urlString];
  NSLog(@"urlString = %@", urlString);
  // Initialize the request
  NSMutableURLRequest *createOrgProfileRequest = [[NSMutableURLRequest alloc] initWithURL:url];
  NSLog(@"request = %@", createOrgProfileRequest);
  // make the post and body definitions
  [createOrgProfileRequest setHTTPMethod:@"POST"];
  [createOrgProfileRequest setHTTPBody:orgProfileJsonData];
  
  // start the NSURLSession
  NSURLSession *session = [NSURLSession sharedSession];
  // start the task and get data and response
  NSURLSessionTask *dataTask = [session dataTaskWithRequest:createOrgProfileRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    if (error) {
      completionHandler(nil,@"Could not connect");
    } else { // what we get if we got no error
      NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
      NSInteger statusCode = httpResponse.statusCode;
      switch (statusCode) {
        case 200 ... 299: {
          NSLog(@"%ld", (long)statusCode);
//          // if we got the correst code, then start doing the parse data
          NSDictionary *jsonResults = [[NSDictionary alloc] init];
          jsonResults = [NSJSONSerialization JSONObjectWithData:data options:nil error:nil];
          [[FetchService sharedServices]generateOrganization:jsonResults];
              dispatch_async(dispatch_get_main_queue(), ^{
            if (jsonResults) {
              completionHandler(jsonResults, nil);
            } else {
              completionHandler(jsonResults, @"Organization profile could not be completed");
            }
          });
          break;
          }
          default:
          NSLog(@"%ld",(long)statusCode);
          break;
        }
      }
   }];
 [dataTask resume];
} // close createOrganizationProfile

-(void)createEvent:(NSDictionary *)createEventDictionary completionHandler:(void (^)(NSDictionary *, NSString *)) completionHandler {
  // ******************* Change the loginDictionary into a JSON file *******************
  NSError *errorCreateEvent;
  //  NSData *createEventJsonData = [NSJSONSerialization dataWithJSONObject:createEventDictionary options:kNilOptions error:&error];
  NSData *createEventJsonData = [NSJSONSerialization dataWithJSONObject:createEventDictionary options:NSJSONWritingPrettyPrinted error:&errorCreateEvent];
  
  // This is our URL to our server
  NSString *urlString = @"http://outcharityiosapp.herokuapp.com/api/v1/events";
  // Make it an NSURL
  NSURL *url = [NSURL URLWithString:urlString];
  NSLog(@"urlString = %@", urlString);
  // Initialize the request
  NSMutableURLRequest *createEventRequest = [[NSMutableURLRequest alloc] initWithURL:url];
  NSLog(@"request = %@", createEventRequest);
  // make the post and body definitions
  [createEventRequest setHTTPMethod:@"POST"];
  [createEventRequest setHTTPBody:createEventJsonData];
  
  // start the NSURLSession
  NSURLSession *session = [NSURLSession sharedSession];
  // start the task and get data and response
  NSURLSessionTask *dataTask = [session dataTaskWithRequest:createEventRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {

    if (error) {
      completionHandler(nil,@"Could not connect");
    } else { // what we get if we got no error
      NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
      NSInteger statusCode = httpResponse.statusCode;
      switch (statusCode) {
        case 200 ... 299: {
          NSLog(@"%ld", (long)statusCode);
          // if we got the correst code, then start doing the parse data
          NSDictionary *jsonResults = [[NSDictionary alloc] init];
          jsonResults = [NSJSONSerialization JSONObjectWithData:data options:nil error:nil];
          [[FetchService sharedServices]event:jsonResults];
              dispatch_async(dispatch_get_main_queue(), ^{
            if (jsonResults) {
              completionHandler(jsonResults, nil);
            } else {
              completionHandler(jsonResults, @"Create event could not be completed");
            }
          });
          break;
          }
          default:
          NSLog(@"%ld",(long)statusCode);
          break;
        }
      }
  }];
[dataTask resume];
    
} // close createEvent

-(void)fetchEvents:(NSDictionary *)tokenDictionary completionHandler:(void (^)(NSDictionary *, NSString *)) completionHandler {
  // ******************* Change the token Dictionary into a JSON file *******************
  NSError *errorfetchEvents;
  //  NSData *fetchEventsJsonData = [NSJSONSerialization dataWithJSONObject:tokenDictionary options:kNilOptions error:&error];
  NSData *fetchEventsJsonData = [NSJSONSerialization dataWithJSONObject:tokenDictionary options:NSJSONWritingPrettyPrinted error:&errorfetchEvents];
  
  // This is our URL to our server
  NSString *urlString = @"http://outcharityiosapp.herokuapp.com/api/v1/events";
  // Make it an NSURL
  NSURL *url = [NSURL URLWithString:urlString];
  NSLog(@"urlString = %@", urlString);
  // Initialize the request
  NSMutableURLRequest *fetchEventsRequest = [[NSMutableURLRequest alloc] initWithURL:url];
  NSLog(@"request = %@", fetchEventsRequest);
  // make the post and body definitions
  [fetchEventsRequest setHTTPMethod:@"GET"];
  [fetchEventsRequest setHTTPBody:fetchEventsJsonData];
  
  // start the NSURLSession
  NSURLSession *session = [NSURLSession sharedSession];
  // start the task and get data and response
  NSURLSessionTask *dataTask = [session dataTaskWithRequest:fetchEventsRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    if (error) {
      completionHandler(nil,@"Could not connect");
    } else { // what we get if we got no error
      NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
      NSInteger statusCode = httpResponse.statusCode;
      switch (statusCode) {
        case 200 ... 299: {
          NSLog(@"%ld", (long)statusCode);
          // if we got the correst code, then start doing the parse data
          NSDictionary *jsonResults = [[NSDictionary alloc] init];
//          NSArray *jsonArray = [[NSArray alloc] init];
//          jsonArray = [NSJSONSerialization JSONObjectWithData:data options:nil error:nil];
//          if jsonResults = NSDictionary (NSDictionaryWithObject) {
//            [[FetchService sharedServices]event:jsonResults];
//            append jsonArray(event);
//          }
              dispatch_async(dispatch_get_main_queue(), ^{
            if (jsonResults) {
              completionHandler(jsonResults, nil);
            } else {
              completionHandler(jsonResults, @"Fetch events could not be completed");
            }
          });
          break;
          }
          default:
          NSLog(@"%ld",(long)statusCode);
          break;
        }
      }
  }];
[dataTask resume];
} // close fetchEvents

@end
