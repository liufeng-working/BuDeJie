//
//  LFTopicViewController.m
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/17.
//  Copyright © 2017年 liufeng. All rights reserved.
//

#import "LFTopicViewController.h"

static NSString *const lf_LFTopicCell = @"LFTopicCell";
@interface LFTopicViewController ()

@property(nonatomic,strong) LFTopic *topic;

@property(nonatomic,strong) NSMutableArray<LFTopicItem *> *topics;

@property(nonatomic,strong) AFHTTPSessionManager *manager;

@end

@implementation LFTopicViewController

- (NSMutableArray<LFTopicItem *> *)topics
{
    if (!_topics) {
        _topics = [NSMutableArray array];
    }
    return _topics;
}

- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.refreshHeaderEnable = YES;
    self.refreshFooterEnable = YES;
    
    UIEdgeInsets insets = UIEdgeInsetsMake(20 + 44 + 35, 0, 49, 0);
    self.tableView.contentInset = insets;
    self.tableView.scrollIndicatorInsets = insets;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:lf_LFTopicCell];
    [self.tableView registerNib:[UINib nibWithNibName:@"LFTopicCell" bundle:nil] forCellReuseIdentifier:lf_LFTopicCell];
    [self.tableView.mj_header beginRefreshing];
}

- (LFTopicType)topicType
{
    return LFTopicTypeAll;
}

#pragma mark -
#pragma mark - 请求最新帖子
- (void)loadData
{
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"a"] = @"newlist";
    param[@"c"] = @"data";
    param[@"type"] = @(self.topicType);
    [self.manager GET:lfBaseUrl parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *_Nullable responseObject) {
        [self.tableView.mj_header endRefreshing];
        self.topic = [LFTopic mj_objectWithKeyValues:responseObject];
        self.topics = self.topic.list;
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.tableView.mj_header endRefreshing];
        NSLog(@"%@", error);
    }];
}

#pragma mark -
#pragma mark - 请求更多帖子
- (void)loadMoreData
{
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"a"] = @"newlist";
    param[@"c"] = @"data";
    param[@"type"] = @(self.topicType);
    param[@"maxtime"] = self.topic.info.maxtime;
    
    [self.manager GET:lfBaseUrl parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *_Nullable responseObject) {
        [self.tableView.mj_footer endRefreshing];
        self.topic = [LFTopic mj_objectWithKeyValues:responseObject];
        [self.topics addObjectsFromArray:self.topic.list];
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.tableView.mj_footer endRefreshing];
        NSLog(@"%@", error);
    }];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.topics.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LFTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:lf_LFTopicCell forIndexPath:indexPath];
    cell.topicItem = self.topics[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return self.topics[indexPath.row].cellHeight;
}

#pragma mark -
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [[SDImageCache sharedImageCache] clearMemory];
}

@end
