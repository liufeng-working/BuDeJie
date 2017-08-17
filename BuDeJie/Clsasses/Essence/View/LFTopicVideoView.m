//
//  LFTopicVideoView.m
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/13.
//  Copyright © 2017年 liufeng. All rights reserved.
//

#import "LFTopicVideoView.h"
#import "LFTopicItem.h"
#import "LFSeePhotoViewController.h"

@interface LFTopicVideoView ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *playCountL;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (weak, nonatomic) IBOutlet UILabel *timeL;

@end

@implementation LFTopicVideoView

- (void)setVideoItem:(LFTopicItem *)videoItem
{
    _videoItem = videoItem;
    
    UIImage *cacheImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:videoItem.image1.absoluteString];
    if (cacheImage) {
        self.iconView.image = cacheImage;
    }else {
        if ([AFNetworkReachabilityManager sharedManager].isReachableViaWiFi) {
            [self.iconView sd_setImageWithURL:videoItem.image1];
        }else if ([AFNetworkReachabilityManager sharedManager].isReachableViaWWAN) {
            [self.iconView sd_setImageWithURL:videoItem.image0];
        }else {
            UIImage *thumbnailImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:videoItem.image0.absoluteString];
            if (thumbnailImage) {
                self.iconView.image = thumbnailImage;
            }else {
                self.iconView.image = nil;
            }
        }
    }
    
    if (videoItem.playcount >= 10000) {
        self.playCountL.text = [[NSString stringWithFormat:@"%.1f万次播放", videoItem.playcount*1.0/10000] stringByReplacingOccurrencesOfString:@".0" withString:@""];
    }else {
        self.playCountL.text = [NSString stringWithFormat:@"%zd次播放", videoItem.playcount];
    }
    self.timeL.text = [NSString stringWithFormat:@"%02zd:%02zd", videoItem.videotime/60, videoItem.videotime%60];
}
- (IBAction)playVideo:(UIButton *)sender {
}

- (IBAction)clickImage:(UITapGestureRecognizer *)sender {
    LFSeePhotoViewController *photoVC = [[LFSeePhotoViewController alloc] init];
    photoVC.photoItem = self.videoItem;
    [kWindow.rootViewController presentViewController:photoVC animated:YES completion:nil];
}

@end
