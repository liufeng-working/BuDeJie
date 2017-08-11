//
//  LFNavigationController.m
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/6.
//  Copyright © 2017年 liufeng. All rights reserved.
//

#import "LFNavigationController.h"

@interface LFNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation LFNavigationController
@dynamic interactivePopGestureRecognizer;

+ (void)load {
    [[UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[self class]]] setTitleTextAttributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:20]}];
    
    [[UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[self class]]] setBackgroundImage:[UIImage originalImageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.interactivePopGestureRecognizer.enabled = NO;
    UIPanGestureRecognizer *interactivePan = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:NSSelectorFromString(@"handleNavigationTransition:")];
    interactivePan.delegate = self;
    [self.view addGestureRecognizer:interactivePan];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count) {
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem backBarButtonItemWithTarget:self action:@selector(back) image:[UIImage originalImageNamed:@"navigationButtonReturn"] highlightedImage:[UIImage originalImageNamed:@"navigationButtonReturnClick"] color:[UIColor blackColor] highlightedColor:[UIColor redColor] title:@"返回"];
    }

    viewController.hidesBottomBarWhenPushed = self.viewControllers.count;
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    return self.viewControllers.count != 1;
}

@end
