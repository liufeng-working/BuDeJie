//
//  LFEssenceViewController.m
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/6.
//  Copyright © 2017年 liufeng. All rights reserved.
//

#import "LFEssenceViewController.h"
#import "LFClearHighlightedButton.h"
#import "LFAllViewController.h"
#import "LFVideoViewController.h"
#import "LFVoiceViewController.h"
#import "LFPhotoViewController.h"
#import "LFWordViewController.h"

#define lfUnderLineHeight 2
@interface LFEssenceViewController ()<UIScrollViewDelegate>

@property(nonatomic,weak) UIScrollView *scrollView;

@property(nonatomic,weak) UIView *titleView;

@property(nonatomic,strong) NSMutableArray<LFClearHighlightedButton *> *titleButtons;

@property(nonatomic,weak) UIButton *previousClickTitleButton;

@property(nonatomic,weak) UIView *lineView;

@end

@implementation LFEssenceViewController

- (NSMutableArray<LFClearHighlightedButton *> *)titleButtons
{
    if (!_titleButtons) {
        _titleButtons = [NSMutableArray array];
    }
    return _titleButtons;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavBar];
    
    [self setupChildViewController];
    
    [self setupScrollView];
    
    [self setupTitleView];
}

- (void)setupNavBar
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithTarget:self action:@selector(gameClick) image:[UIImage originalImageNamed:@"nav_item_game_icon"] highlightedImage:[UIImage originalImageNamed:@"nav_item_game_click_icon"]];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithTarget:self action:@selector(gameClick) image:[UIImage originalImageNamed:@"navigationButtonRandom"] highlightedImage:[UIImage originalImageNamed:@"navigationButtonRandomClick"]];
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage originalImageNamed:@"MainTitle"]];
}

- (void)setupChildViewController
{
    [self addChildViewController:[[LFAllViewController new] init]];
    [self addChildViewController:[[LFVideoViewController alloc] init]];
    [self addChildViewController:[[LFVoiceViewController alloc] init]];
    [self addChildViewController:[[LFPhotoViewController alloc] init]];
    [self addChildViewController:[[LFWordViewController alloc] init]];
}

- (void)setupScrollView
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.delegate = self;
    scrollView.backgroundColor = [UIColor clearColor];
    scrollView.contentSize = CGSizeMake(CGRectGetWidth(scrollView.frame)*5, 0);
    scrollView.pagingEnabled = YES;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.bounces = NO;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    for (NSInteger i = 0; i < 5; i ++) {
        
    }
}

- (void)setupTitleView
{
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, kWidth, 35)];
    titleView.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
    [self.view addSubview:titleView];
    self.titleView = titleView;
    
    [self setupTitleButton];
    
    [self setupUnderLine];
}

- (void)setupTitleButton
{
    NSArray *titles = @[@"全部", @"视频", @"声音", @"图片", @"段子"];
    CGFloat count = 5;
    CGFloat titleBtnW = CGRectGetWidth(self.titleView.frame)/count;
    for (NSInteger i = 0; i < count; i ++) {
        LFClearHighlightedButton *titleBtn = [LFClearHighlightedButton buttonWithType:UIButtonTypeCustom];
        titleBtn.tag = i;
        titleBtn.frame = CGRectMake(titleBtnW*i, 0, titleBtnW, CGRectGetHeight(self.titleView.frame));
        [titleBtn setTitle:titles[i] forState:UIControlStateNormal];
        [titleBtn addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.titleView addSubview:titleBtn];
        [self.titleButtons addObject:titleBtn];
    }
    
    self.previousClickTitleButton = self.titleButtons.firstObject;
    [self titleButtonClick:self.previousClickTitleButton];
}

- (void)setupUnderLine
{
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.titleView.frame) - lfUnderLineHeight, CGRectGetWidth(self.previousClickTitleButton.frame), lfUnderLineHeight)];
    line.backgroundColor = [self.previousClickTitleButton titleColorForState:UIControlStateSelected];
    [self.titleView addSubview:line];
    self.lineView = line;
}

#pragma mark -
#pragma mark - 点击头部标题按钮
- (void)titleButtonClick:(UIButton *)sender
{
    self.previousClickTitleButton.selected = NO;
    sender.selected = YES;
    self.previousClickTitleButton = sender;
    [UIView animateWithDuration:0.25 animations:^{
        self.lineView.frame = CGRectMake(CGRectGetMinX(self.previousClickTitleButton.frame), CGRectGetHeight(self.titleView.frame) - lfUnderLineHeight, CGRectGetWidth(self.previousClickTitleButton.frame), lfUnderLineHeight);
        [self.scrollView setContentOffset:CGPointMake(CGRectGetWidth(self.scrollView.frame)*sender.tag, 0)];
    } completion:^(BOOL finished) {
        UIViewController *childVC = self.childViewControllers[sender.tag];
        if (childVC.isViewLoaded) { return; }
        childVC.view.frame = self.scrollView.bounds;
        [self.scrollView addSubview:childVC.view];
    }];
}

#pragma mark -
#pragma mark - 点击游戏
- (void)gameClick
{
    NSLog(@"点击游戏");
    
}

#pragma mark -
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSUInteger index = scrollView.contentOffset.x/CGRectGetWidth(scrollView.frame);
    [self titleButtonClick:self.titleButtons[index]];
}

@end
