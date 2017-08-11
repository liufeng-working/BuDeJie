//
//  LFTagItem.h
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/8.
//  Copyright © 2017年 liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFTagItem : NSObject

@property(nonatomic,strong) NSURL *image_list;

@property(nonatomic,assign) BOOL is_default;

@property(nonatomic,assign) BOOL is_sub;

@property(nonatomic,copy) NSString *sub_number;

@property(nonatomic,copy) NSString *theme_id;

@property(nonatomic,copy) NSString *theme_name;

@end
