//
//  LFWebViewController.m
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/10.
//  Copyright © 2017年 liufeng. All rights reserved.
//

#import "LFWebViewController.h"
#import <WebKit/WebKit.h>

@interface LFWebViewController ()

@property (weak, nonatomic) IBOutlet UIView *contentView;

@property(nonatomic,weak) WKWebView *webView;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwordItem;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *backItem;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *refreshItem;

@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@end

@implementation LFWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    WKWebView *webView = [[WKWebView alloc] init];
    [self.contentView addSubview:webView];
    self.webView = webView;
    
    [webView loadRequest:[NSURLRequest requestWithURL:self.url]];
    
    [webView addObserver:self forKeyPath:@"canGoBack" options:NSKeyValueObservingOptionNew context:nil];
    [webView addObserver:self forKeyPath:@"canGoForward" options:NSKeyValueObservingOptionNew context:nil];
    [webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    [webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.webView.frame = self.contentView.bounds;
}

#pragma mark -
#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    self.backItem.enabled = self.webView.canGoBack;
    self.forwordItem.enabled = self.webView.canGoForward;
    self.title = self.webView.title;
    self.progressView.progress = self.webView.estimatedProgress;
    self.progressView.hidden = self.webView.estimatedProgress == 1;
}

#pragma mark -
#pragma mark - 前进
- (IBAction)forword:(UIBarButtonItem *)sender {
    [self.webView goForward];
}

#pragma mark -
#pragma mark - 后退
- (IBAction)back:(UIBarButtonItem *)sender {
    [self.webView goBack];
}

#pragma mark -
#pragma mark - 刷新
- (IBAction)refresh:(UIBarButtonItem *)sender {
    [self.webView reload];
}

- (void)dealloc {
    [self.webView removeObserver:self forKeyPath:@"canGoBack"];
    [self.webView removeObserver:self forKeyPath:@"canGoForward"];
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
    [self.webView removeObserver:self forKeyPath:@"title"];
}

@end
