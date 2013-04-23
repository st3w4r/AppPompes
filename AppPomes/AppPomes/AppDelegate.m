//
//  AppDelegate.m
//  AppPomes
//
//  Created by Yanaël Barbier on 23/04/13.
//  Copyright (c) 2013 Yanaël Barbier. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //Bouton commencer
    UIButton *btnCommencer = [UIButton buttonWithType:UIButtonTypeCustom];
    btnCommencer.frame = CGRectMake(0.0, 20.0, self.window.frame.size.width, self.window.frame.size.height/2);
    [btnCommencer setBackgroundColor:[UIColor colorWithRed:0.0 green:1.0 blue:0.4 alpha:1.0]];
    [btnCommencer setTitle:@"Commencer" forState:UIControlStateNormal];

    //Bouton Réglage
    UIButton *btnReglage = [UIButton buttonWithType:UIButtonTypeCustom];
    btnReglage.frame = CGRectMake(0.0, btnCommencer.frame.size.height+20, self.window.frame.size.width, (self.window.frame.size.height/10));
    [btnReglage setBackgroundColor:[UIColor colorWithRed:0.0 green:0.1 blue:0.7 alpha:1.0]];
    [btnReglage setTitle:@"Réglages" forState:UIControlStateNormal];

    //Bouton stat
    UIButton *btnStats = [UIButton buttonWithType:UIButtonTypeCustom];
    btnStats.frame = CGRectMake(0.0, btnCommencer.frame.size.height + btnReglage.frame.size.height + 20, self.window.frame.size.width, (self.window.frame.size.height - (btnCommencer.frame.size.height + btnReglage.frame.size.height + 20)));
    [btnStats setBackgroundColor:[UIColor colorWithRed:0.1 green:1.0 blue:1.0 alpha:1.0]];
    [btnStats setTitle:@"Statistiques" forState:UIControlStateNormal];
    
    [self.window addSubview:btnCommencer];
    [self.window addSubview:btnReglage];
    [self.window addSubview:btnStats];
    
    [self.window makeKeyAndVisible];
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
