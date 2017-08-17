//
//  LFTabBar.m
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/6.
//  Copyright © 2017年 liufeng. All rights reserved.
//

#import "LFTabBar.h"

@interface LFTabBar ()

@property(nonatomic,weak) UIButton *plusBtn;

@property(nonatomic,weak) UIControl *previousClickTabBarButton;

@end

@implementation LFTabBar

- (UIButton *)plusBtn
{
    if (!_plusBtn) {
        UIButton *plus = [UIButton buttonWithType:UIButtonTypeCustom];
        [plus setBackgroundImage:[UIImage originalImageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [plus setBackgroundImage:[UIImage originalImageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [plus sizeToFit];
        [self addSubview:plus];
        _plusBtn = plus;
    }
    return _plusBtn;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);
    NSUInteger count = self.items.count;
    CGFloat itemW = width/(count + 1);
    
    NSInteger i = 0;
    for (UIControl *obj in self.subviews) {
        if ([obj isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            if (i == count/2) {
                i += 1;
            }
            obj.frame = CGRectMake(itemW*i, 0, itemW, height);
            
            [obj addTarget:self action:@selector(tabBarButtonRepeatClick:) forControlEvents:UIControlEventTouchUpInside];
            
            if (i == 0 && self.previousClickTabBarButton == nil) {
                self.previousClickTabBarButton = obj;
            }
            i ++;
        }
    }
    
    self.plusBtn.center = CGPointMake(width*0.5, height*0.5);
}

- (void)tabBarButtonRepeatClick:(UIControl *)sender
{
    if (self.previousClickTabBarButton == sender) {
        [[NSNotificationCenter defaultCenter] postNotificationName:LFTabBarButtonDidRepeatClickNotification object:sender];
    }
    
    self.previousClickTabBarButton = sender;
}

@end

NSString *const LFTabBarButtonDidRepeatClickNotification = @"LFTabBarButtonDidRepeatClickNotification";
