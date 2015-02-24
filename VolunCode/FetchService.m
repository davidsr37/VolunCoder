//
//  FetchService.m
//  VolunCode
//
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

@end
