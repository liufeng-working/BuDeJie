//
//  LFCommentItem.h
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/13.
//  Copyright © 2017年 liufeng. All rights reserved.
//  评论模型

/*{
 "cmt_type" = 29;
 content = "\U770b\U90a3\U4e2a\U5355\U8eab\U72d7\Uff0c\U770b\U90a3\U4e2a\U5355\U8eab\U72d7\Uff0c\U770b\Uff01\U90a3\Uff01\U4e2a\Uff01\U5355\Uff01\U8eab\Uff01\U72d7\Uff01\Uff01";
 ctime = "2017-07-24 16:15:28";
 "data_id" = 25801841;
 id = 85516477;
 "like_count" = 65;
 precid = 0;
 precmt =     (
 );
 preuid = 0;
 status = 0;
 user =     {
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
 };
 voicetime = "";
 voiceuri = "";
 }*/
#import <Foundation/Foundation.h>
#import "LFUserItem.h"

@interface LFCommentItem : NSObject

/**
 评论内容
 */
@property(nonatomic,copy) NSString *content;

/**
 评论id
 */
@property(nonatomic,copy) NSString *id;

/**
 如果是评论之前的人的评论内容，则为前面帖子的评论id，如果不是则为0
 */
@property(nonatomic,copy) NSString *precid;

/**
 用户信息
 */
@property(nonatomic,strong) LFUserItem *user;

/**
 所评论的帖子的id
 */
@property(nonatomic,copy) NSString *data_id;

/**
 被评论的用户的信息字段
 */
@property(nonatomic,strong) NSArray *precmt;

/**
 如果评论内容是音频，则为音频的时长
 */
@property(nonatomic,copy) NSString *voicetime;

/**
 评论的创建时间
 */
@property(nonatomic,copy) NSString *ctime;

/**
 like_count
 */
@property(nonatomic,copy) NSString *like_count;

/**
 评论类型
 */
@property(nonatomic,copy) NSString *cmt_type;

/**
 声音评论播放地址
 */
@property(nonatomic,copy) NSString *voiceuri;

/**
 如果评论内容是音频，则为音频的url地址
 */
@property(nonatomic,copy) NSString *preuid;

/**
 状态，一般为0
 */
@property(nonatomic,copy) NSString *status;

@end
