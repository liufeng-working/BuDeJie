//
//  LFEssenceViewController.m
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/6.
//  Copyright © 2017年 liufeng. All rights reserved.
//

#import "LFEssenceViewController.h"

@interface LFEssenceViewController ()

@end

@implementation LFEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    [self setupNavBar];
}

- (void)setupNavBar
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithTarget:self action:@selector(gameClick) image:[UIImage originalImageNamed:@"nav_item_game_icon"] highlightedImage:[UIImage originalImageNamed:@"nav_item_game_click_icon"]];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithTarget:self action:@selector(gameClick) image:[UIImage originalImageNamed:@"navigationButtonRandom"] highlightedImage:[UIImage originalImageNamed:@"navigationButtonRandomClick"]];
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage originalImageNamed:@"MainTitle"]];
}

- (void)gameClick
{
    NSLog(@"点击游戏");
}

@end
