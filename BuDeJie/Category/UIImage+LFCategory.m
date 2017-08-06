//
//  UIImage+LFCategory.m
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/6.
//  Copyright © 2017年 liufeng. All rights reserved.
//

#import "UIImage+LFCategory.h"

@implementation UIImage (original)

/**
 根据图片名称获取原始未渲染的图片
 
 @param imageName 图片名称
 @return 原始图片
 */
+ (UIImage *)originalImageNamed:(NSString *)imageName
{
    return [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
