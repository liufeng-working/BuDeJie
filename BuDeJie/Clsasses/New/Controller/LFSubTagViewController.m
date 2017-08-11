//
//  LFSubTagViewController.m
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/8.
//  Copyright © 2017年 liufeng. All rights reserved.
//

#import "LFSubTagViewController.h"
#import "LFTagItem.h"
#import "LFTagCell.h"

@interface LFSubTagViewController ()

@property(nonatomic,strong) NSMutableArray<LFTagItem *> *tags;

@end

@implementation LFSubTagViewController

- (NSMutableArray<LFTagItem *> *)tags
{
    if (!_tags) {
        _tags = [NSMutableArray array];
    }
    return _tags;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"LFTagCell" bundle:nil] forCellReuseIdentifier:@"LFTagCell"];
    
    [self loadData];
    
}

#pragma mark -
#pragma mark - 请求数据
- (void)loadData
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"a"] = @"tag_recommend";
    param[@"action"] = @"sub";
    param[@"c"] = @"topic";
    
    [LFNotification manuallyHideIndicatorWithText:@"加载中..."];
    [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSArray *_Nullable responseObject) {
        [LFNotification hideNotification];
        self.tags = [LFTagItem mj_objectArrayWithKeyValuesArray:responseObject];
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [LFNotification hideNotification];
        NSLog(@"%@", error);
    }];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tags.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LFTagCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LFTagCell"];
    cell.tagItem = self.tags[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

@end
