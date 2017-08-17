//
//  LFTopicCell.m
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/12.
//  Copyright © 2017年 liufeng. All rights reserved.
//

#import "LFTopicCell.h"
#import "LFTopicItem.h"
#import "LFTopicVideoView.h"
#import "LFTopicVoiceView.h"
#import "LFTopicPhotoView.h"

@interface LFTopicCell ()

@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameL;
@property (weak, nonatomic) IBOutlet UILabel *timeL;
@property (weak, nonatomic) IBOutlet UILabel *contentL;
@property (weak, nonatomic) IBOutlet UIButton *dingBtn;
@property (weak, nonatomic) IBOutlet UIButton *caiBtn;
@property (weak, nonatomic) IBOutlet UIButton *repostBtn;
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;
@property (weak, nonatomic) IBOutlet UIView *hotCommentView;
@property (weak, nonatomic) IBOutlet UILabel *hotCommentL;

@property(nonatomic,weak) LFTopicVideoView *videoView;
@property(nonatomic,weak) LFTopicVoiceView *voiceView;
@property(nonatomic,weak) LFTopicPhotoView *photoView;

@end

@implementation LFTopicCell

- (LFTopicVideoView *)videoView
{
    if (!_videoView) {
        LFTopicVideoView *videoView = [LFTopicVideoView lf_viewFromXib];
        [self.contentView addSubview:_videoView = videoView];
    }
    return _videoView;
}

- (LFTopicVoiceView *)voiceView
{
    if (!_voiceView) {
        LFTopicVoiceView *voiceView = [LFTopicVoiceView lf_viewFromXib];
        [self.contentView addSubview:_voiceView = voiceView];
    }
    return _voiceView;
}

- (LFTopicPhotoView *)photoView
{
    if (!_photoView) {
        LFTopicPhotoView *photoView = [LFTopicPhotoView lf_viewFromXib];
        [self.contentView addSubview:_photoView = photoView];
    }
    return _photoView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.profileImageView.layer.cornerRadius = CGRectGetWidth(self.profileImageView.frame)*0.5;
    self.profileImageView.layer.masksToBounds = YES;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.topicItem.type == LFTopicTypeVideo) {
        self.videoView.frame = self.topicItem.extraViewF;
    }else if (self.topicItem.type == LFTopicTypeVoice) {
        self.voiceView.frame = self.topicItem.extraViewF;
    }else if (self.topicItem.type == LFTopicTypePhoto){
        self.photoView.frame = self.topicItem.extraViewF;
    }
}

//- (void)setFrame:(CGRect)frame {
//    frame.size.height -= 10;
//    [super setFrame:frame];
//}

- (void)setTopicItem:(LFTopicItem *)topicItem
{
    _topicItem = topicItem;
    
    [self.profileImageView sd_setImageWithURL:topicItem.profile_image placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.nameL.text = topicItem.name;
    self.timeL.text = topicItem.passtime;
    
    if (topicItem.text.length) {
        self.contentL.hidden = NO;
        self.contentL.text = topicItem.text;
    }else {
        self.contentL.hidden = YES;
    }
    [self setupToolViewTitle:self.dingBtn number:topicItem.ding placeholder:@"顶"];
    [self setupToolViewTitle:self.caiBtn number:topicItem.cai placeholder:@"踩"];
    [self setupToolViewTitle:self.repostBtn number:topicItem.repost placeholder:@"转发"];
    [self setupToolViewTitle:self.commentBtn number:topicItem.comment placeholder:@"评论"];
    
    //最热评论
    if (topicItem.top_cmt.count) {
        self.hotCommentView.hidden = NO;
        self.hotCommentL.text = self.topicItem.top_cmt.firstObject.content;
    }else {
        self.hotCommentView.hidden = YES;
    }
    
    if (topicItem.type == LFTopicTypeVideo) {
        self.videoView.videoItem = topicItem;
        self.videoView.hidden = NO;
        self.voiceView.hidden = YES;
        self.photoView.hidden = YES;
    }else if (topicItem.type == LFTopicTypeVoice) {
        self.voiceView.voiceItem = topicItem;
        self.videoView.hidden = YES;
        self.voiceView.hidden = NO;
        self.photoView.hidden = YES;
    }else if (topicItem.type == LFTopicTypePhoto){
        self.photoView.photoItem = topicItem;
        self.videoView.hidden = YES;
        self.voiceView.hidden = YES;
        self.photoView.hidden = NO;
    }else {
        self.videoView.hidden = YES;
        self.voiceView.hidden = YES;
        self.photoView.hidden = YES;
    }
}

- (IBAction)moreClick:(UIButton *)sender {
}

- (void)setupToolViewTitle:(UIButton *)button number:(NSInteger)number placeholder:(NSString *)placeholder
{
    if (number >= 10000) {
        [button setTitle:[NSString stringWithFormat:@"%.1f万", number*1.0/10000] forState:UIControlStateNormal];
    }else if (number > 0) {
        [button setTitle:[NSString stringWithFormat:@"%ld", number] forState:UIControlStateNormal];
    }else {
        [button setTitle:placeholder forState:UIControlStateNormal];
    }
}

@end
