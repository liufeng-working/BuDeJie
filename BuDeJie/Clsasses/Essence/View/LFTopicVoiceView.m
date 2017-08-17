//
//  LFTopicVoiceView.m
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/13.
//  Copyright © 2017年 liufeng. All rights reserved.
//

#import "LFTopicVoiceView.h"
#import "LFTopicItem.h"
#import "LFSeePhotoViewController.h"

@interface LFTopicVoiceView ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *playCountL;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (weak, nonatomic) IBOutlet UILabel *timeL;

@end

@implementation LFTopicVoiceView

- (void)setVoiceItem:(LFTopicItem *)voiceItem
{
    _voiceItem = voiceItem;
    
    UIImage *cacheImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:voiceItem.image1.absoluteString];
    if (cacheImage) {
        self.iconView.image = cacheImage;
    }else {
        if ([AFNetworkReachabilityManager sharedManager].isReachableViaWiFi) {
            [self.iconView sd_setImageWithURL:voiceItem.image1];
        }else if ([AFNetworkReachabilityManager sharedManager].isReachableViaWWAN) {
            [self.iconView sd_setImageWithURL:voiceItem.image0];
        }else {
            UIImage *thumbnailImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:voiceItem.image0.absoluteString];
            if (thumbnailImage) {
                self.iconView.image = thumbnailImage;
            }else {
                self.iconView.image = nil;
            }
        }
    }
    
    if (voiceItem.playcount >= 10000) {
        self.playCountL.text = [[NSString stringWithFormat:@"%.1f万次播放", voiceItem.playcount*1.0/10000] stringByReplacingOccurrencesOfString:@".0" withString:@""];
    }else {
        self.playCountL.text = [NSString stringWithFormat:@"%zd次播放", voiceItem.playcount];
    }
    self.timeL.text = [NSString stringWithFormat:@"%02zd:%02zd", voiceItem.voicetime/60, voiceItem.voicetime%60];
}

- (IBAction)playVoice:(UIButton *)sender {
}

- (IBAction)clickImage:(UITapGestureRecognizer *)sender {
    LFSeePhotoViewController *photoVC = [[LFSeePhotoViewController alloc] init];
    photoVC.photoItem = self.voiceItem;
    [kWindow.rootViewController presentViewController:photoVC animated:YES completion:nil];
}

@end
