//
//  LFTopicInfoItem.h
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/12.
//  Copyright © 2017年 liufeng. All rights reserved.
//  每次请求帖子返回的头信息

#import <Foundation/Foundation.h>

/*{
 count = 2000;
 maxid = 1502548790;
 maxtime = 1502548790;
 page = 100;
 vendor = "six.jie.c";
 }*/

@interface LFTopicInfoItem : NSObject

/**
 总数
 */
@property(nonatomic,assign) NSInteger count;

/**
 最大的帖子id
 */
@property(nonatomic,assign) NSInteger maxid;

/**
 第一次加载帖子时候不需要传入此关键字，当需要加载下一页时：需要传入加载上一页时返回值字段“maxtime”中的内容。
 */
@property(nonatomic,copy) NSString *maxtime;

/**
 当前所加载的页码数，默认为0
 */
@property(nonatomic,assign) NSInteger page;

/**
 供应商
 */
@property(nonatomic,copy) NSString *vendor;

@end
