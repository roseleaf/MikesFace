//
//  AppDelegate.m
//  MikesFace
//
//  Created by Rose CW on 8/21/12.
//  Copyright (c) 2012 Rose CW. All rights reserved.
//

#import "AppDelegate.h"
#import "SmileyView.h"
#import "SmileyViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    
//    SmileyView* smileyview = [[SmileyView alloc]initWithFrame:self.window.bounds];
    
    SmileyViewController* svc = [SmileyViewController new];
    self.window.rootViewController = svc;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
