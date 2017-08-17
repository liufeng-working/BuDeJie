//
//  UIColor+LFCategory.h
//  test1
//
//  Created by NJWC on 16/8/31.
//  Copyright © 2016年 kaituo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (LFCategory)

/**
 *  用6位数 获取颜色（字符串 @"#000000" 或者 @"000000"）
 */

+ (UIColor *)colorWithHexString:(NSString *)hex;

@end

NS_ASSUME_NONNULL_END
