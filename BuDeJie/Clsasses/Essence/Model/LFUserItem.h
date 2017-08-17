//
//  LFUserItem.h
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/13.
//  Copyright © 2017年 liufeng. All rights reserved.
//  用户模型

/*{
 id = 15311119;
 "is_vip" = 0;
 "personal_page" = "http://user.qzone.qq.com/B990DF970630AA416EDBB7A5694000A0";
 "profile_image" = "http://qzapp.qlogo.cn/qzapp/100336987/B990DF970630AA416EDBB7A5694000A0/100";
 "qq_uid" = "";
 "qzone_uid" = B990DF970630AA416EDBB7A5694000A0;
 sex = m;
 "total_cmt_like_count" = 92;
 username = "\U62bf\U5634\Uff0c\U82e6\U7b11666";
 "weibo_uid" = "";
 }*/
#import <Foundation/Foundation.h>

@interface LFUserItem : NSObject

@property(nonatomic,copy) NSString *username;

@property(nonatomic,copy) NSString *id;

@property(nonatomic,assign) BOOL is_vip;

@property(nonatomic,strong) NSURL *personal_page;

@property(nonatomic,strong) NSURL *profile_image;

@property(nonatomic,copy) NSString *qq_uid;

@property(nonatomic,copy) NSString *qzone_uid;

@property(nonatomic,copy) NSString *sex;

@property(nonatomic,assign) NSInteger total_cmt_like_count;

@property(nonatomic,copy) NSString *weibo_uid;

@end
