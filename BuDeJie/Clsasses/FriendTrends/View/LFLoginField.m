//
//  LFLoginField.m
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/9.
//  Copyright © 2017年 liufeng. All rights reserved.
//

#import "LFLoginField.h"

@implementation LFLoginField

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.tintColor = [UIColor whiteColor];
    
    //_placeholderLabel -> UITextFieldLabel
    
    self.placeholderColor = [UIColor grayColor];
    
    //原则：不要自己成为自己的代理
    [self addTarget:self action:@selector(textBegin) forControlEvents:UIControlEventEditingDidBegin];
    [self addTarget:self action:@selector(textEnd) forControlEvents:UIControlEventEditingDidEnd];
}

#pragma mark -
#pragma mark - 检测文本框开始编辑
- (void)textBegin
{
    self.placeholderColor = [UIColor redColor];
}

#pragma mark -
#pragma mark - 检测文本框结束编辑
- (void)textEnd
{
    self.placeholderColor = [UIColor grayColor];
}

@end
