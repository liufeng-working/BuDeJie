//
//  LFFriendTrendsViewController.m
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/6.
//  Copyright © 2017年 liufeng. All rights reserved.
//

#import "LFFriendTrendsViewController.h"
#import "LFLoginViewController.h"

@interface LFFriendTrendsViewController ()

@end

@implementation LFFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupNavBar];
}

- (void)setupNavBar
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithTarget:self action:@selector(friendsRecommentClick) image:[UIImage originalImageNamed:@"friendsRecommentIcon"] highlightedImage:[UIImage originalImageNamed:@"friendsRecommentIcon-click"]];
    
    self.navigationItem.title = @"我的关注";
}

- (void)friendsRecommentClick
{
    NSLog(@"点击我的关注");
}

#pragma mark -
#pragma mark - 登录
- (IBAction)gotoLogin:(UIButton *)sender {
    
    LFLoginViewController *loginVC = [[LFLoginViewController alloc] init];
    [self presentViewController:loginVC animated:YES completion:nil];
}


@end
