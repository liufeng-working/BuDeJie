//
//  LFSettingViewController.m
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/6.
//  Copyright © 2017年 liufeng. All rights reserved.
//

#import "LFSettingViewController.h"
#import <SDImageCache.h>

static NSString *identifier = @"cell";
@interface LFSettingViewController ()

@end

@implementation LFSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    
    [self getFileSize];
}

- (void)getFileSize
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
//    NSArray<NSString *> *subpaths =[fileManager subpathsOfDirectoryAtPath:filePath error:nil];
//    NSLog(@"%@", subpaths);
    NSDirectoryEnumerator *enumreator = [fileManager enumeratorAtPath:filePath];
    for (NSString *str in enumreator) {
        NSLog(@"%@", str);
    }
//    NSDictionary<NSFileAttributeKey, id> *attrDic = [fileManager contentsAtPath:filePath ];
    
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)[SDImageCache sharedImageCache].getSize];
    return cell;
}

@end
