//
//  LFFastLoginView.m
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/9.
//  Copyright © 2017年 liufeng. All rights reserved.
//

#import "LFFastLoginView.h"

@implementation LFFastLoginView

+ (instancetype)fastLoginView
{
    return [[NSBundle mainBundle] loadNibNamed:@"LFFastLoginView" owner:nil options:nil].firstObject;
}

@end
