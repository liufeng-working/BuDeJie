//
//  LFTopicItem.h
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/12.
//  Copyright © 2017年 liufeng. All rights reserved.
//  帖子模型

/*{
 bimageuri = "http://wimg.spriteapp.cn/picture/2017/0812/a558ed1e-7f6a-11e7-aeb1-1866daeb0df1_wpd.jpg";
 bookmark = 7;
 "cache_version" = 2;
 cai = 8;
 "cdn_img" = "http://wimg.spriteapp.cn/picture/2017/0812/a558ed1e-7f6a-11e7-aeb1-1866daeb0df1_wpd.jpg";
 comment = 5;
 "create_time" = "2017-08-12 22:29:28";
 "created_at" = "2017-08-12 22:39:50";
 ding = 79;
 favourite = 7;
 hate = 8;
 height = 600;
 id = 26020554;
 image0 = "http://wimg.spriteapp.cn/picture/2017/0812/a558ed1e-7f6a-11e7-aeb1-1866daeb0df1_wpd.jpg";
 image1 = "http://wimg.spriteapp.cn/picture/2017/0812/a558ed1e-7f6a-11e7-aeb1-1866daeb0df1_wpd.jpg";
 image2 = "http://wimg.spriteapp.cn/picture/2017/0812/a558ed1e-7f6a-11e7-aeb1-1866daeb0df1_wpd.jpg";
 "image_small" = "http://wimg.spriteapp.cn/picture/2017/0812/a558ed1e-7f6a-11e7-aeb1-1866daeb0df1_wpd.jpg";
 "is_gif" = 0;
 love = 79;
 name = "\U66fe\U7ecf\U5b89\U9759\U8fc7\U800c\U5df2";
 "original_pid" = 0;
 passtime = "2017-08-12 22:39:50";
 playcount = 3010;
 playfcount = 30;
 "profile_image" = "http://wimg.spriteapp.cn/profile/large/2017/07/21/597202ac8dbfa_mini.jpg";
 repost = 4;
 "screen_name" = "\U66fe\U7ecf\U5b89\U9759\U8fc7\U800c\U5df2";
 status = 2;
 t = 1502548790;
 tag = "";
 text = "\U4ece\U6b6a\U679c\U706b\U5230\U56fd\U5185\U6700\U8fd1\U5065\U8eab\U623f\U5f88\U6d41\U884c\U7684\U722c\U697c\U673a\Uff0c\U4f60\U60f3\U8bd5\U4e00\U8bd5\U5417#\U79d1\U6280\U5927\U5496##\U521b\U610f\U8111\U6d1e##\U4e3b\U7248\U5757#";
 "theme_id" = 55163;
 "theme_name" = "\U4e3b\U7248\U5757";
 "theme_type" = 1;
 "themes": ({
 "theme_id": "55",
 "theme_type": "1",
 "theme_name": "微视频"
 });
 "top_cmt" =             ({
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
 });
 type = 41;
 "user_id" = 17545511;
 videotime = 88;
 videouri = "http://wvideo.spriteapp.cn/video/2017/0812/a558ed1e-7f6a-11e7-aeb1-1866daeb0df1_wpd.mp4";
 voicelength = 0;
 voicetime = 0;
 voiceuri = "";
 "weixin_url" = "http://a.f.zk111.com.cn/share/26020554.html?wx.qq.com&appname=";
 width = 1066;
 }*/



#import <UIKit/UIKit.h>
#import "LFCommentItem.h"

typedef NS_ENUM(NSInteger, LFTopicType) {
    LFTopicTypeAll   = 1,
    LFTopicTypeVideo = 41,
    LFTopicTypeVoice = 31,
    LFTopicTypePhoto = 10,
    LFTopicTypeWord  = 29
};

@interface LFTopicItem : NSObject

/**
 发帖人的昵称
 */
@property(nonatomic,copy) NSString *screen_name;

/**
 发帖人的昵称
 */
