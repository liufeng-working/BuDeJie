//
//  LFMeViewController.m
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/6.
//  Copyright © 2017年 liufeng. All rights reserved.
//

#import "LFMeViewController.h"
#import "LFSettingViewController.h"
#import "LFSquareCell.h"
#import "LFSquareItem.h"
#import <SafariServices/SafariServices.h>
#import "LFWebViewController.h"

static NSString *const identifier = @"LFTempCell";
static CGFloat const cols = 4;
static CGFloat const margin = 1;
#define itemWH ((kWidth - (cols - 1)*margin)/cols)
@interface LFMeViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, SFSafariViewControllerDelegate>

@property(nonatomic,weak) UICollectionView *collectionView;
@property(nonatomic,strong) NSMutableArray<LFSquareItem *> *squares;

@end

@implementation LFMeViewController

- (NSMutableArray<LFSquareItem *> *)squares
{
    if (!_squares) {
        _squares = [NSMutableArray array];
    }
    return _squares;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = 10;

    [self setupNavBar];
    [self setFootView];
    [self loadData];
}

- (void)setupNavBar
{
    UIBarButtonItem *settingItem = [UIBarButtonItem barButtonItemWithTarget:self action:@selector(settingClick) image:[UIImage originalImageNamed:@"mine-setting-icon"] highlightedImage:[UIImage originalImageNamed:@"mine-setting-icon-click"]];
    
    UIBarButtonItem *nightItem = [UIBarButtonItem barButtonItemWithTarget:self action:@selector(nightClick:) image:[UIImage originalImageNamed:@"mine-moon-icon"] selectedImage:[UIImage originalImageNamed:@"mine-sun-icon-click"]];
    
    self.navigationItem.rightBarButtonItems = @[settingItem, nightItem];
    
    self.navigationItem.title = @"我的";
}

- (void)setFootView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(itemWH, itemWH);
    layout.minimumLineSpacing = margin;
    layout.minimumInteritemSpacing = margin;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 300) collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor clearColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    self.tableView.tableFooterView = collectionView;
    self.collectionView = collectionView;
    
    [collectionView registerNib:[UINib nibWithNibName:@"LFSquareCell" bundle:nil] forCellWithReuseIdentifier:identifier];
}

- (void)loadData
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"a"] = @"square";
    param[@"c"] = @"topic";
    [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *_Nullable responseObject) {
        
        NSArray *tempArr = responseObject[@"square_list"];
        self.squares = [LFSquareItem mj_objectArrayWithKeyValuesArray:tempArr];
        NSInteger count = self.squares.count;
        NSInteger rows = (count - 1)/cols + 1;
        CGFloat collectionViewH = itemWH*rows + (rows - 1)*margin;
        CGRect collectionViewF = self.collectionView.frame;
        collectionViewF.size.height = collectionViewH;
        self.collectionView.frame = collectionViewF;
        [self.collectionView reloadData];
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
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

#pragma mark -
#pragma mark - UICollectionViewDelegate, UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.squares.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LFSquareCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.squareItem = self.squares[indexPath.item];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    LFSquareItem *squareItem = self.squares[indexPath.item];
    if (![squareItem.url containsString:@"http"]) {
        return;
    }
    NSURL *url = [NSURL URLWithString:squareItem.url];
    
    LFWebViewController *webVC = [[LFWebViewController alloc] init];
    webVC.url = url;
    [self.navigationController pushViewController:webVC animated:YES];
    
//    SFSafariViewController *safariVC = [[SFSafariViewController alloc] initWithURL:url];
//    [self presentViewController:safariVC animated:YES completion:nil];
}

#pragma mark -
#pragma mark - SFSafariViewControllerDelegate
- (void)safariViewControllerDidFinish:(SFSafariViewController *)controller {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

@end
