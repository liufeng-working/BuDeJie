//
//  LFSquareItem.h
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/10.
//  Copyright © 2017年 liufeng. All rights reserved.
//

/*{
 android = "";
 icon = "http://img.spriteapp.cn/ugc/2015/05/20/150532_5078.png";
 id = 28;
 ipad = "";
 iphone = "";
 market = "";
 name = "\U5ba1\U5e16";
 url = "mod://BDJ_To_Check";
 }*/
#import <Foundation/Foundation.h>

@interface LFSquareItem : NSObject

@property(nonatomic,strong) NSURL *icon;

@property(nonatomic,copy) NSString *name;

@property(nonatomic,copy) NSString *url;

@end
