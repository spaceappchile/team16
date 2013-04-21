//
//  ApnDevice.m
//  wishmaker_ios
//
//  Created by Javier Giovannini on 20-04-13.
//  Copyright (c) 2013 Javier Giovannini. All rights reserved.
//

#import "ApnDevice.h"

@implementation ApnDevice

+(NSDictionary *) mapping{
    //JSON_attribute : NSObject_attribute
    return @{
             @"id": @"apn_device_id",
             @"app_id": @"app_id",
             @"mobile_user_id": @"mobile_user_id",
             @"token" : @"token",
             @"last_registered_at": @"last_registered_at",
             @"created_at": @"created_at",
             @"updated_at": @"updated_at",
             };
}

@end
