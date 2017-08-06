//
//  LFMeViewController.m
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/6.
//  Copyright © 2017年 liufeng. All rights reserved.
//

#import "LFMeViewController.h"
#import "LFSettingViewController.h"

@interface LFMeViewController ()

@end

@implementation LFMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor purpleColor];

    [self setupNavBar];
}

- (void)setupNavBar
{
    UIBarButtonItem *settingItem = [UIBarButtonItem barButtonItemWithTarget:self action:@selector(settingClick) image:[UIImage originalImageNamed:@"mine-setting-icon"] highlightedImage:[UIImage originalImageNamed:@"mine-setting-icon-click"]];
    
    UIBarButtonItem *nightItem = [UIBarButtonItem barButtonItemWithTarget:self action:@selector(nightClick:) image:[UIImage originalImageNamed:@"mine-moon-icon"] selectedImage:[UIImage originalImageNamed:@"mine-sun-icon-click"]];
    
    self.navigationItem.rightBarButtonItems = @[settingItem, nightItem];
    
    self.navigationItem.title = @"我的";
}

- (void)settingClick
{
    LFSettingViewController *settingVC = [[LFSettingViewController alloc] init];
    [self.navigationController pushViewController:settingVC animated:YES];
}

- (void)nightClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
    
    NSLog(@"点击夜间模式");
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

@end
