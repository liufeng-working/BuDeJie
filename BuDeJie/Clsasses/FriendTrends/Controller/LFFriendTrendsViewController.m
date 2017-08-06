//
//  LFFriendTrendsViewController.m
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/6.
//  Copyright © 2017年 liufeng. All rights reserved.
//

#import "LFFriendTrendsViewController.h"

@interface LFFriendTrendsViewController ()

@end

@implementation LFFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor blueColor];

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

@end
