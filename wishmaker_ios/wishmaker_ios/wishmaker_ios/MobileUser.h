//
//  MobileUser.h
//  wishmaker_ios
//
//  Created by Javier Giovannini on 20-04-13.
//  Copyright (c) 2013 Javier Giovannini. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MobileUser : NSObject

@property (nonatomic, strong) NSNumber *mobile_user_id;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSDate *birthday;
@property (nonatomic, strong) NSString *platform;
@property (nonatomic, strong) NSNumber *latitude;
@property (nonatomic, strong) NSNumber *longitude;
@property (nonatomic, strong) NSDate *created_at;
@property (nonatomic, strong) NSDate *updated_at;

+(NSDictionary *) mapping;

@end
