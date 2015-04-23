//
//  M0005_HuanXinIM_App.m
//  DoExt_SM
//
//  Created by yz on 15/4/13.
//  Copyright (c) 2015年 DoExt. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "M0005_HuanXinIM_App.h"
#import "EaseMob.h"

@implementation M0005_HuanXinIM_App
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[EaseMob sharedInstance] registerSDKWithAppKey:@"digitalchina#huanxindemo" apnsCertName:nil];
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    [[EaseMob sharedInstance] applicationWillResignActive:application];
}
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [[EaseMob sharedInstance] applicationDidEnterBackground:application];
}
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [[EaseMob sharedInstance] applicationWillEnterForeground:application];
}
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [[EaseMob sharedInstance] applicationDidBecomeActive:application];
}
- (void)applicationWillTerminate:(UIApplication *)application
{
    [[EaseMob sharedInstance] applicationWillTerminate:application];
}

@end
