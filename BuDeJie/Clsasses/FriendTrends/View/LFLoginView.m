//
//  LFLoginView.m
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/9.
//  Copyright © 2017年 liufeng. All rights reserved.
//

#import "LFLoginView.h"

@interface LFLoginView ()

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation LFLoginView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UIImage *temp = self.loginBtn.currentBackgroundImage;
    temp = [temp stretchableImageWithLeftCapWidth:temp.size.width*0.5 topCapHeight:temp.size.height*0.5];
    [self.loginBtn setBackgroundImage:temp forState:UIControlStateNormal];
}

+ (instancetype)loginView
{
    return [[NSBundle mainBundle] loadNibNamed:@"LFLoginView" owner:nil options:nil].firstObject;
}

+ (instancetype)registerView
{
    return [[NSBundle mainBundle] loadNibNamed:@"LFLoginView" owner:nil options:nil].lastObject;
}

@end
