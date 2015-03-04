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

-(void)postLoginIDs:(NSString *)loginString completionHandler:(void (^)(NSDictionary *, NSString *))completionHandler {
  
  // This is our URL to our server
  NSString *urlString = @"http://outcharityiosapp.herokuapp.com/api/v1/sign_in";
  // Make it an NSURL
  NSURL *url = [NSURL URLWithString:urlString];
  NSLog(@"urlString = %@", urlString);
  // Initialize the request
  NSMutableURLRequest *findLoginRoleRequest = [[NSMutableURLRequest alloc] initWithURL:url];
  NSLog(@"request = %@", findLoginRoleRequest);
  // make the post and body definitions
  [findLoginRoleRequest setHTTPMethod:@"GET"];
//  [findLoginRoleRequest setHTTPBody:loginJsonData];
//     set the post's type of data to send and its length
//  NSString *lengthString = [NSString stringWithFormat:@"%lu",(unsigned long)loginJsonData.length];
//    [findLoginRoleRequest setValue:lengthString forHTTPHeaderField:@"Content-Length"];
//  [findLoginRoleRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  
  // convert the post's username and password into base64
  NSData *nsDataUserPassword = [loginString dataUsingEncoding:NSUTF8StringEncoding];
  NSString *base64UserPassword = [nsDataUserPassword base64EncodedStringWithOptions:0];
  [findLoginRoleRequest setValue:[NSString stringWithFormat:@"Basic %@",base64UserPassword] forHTTPHeaderField:@"Authorization"];
  NSLog(@"base64UserPassword %@", base64UserPassword);

  // start the NSURLSession
  NSURLSession *session = [NSURLSession sharedSession];
  // start the task to get data and response
  NSURLSessionTask *dataTask = [session dataTaskWithRequest:findLoginRoleRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    
    if (error) {
      completionHandler(nil,@"Could not connect");
    } else { // what we get if we got no error
      NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
      NSInteger statusCode = httpResponse.statusCode;
      NSLog(@"status code = %ld", (long)statusCode);
      switch (statusCode) {
        case 200 ... 299: {
          NSLog(@"statuscode = %ld", (long)statusCode);
          
          // if we got the correst code, take the raw data sent to us and puts it into an NSDictionary for us
          NSDictionary *jsonLoginResultsDictionary = [[NSDictionary alloc] init];
          jsonLoginResultsDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:0];
          // start doing the parse to determine which type of user
          NSString *login = jsonLoginResultsDictionary[@"email"];
          if ([login  isEqual: @"volunteer"]) {
            // generate a volunter in Core Data
            [[FetchService sharedServices]parseForVolunteer:jsonLoginResultsDictionary];
          } else {
            // generate an organization in Core Data
            [[FetchService sharedServices]parseForOrganization:jsonLoginResultsDictionary];
          }
          dispatch_async(dispatch_get_main_queue(), ^{
            if (jsonLoginResultsDictionary) {
              completionHandler(jsonLoginResultsDictionary, nil);
            } else {
              completionHandler(jsonLoginResultsDictionary, @"Login could not be completed");
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
  } // close postLoginIDs call
      
-(void)createVolunteerProfile:(NSDictionary *)volunteerProfileDictionary completionHandler:(void (^)(NSDictionary *, NSString *)) completionHandler {
  // ******************* Change the profileDictionary into a JSON file *******************
  NSError *errorVolunteerProfile;
    NSData *volunteerProfileJsonData = [NSJSONSerialization dataWithJSONObject:volunteerProfileDictionary options:kNilOptions error:&errorVolunteerProfile];
  NSLog(@"volunteerProfileDictionary %@", volunteerProfileDictionary);
//  NSData *volunteerProfileJsonData = [NSJSONSerialization dataWithJSONObject:volunteerProfileDictionary options:NSJSONWritingPrettyPrinted error:&errorVolunteerProfile];
  
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
//       set the post's type of data to send and its length
    NSString *lengthString = [NSString stringWithFormat:@"%lu",(unsigned long)volunteerProfileJsonData.length];
    [createVolunteerProfileRequest setValue:lengthString forHTTPHeaderField:@"Content-Length"];
    [createVolunteerProfileRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  
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
          // if we got the correct code, then start serializing the raw data sent to us
          NSDictionary *jsonVolunteerResults = [[NSDictionary alloc] init];
          jsonVolunteerResults = [NSJSONSerialization JSONObjectWithData:data options:0 error:0];
          // generate a volunteer in Core Data
          NSLog(@"jsonVolunteerResults Dictionary = %@", jsonVolunteerResults);
          [[FetchService sharedServices]parseForVolunteer:jsonVolunteerResults];
              dispatch_async(dispatch_get_main_queue(), ^{
            if (jsonVolunteerResults) {
              completionHandler(jsonVolunteerResults, nil);
            } else {
              completionHandler(jsonVolunteerResults, @"volunteer profile could not be completed");
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
  NSLog(@"CreateOrgProfileFetch started");
  // ******************* Change the loginDictionary into a JSON file *******************
  NSError *errorOrgProfile;
    NSData *orgProfileJsonData = [NSJSONSerialization dataWithJSONObject:organizationProfileDictionary options:kNilOptions error:&errorOrgProfile];
  
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
  //       set the post's type of data to send and its length
  NSString *lengthString = [NSString stringWithFormat:@"%lu",(unsigned long)orgProfileJsonData.length];
  [createOrgProfileRequest setValue:lengthString forHTTPHeaderField:@"Content-Length"];
  [createOrgProfileRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  
  // start the NSURLSession
  NSURLSession *session = [NSURLSession sharedSession];
  // start the task and get data and response
  NSURLSessionTask *dataTask = [session dataTaskWithRequest:createOrgProfileRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    if (error) {
      completionHandler(nil,@"Could not connect");
    } else { // what we get if we got no error
      NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
      NSInteger statusCode = httpResponse.statusCode;
      NSLog(@"1st status code %ld", (long)statusCode);
      switch (statusCode) {
        case 200 ... 299: {
          NSLog(@"2nd status code = %ld", (long)statusCode);
          // if we got the correst code, then serializing the raw data sent to us into a NSDictionary for us
          NSDictionary *jsonResults = [[NSDictionary alloc] init];
          jsonResults = [NSJSONSerialization JSONObjectWithData:data options:0 error:0];
          // create an organization in Core Data
          [[FetchService sharedServices]parseForOrganization:jsonResults];
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

-(void)createEvent:(NSDictionary *)createEventDictionary withToken:(NSString *)token completionHandler:(void (^)(NSDictionary *, NSString *)) completionHandler {
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
  // set the post's type of data to send and its length
  NSString *lengthString = [NSString stringWithFormat:@"%lu",(unsigned long)createEventJsonData.length];
  [createEventRequest setValue:lengthString forHTTPHeaderField:@"Content-Length"];
  [createEventRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  [createEventRequest setValue:token forHTTPHeaderField:@"token"];
  
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
          // if we got the correst code, then serializing the raw data sent to us into a NSDictionary for us
          NSDictionary *jsonResults = [[NSDictionary alloc] init];
          jsonResults = [NSJSONSerialization JSONObjectWithData:data options:0 error:0];
          // generate an event in Core Data
          [[FetchService sharedServices]parseForEvent:jsonResults];
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

-(void)fetchEvents:(NSString *)token completionHandler:(void (^)(NSDictionary *, NSString *)) completionHandler {
  
  // This is our URL to our server
  NSString *urlString = @"http://outcharityiosapp.herokuapp.com/api/v1/events";
  // Make it an NSURL
  NSURL *url = [NSURL URLWithString:urlString];
  NSLog(@"urlString = %@", urlString);
  // Initialize the request
  NSMutableURLRequest *fetchEventsRequest = [[NSMutableURLRequest alloc] initWithURL:url];
  NSLog(@"request = %@", fetchEventsRequest);
  // make the post and definitions
  [fetchEventsRequest setHTTPMethod:@"GET"];
  [fetchEventsRequest setValue:token forHTTPHeaderField:@"token"];
  
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
          NSDictionary *jsonEventsDictionary = [[NSDictionary alloc] init];
          jsonEventsDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:0];
//          
//          NSMutableArray *jsonEventsArray = [[NSMutableArray alloc] init];
//          if jsonEventsArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:0] {
//            for object in jsonEventArray {
//              if jsonResultsDictionary = object {
//                [[FetchService sharedService]generateEvent:jsonEventsDictionary];  // returns an Event
//                [jsonEventsArray addObject:Event]; // add the event
//              }
//            }
//          }
//          if let jsonArray = NSJSONSerialization.JSONObjectWithData(data, options: nil, error:nil) as? [AnyObject] {
//            var tweets = [Tweet]()
//            for object in jsonArray {
//              if let jsonDictionary = object as? [String : AnyObject] {
//                let tweet = Tweet(jsonDictionary)
//                tweets.append(tweet)
//              }
//            }
              dispatch_async(dispatch_get_main_queue(), ^{
//            if (jsonResults) {
//              completionHandler(jsonResults, nil);
//            } else {
//              completionHandler(jsonResults, @"Fetch events could not be completed");
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
} // close fetchEvents

@end