@property(nonatomic,copy) NSString *name;

/**
 头像的图片url地址
 */
@property(nonatomic,strong) NSURL *profile_image;

/**
 帖子的内容
 */
@property(nonatomic,copy) NSString *text;

/**
 1为全部，10为图片，29为段子，31为音频，41为视频，默认为1
 */
@property(nonatomic,assign) LFTopicType type;

/**
 顶的数量
 */
@property(nonatomic,assign) NSInteger ding;

/**
 踩的数量
 */
@property(nonatomic,assign) NSInteger cai;

/**
 转发的数量
 */
@property(nonatomic,assign) NSInteger repost;

/**
 帖子的被评论数量
 */
@property(nonatomic,assign) NSInteger comment;

/**
 高度
 */
@property(nonatomic,assign) CGFloat height;


/**
 宽度
 */
@property(nonatomic,assign) CGFloat width;

/**
 最热评论数组（只显示第一个）
 */
@property(nonatomic,strong) NSArray<LFCommentItem *> *top_cmt;

/**
 如果为音频类帖子，则返回值为音频时长（单位：秒）
 */
@property(nonatomic,assign) NSInteger voicetime;

/**
 如果为音频类帖子,则为音频的尺寸（单位：字节）
 */
@property(nonatomic,assign) NSInteger voicelength;

/**
 如果为音频，则为音频的播放地址
 */
@property(nonatomic,strong) NSURL *voiceuri;

/**
 如果为视频类帖子，则该参数为视频的长度
 */
@property(nonatomic,assign) NSInteger videotime;

/**
 视频播放的url地址
 */
@property(nonatomic,strong) NSURL *videouri;

/**
 播放次数
 */
@property(nonatomic,assign) NSInteger playcount;

/**
 显示的图片地址
 */
@property(nonatomic,strong) NSURL *image0;
@property(nonatomic,strong) NSURL *image1;
@property(nonatomic,strong) NSURL *image2;

/**
 是否是gif动画
 */
@property(nonatomic,assign) BOOL is_gif;

/**
 帖子的收藏量
 */
@property(nonatomic,copy) NSString *bookmark;
@property(nonatomic,copy) NSString *love;
@property(nonatomic,copy) NSString *favourite;

/**
 发帖人的id
 */
@property(nonatomic,copy) NSString *user_id;

/**
 系统审核通过后创建帖子的时间
 */
@property(nonatomic,copy) NSString *created_at;

/**
 帖子id
 */
@property(nonatomic,copy) NSString *id;

/**
 真实的播放次数
 */
@property(nonatomic,copy) NSString *playfcount;

/**
 <#Description#>
 */
@property(nonatomic,copy) NSString *bimageuri;

/**
 一般为1
 */
@property(nonatomic,copy) NSString *theme_type;

/**
 帖子通过的时间和created_at的参数时间一致
 */
@property(nonatomic,copy) NSString *passtime;

/**
 帖子的标签备注
 */
@property(nonatomic,copy) NSString *tag;

/**
 帖子创建时间
 */
@property(nonatomic,copy) NSString *create_time;

/**
 主题
 */
@property(nonatomic,strong) NSArray *themes;

/**
 帖子的状态（例：4）
 */
@property(nonatomic,copy) NSString *status;

/**
 0
 */
@property(nonatomic,copy) NSString *theme_id;

/**
 空
 */
@property(nonatomic,copy) NSString *original_pid;

/**
 当前帖子的time
 */
@property(nonatomic,copy) NSString *t;

/**
 当分享到微信中的url链接
 */
@property(nonatomic,copy) NSString *weixin_url;

/**
 帖子的所属分类的标签名字
 */
@property(nonatomic,copy) NSString *theme_name;

/**
 增加的属性
 */
@property(nonatomic,assign,readonly) CGFloat cellHeight;
@property(nonatomic,assign,readonly) CGRect extraViewF;
@property(nonatomic,assign,readonly) BOOL is_longPhoto;

@end
