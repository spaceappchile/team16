//
//  ApnDevice.h
//  wishmaker_ios
//
//  Created by Javier Giovannini on 20-04-13.
//  Copyright (c) 2013 Javier Giovannini. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApnDevice : NSObject

@property (nonatomic, strong) NSNumber *apn_device_id;
@property (nonatomic, strong) NSNumber *app_id;
@property (nonatomic, strong) NSNumber *mobile_user_id;
@property (nonatomic, strong) NSDate *last_registered_at;
@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) NSDate *created_at;
@property (nonatomic, strong) NSDate *updated_at;

+(NSDictionary *) mapping;

@end
