//
//  Meteor.m
//  wishmaker_ios
//
//  Created by Javier Giovannini on 20-04-13.
//  Copyright (c) 2013 Javier Giovannini. All rights reserved.
//

#import "Meteor.h"

@implementation Meteor

+(NSDictionary *) mapping{
    //JSON_attribute : NSObject_attribute
    return @{
             @"id": @"meteor_id",
             @"title": @"title",
             @"subtitle": @"subtitle",
             @"description": @"description",
             @"starting": @"starting",
             @"ending": @"ending",
             @"address": @"address",
             @"created_at": @"created_at",
             @"updated_at": @"updated_at",
             @"latitude" : @"latitude",
             @"longitude" : @"longitude",
             @"altitude" : @"altitude"
             };
}

@end
