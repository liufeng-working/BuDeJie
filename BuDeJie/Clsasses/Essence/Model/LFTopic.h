//
//  LFTopic.h
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/12.
//  Copyright © 2017年 liufeng. All rights reserved.
//  每次请求帖子返回的数据（包括信息和列表）

#import <Foundation/Foundation.h>
#import "LFTopicInfoItem.h"
#import "LFTopicItem.h"

@interface LFTopic : NSObject

@property(nonatomic,strong) LFTopicInfoItem *info;

@property(nonatomic,strong) NSMutableArray<LFTopicItem *> *list;

@end
