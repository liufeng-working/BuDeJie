//
//  LFNewViewController.m
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/6.
//  Copyright © 2017年 liufeng. All rights reserved.
//

#import "LFNewViewController.h"

@interface LFNewViewController ()

@end

@implementation LFNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    [self setupNavBar];
}

- (void)setupNavBar
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithTarget:self action:@selector(tagClick) image:[UIImage originalImageNamed:@"MainTagSubIcon"] highlightedImage:[UIImage originalImageNamed:@"MainTagSubIconClick"]];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithTarget:self action:@selector(tagClick) image:[UIImage originalImageNamed:@"navigationButtonRandomN"] highlightedImage:[UIImage originalImageNamed:@"navigationButtonRandomClickN"]];
    
    self.navigationItem.title = @"新帖";
}

- (void)tagClick
{
    NSLog(@"点击tag");
}

@end
