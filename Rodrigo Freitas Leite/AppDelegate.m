//
//  AppDelegate.m
//  Rodrigo Freitas Leite
//
//  Created by Rodrigo Freitas Leite on 04/04/14.
//  Copyright (c) 2014 Frelei. All rights reserved.
//

#import "AppDelegate.h"
#import "UIColor+CustomColors.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    // Configure NavigationBar
    [[UINavigationBar appearance] setBarTintColor:[UIColor MyRed]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    // Shadow letter
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0
                                         green:0.0
                                          blue:0.0
                                         alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, 1);
    
    // Attributes of String
    NSDictionary *attributes = @{
                               NSForegroundColorAttributeName : [UIColor MyPaleYellow],
                               NSShadowAttributeName : shadow,
                               NSShadowAttributeName : [UIFont fontWithName:@"HelveticaNeue-CondensedBlack"
                                                                       size:21.0]
                               };
    
    [[UINavigationBar appearance] setTitleTextAttributes: attributes];
    
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

@end
