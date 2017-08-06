//
//  LFTabBarController.m
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/6.
//  Copyright © 2017年 liufeng. All rights reserved.
//

#import "LFTabBarController.h"
#import "LFTabBar.h"
#import "LFNavigationController.h"
#import "LFEssenceViewController.h"
#import "LFNewViewController.h"
#import "LFPublishViewController.h"
#import "LFFriendTrendsViewController.h"
#import "LFMeViewController.h"

@interface LFTabBarController ()

@property(nonatomic,readwrite) UITabBar *tabBar;

@end

@implementation LFTabBarController
@dynamic tabBar;

+ (void)load
{
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: UIColor.blackColor} forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:13]} forState:UIControlStateNormal];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self changeTabBar];
    [self addChildViewController];
}

- (void)changeTabBar
{
    LFTabBar *tabBar = [[LFTabBar alloc] init];
    self.tabBar = tabBar;
}

- (void)addChildViewController
{
    //精华
    LFEssenceViewController *essenceVC = [[LFEssenceViewController alloc] init];
    UINavigationController *essenceNav = [[LFNavigationController alloc] initWithRootViewController:essenceVC];
    UITabBarItem *essenceItem = [[UITabBarItem alloc] initWithTitle:@"精华" image:[UIImage originalImageNamed:@"tabBar_essence_icon"] selectedImage:[UIImage originalImageNamed:@"tabBar_essence_click_icon"] ];
    essenceNav.tabBarItem = essenceItem;
    
    //新帖
    LFNewViewController *newVC = [[LFNewViewController alloc] init];
    UINavigationController *newNav = [[LFNavigationController alloc] initWithRootViewController:newVC];
    UITabBarItem *newItem = [[UITabBarItem alloc] initWithTitle:@"新帖" image:[UIImage originalImageNamed:@"tabBar_new_icon"] selectedImage:[UIImage originalImageNamed:@"tabBar_new_click_icon"]];
    newNav.tabBarItem = newItem;
    
    //发布
    LFPublishViewController *publishVC = [[LFPublishViewController alloc] init];
    UITabBarItem *publishItem = [[UITabBarItem alloc] initWithTitle:@"" image:[UIImage originalImageNamed:@"tabBar_publish_icon"] selectedImage:[UIImage originalImageNamed:@"tabBar_publish_click_icon"]];
    publishVC.tabBarItem = publishItem;
    
    //社区
    LFFriendTrendsViewController *friendTrendsVC = [[LFFriendTrendsViewController alloc] init];
    UINavigationController *friendTrendsNav = [[LFNavigationController alloc] initWithRootViewController:friendTrendsVC];
    UITabBarItem *friendTrendsItem = [[UITabBarItem alloc] initWithTitle:@"社区" image:[UIImage originalImageNamed:@"tabBar_friendTrends_icon"] selectedImage:[UIImage originalImageNamed:@"tabBar_friendTrends_click_icon"]];
    friendTrendsNav.tabBarItem = friendTrendsItem;
    
    //我
    LFMeViewController *meVC = [[LFMeViewController alloc] init];
    UINavigationController *meNav = [[LFNavigationController alloc] initWithRootViewController:meVC];
    UITabBarItem *meItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage originalImageNamed:@"tabBar_me_icon"] selectedImage:[UIImage originalImageNamed:@"tabBar_new_click_icon"]];
    meNav.tabBarItem = meItem;
    
    self.viewControllers = @[essenceNav, newNav, friendTrendsNav, meNav];
}

@end
