//
//  AppDelegate.m
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/6.
//  Copyright © 2017年 liufeng. All rights reserved.
//

#import "AppDelegate.h"
#import "LFAdViewController.h"
#import "LFTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [LFAdViewController new];
    [self.window makeKeyAndVisible];
    
    //监控网络状况
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    return YES;
}

@end
