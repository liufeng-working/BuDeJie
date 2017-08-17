//
//  LFTopic.m
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/12.
//  Copyright © 2017年 liufeng. All rights reserved.
//

#import "LFTopic.h"

@implementation LFTopic

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"list": [LFTopicItem class]};
}

@end
