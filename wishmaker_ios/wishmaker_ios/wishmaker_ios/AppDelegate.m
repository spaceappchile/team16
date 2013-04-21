//
//  AppDelegate.m
//  wishmaker_ios
//
//  Created by Javier Giovannini on 20-04-13.
//  Copyright (c) 2013 Javier Giovannini. All rights reserved.
//

#import "AppDelegate.h"
#import "ApnDevice.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    // Let the device know we want to receive push notifications
	[[UIApplication sharedApplication] registerForRemoteNotificationTypes:
     (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    NSString *json = [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:userInfo options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding];
    
    NSLog(@"json: %@", json);
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"MyNotification" object:userInfo];
    
    
    if ( application.applicationState == UIApplicationStateActive ){
        NSLog(@"app was already in the foreground");
        //add an item to notifications, update badge
        
        
    }
    else{
        NSLog(@"app was just brought from background to foreground");
        
    }
}


- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    //token recibido, registrar en backend.
    NSString * tokenAsString = [[deviceToken description]
                                stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    
    NSLog(@"My token is: %@", tokenAsString);
    
    NSDictionary *params = @{@"token": tokenAsString};
    
    NSURL *url = [NSURL URLWithString:[WEBSERVER stringByAppendingString:@"/apn_devices/register.json"]];
    
    RKObjectMapping *responseMapping = [RKObjectMapping mappingForClass:[ApnDevice class]];
    [responseMapping addAttributeMappingsFromDictionary:[ApnDevice mapping]];
    NSIndexSet *statusCodes = RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful); // Anything in 2xx

    RKResponseDescriptor *apnDeviceDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:responseMapping pathPattern:@"/articles" keyPath:@"article" statusCodes:statusCodes];
    
    RKObjectMapping *requestMapping = [RKObjectMapping requestMapping]; // objectClass == NSMutableDictionary
    [requestMapping addAttributeMappingsFromArray:@[@"title", @"author", @"body"]];
    
    // For any object of class Article, serialize into an NSMutableDictionary using the given mapping and nest
    // under the 'article' key path
    RKRequestDescriptor *requestDescriptor = [RKRequestDescriptor requestDescriptorWithMapping:requestMapping objectClass:[ApnDevice class] rootKeyPath:@"apn_device"];
    
    RKObjectManager *manager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:WEBSERVER]];
                                
    ApnDevice *apn_device = [ApnDevice new];
    apn_device.token = tokenAsString;
    
    // POST to create
    [manager postObject:apn_device path:@"/apn_devices" parameters:nil success:nil failure:nil];
    
}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
    //NSDictionary *params = @{@"token": tokenAsString};
    NSLog(@"didFailToRegisterForRemoteNotificationsWithError");
//    NSLog(@"user id %@", self.user.user_id);
//    
//    if (!self.user.user_id|| [self.user.user_id isEqualToNumber:@0]) {
//        NSLog(@"the user was empty, need to ask for a user_id without device_id");
//        NSURL *url = [NSURL URLWithString:[WEBSERVER stringByAppendingString:@"/mobile_users.json"]];
//        
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul), ^{
//            NSDictionary *dict = (NSDictionary *)[DataStore RESTtoURL:url withMethod:@"POST"];
//            dispatch_sync(dispatch_get_main_queue(), ^{
//                if ([dict count]>0) {
//                    self.user.user_id = [dict objectForKey:@"id"];
//                    NSDateFormatter *dateFormatter = NSDateFormatter.alloc.init;
//                    [dateFormatter setTimeZone:NSTimeZone.localTimeZone];
//                    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
//                    self.user.sex = [dict objectForKey:@"sex"];
//                    self.user.birthday  = [dateFormatter dateFromString:[dict objectForKey:@"birthday"] ];
//                    self.user.notificationEnabled = [NSNumber numberWithBool:(BOOL)[dict objectForKey:@"notificationEnabled"]];
//                    [self.dataStore saveContext];
//                    
//                }
//                
//            });
//        });
//    }
    
}

@end
