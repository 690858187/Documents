//
//  AppDelegate.m
//  Documents
//
//  Created by 1234 on 16/3/8.
//  Copyright © 2016年 XDBB. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    NSLog(@"%@",NSHomeDirectory());
//    NSLog(@"%@",NSTemporaryDirectory());
    
    //归档
    
//    NSDictionary *glossary = [NSDictionary dictionaryWithObjectsAndKeys:
//                              @"A class defined so other class can inherit from it.",@"abstract class",
//                              @"To implement all the methods defined in a protocol.",@"adopt",
//                              @"Storing an object for later use.",@"archiving",
//                              nil
//                              ];
//    BOOL isload =  [NSKeyedArchiver archiveRootObject:glossary toFile:[NSHomeDirectory() stringByAppendingString:@"11111"]];
//    
//    NSDictionary *dics = [NSKeyedUnarchiver unarchiveObjectWithFile:[NSHomeDirectory() stringByAppendingString:@"11111"]];
    
    Student *s = [[Student alloc] init];
    s.name = @"李雨涵";
    s.age = 18 ;
    s.photo = @"URL";
    [s save];
    
   BOOL  isload =  [NSKeyedArchiver archiveRootObject:s toFile:[NSHomeDirectory() stringByAppendingString:NSStringFromClass([Student class])]];
//
//    Student *s1 = [NSKeyedUnarchiver unarchiveObjectWithFile:[NSHomeDirectory() stringByAppendingString:NSStringFromClass([Student class])]];
    
    Student *s1 = [Student getFromStore];
    s1.name = @"hahaa";
    [Student remove];
    
    s1 =  [Student getFromStore];
    
    NSArray *arr = [Student allPropertyNames];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
