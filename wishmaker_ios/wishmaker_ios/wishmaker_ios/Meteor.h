//
//  Meteor.h
//  wishmaker_ios
//
//  Created by Javier Giovannini on 20-04-13.
//  Copyright (c) 2013 Javier Giovannini. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Meteor : NSObject

@property (nonatomic, strong) NSNumber *meteor_id;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSDate *starting;
@property (nonatomic, strong) NSDate *ending;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSDate *created_at;
@property (nonatomic, strong) NSDate *updated_at;
@property (nonatomic, strong) NSString *photo;
@property (nonatomic, strong) NSNumber *latitude;
@property (nonatomic, strong) NSNumber *longitude;
@property (nonatomic, strong) NSNumber *altitude;

+(NSDictionary *) mapping;


@end
