//
//  LFClearHighlightedButton.m
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/12.
//  Copyright © 2017年 liufeng. All rights reserved.
//

#import "LFClearHighlightedButton.h"

@implementation LFClearHighlightedButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        [self setTitleColor:UIColor.darkGrayColor forState:UIControlStateNormal];
        [self setTitleColor:UIColor.redColor forState:UIControlStateSelected];
    }
    return self;
}

- (BOOL)isHighlighted {
    return NO;
}

@end
