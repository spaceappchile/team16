//
//  MobileUser.m
//  wishmaker_ios
//
//  Created by Javier Giovannini on 20-04-13.
//  Copyright (c) 2013 Javier Giovannini. All rights reserved.
//

#import "MobileUser.h"

@implementation MobileUser

+(NSDictionary *) mapping{
    //JSON_attribute : NSObject_attribute
    return @{
             @"id": @"mobile_user_id",
             @"username": @"username",
             @"password": @"password",
             @"birthday": @"birthday",
             @"created_at": @"created_at",
             @"updated_at": @"updated_at",
             @"latitude" : @"latitude",
             @"longitude" : @"longitude",
             };
}

@end
