//
//  M0005_HuanXinIM_App.m
//  DoExt_SM
//
//  Created by 刘吟 on 15/4/9.
//  Copyright (c) 2015年 DoExt. All rights reserved.
//

#import "M0005_HuanXinIM_App.h"
#import "EaseMob.h"
#import "doServiceContainer.h"
#import "doIModuleExtManage.h"

@implementation M0005_HuanXinIM_App
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSString *huanxinKey = [[doServiceContainer Instance].ModuleExtManage GetThirdAppKey:@"M0005_HuanXinIM.plist" :@"EASEMOB_APPKEY"];
    [[EaseMob sharedInstance] registerSDKWithAppKey:huanxinKey apnsCertName:nil];
    
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
