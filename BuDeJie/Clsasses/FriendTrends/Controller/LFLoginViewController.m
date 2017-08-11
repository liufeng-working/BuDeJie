//
//  LFLoginViewController.m
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/9.
//  Copyright © 2017年 liufeng. All rights reserved.
//

#import "LFLoginViewController.h"
#import "LFLoginView.h"
#import "LFFastLoginView.h"

@interface LFLoginViewController ()

@property (weak, nonatomic) IBOutlet UIView *middleView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leadConstraint;

@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end

@implementation LFLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LFLoginView *loginView = [LFLoginView loginView];
    loginView.frame = CGRectMake(0, 0, self.middleView.frame.size.width*0.5, self.middleView.frame.size.height);
    [self.middleView addSubview:loginView];
    
    LFLoginView *registerView = [LFLoginView registerView];
    registerView.frame = CGRectMake(self.middleView.frame.size.width*0.5, 0, self.middleView.frame.size.width*0.5, self.middleView.frame.size.height);
    [self.middleView addSubview:registerView];
    
    LFFastLoginView *fastLoginV = [LFFastLoginView fastLoginView];
    [self.bottomView addSubview:fastLoginV];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    LFLoginView *loginView = self.middleView.subviews.firstObject;
    loginView.frame = CGRectMake(0, 0, self.middleView.frame.size.width*0.5, self.middleView.frame.size.height);
    
    LFLoginView *registerView = self.middleView.subviews.lastObject;
    registerView.frame = CGRectMake(self.middleView.frame.size.width*0.5, 0, self.middleView.frame.size.width*0.5, self.middleView.frame.size.height);
    
    LFFastLoginView *fastLoginV = self.bottomView.subviews.firstObject;
    fastLoginV.frame = self.bottomView.bounds;
}

- (IBAction)close:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)register:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    
    self.leadConstraint.constant = self.leadConstraint.constant == 0 ? -self.middleView.frame.size.width*0.5 : 0;
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
}

@end
