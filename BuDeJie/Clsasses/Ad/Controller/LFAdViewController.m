//
//  LFAdViewController.m
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/8.
//  Copyright © 2017年 liufeng. All rights reserved.
//

#import "LFAdViewController.h"
#import "LFAdItem.h"
#import "LFTabBarController.h"

#define code2 @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"
@interface LFAdViewController ()

@property (weak, nonatomic) IBOutlet UIView *contentView;

@property(nonatomic,strong) LFAdItem *adItem;

@property(nonatomic,weak) UIImageView *adView;

@property (weak, nonatomic) IBOutlet UIButton *timeBtn;

@property(nonatomic,weak) NSTimer *timer;

@end

@implementation LFAdViewController

- (UIImageView *)adView
{
    if (!_adView) {
        UIImageView *adView = [[UIImageView alloc] init];
        adView.userInteractionEnabled = YES;
        [self.contentView addSubview:adView];
        _adView = adView;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAd)];
        [adView addGestureRecognizer:tap];
    }
    return _adView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadAdData];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
}

- (void)loadAdData
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"code2"] = code2;
    [manager GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *_Nullable responseObject) {
        NSDictionary *adDic = [responseObject[@"ad"] lastObject];
        self.adItem = [LFAdItem mj_objectWithKeyValues:adDic];
        
        CGFloat h = kWidth*self.adItem.h/self.adItem.w;
        self.adView.frame = CGRectMake(0, 0, kWidth, h);
        [self.adView sd_setImageWithURL:self.adItem.w_picurl];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}

- (void)tapAd
{
    if ([[UIApplication sharedApplication] canOpenURL:self.adItem.ori_curl]) {
        if ([[UIApplication sharedApplication] respondsToSelector:@selector(openURL:)]) {
            [[UIApplication sharedApplication] openURL:self.adItem.ori_curl];
        }else {
            [[UIApplication sharedApplication] openURL:self.adItem.ori_curl options:@{} completionHandler:nil];
        }
    }
}

- (void)timeChange
{
    static NSInteger time = 3;
    if (time == 0) {
        [self jumpToMain];
    }
    
    [self.timeBtn setTitle:[NSString stringWithFormat:@"跳过（%ld）", (long)time] forState:UIControlStateNormal];
    time --;
}

- (IBAction)jumpToMain {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    
    LFTabBarController *tabbarVC = [LFTabBarController new];
    [UIApplication sharedApplication].keyWindow.rootViewController = tabbarVC;
}

@end
