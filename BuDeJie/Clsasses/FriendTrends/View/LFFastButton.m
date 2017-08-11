//
//  LFFastButton.m
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/9.
//  Copyright © 2017年 liufeng. All rights reserved.
//

#import "LFFastButton.h"

@implementation LFFastButton

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect imgR = self.imageView.frame;
    imgR.origin.y = 0;
    self.imageView.frame = imgR;
    
    CGPoint imgC = self.imageView.center;
    imgC.x = self.frame.size.width*0.5;
    self.imageView.center = imgC;
    
    [self.titleLabel sizeToFit];
    
    CGRect titleR = self.titleLabel.frame;
    titleR.origin.y = self.frame.size.height - self.titleLabel.frame.size.height;
    self.titleLabel.frame = titleR;
    
    CGPoint titleC = self.titleLabel.center;
    titleC.x = self.frame.size.width*0.5;
    self.titleLabel.center = titleC;
    
}

@end
