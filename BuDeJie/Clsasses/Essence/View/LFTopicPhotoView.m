//
//  LFTopicPhotoView.m
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/13.
//  Copyright © 2017年 liufeng. All rights reserved.
//

#import "LFTopicPhotoView.h"
#import "LFTopicItem.h"
#import "LFSeePhotoViewController.h"

@interface LFTopicPhotoView ()

@property (weak, nonatomic) IBOutlet FLAnimatedImageView *iconView;
@property (weak, nonatomic) IBOutlet UIImageView *gifView;
@property (weak, nonatomic) IBOutlet UIButton *bigBtn;

@end

@implementation LFTopicPhotoView

- (void)setPhotoItem:(LFTopicItem *)photoItem
{
    _photoItem = photoItem;
    
    [self.iconView sd_setImageWithURL:photoItem.image1 completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (photoItem.is_longPhoto) {
            self.bigBtn.hidden = NO;
            self.iconView.contentMode = UIViewContentModeTop;
            CGFloat w = CGRectGetWidth(self.iconView.frame);
            CGFloat h = [LFFit fitHeightForWidth:w originSize:CGSizeMake(photoItem.width, photoItem.height)];
            CGSize contextS = CGSizeMake(w, h);
            UIGraphicsBeginImageContextWithOptions(contextS, NO, 0);
            [image drawInRect:CGRectMake(0, 0, w, h)];
            self.iconView.image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
        }
    }];
    
    self.gifView.hidden = !photoItem.is_gif;
    
    if (photoItem.is_longPhoto) {
        self.bigBtn.hidden = NO;
        self.iconView.contentMode = UIViewContentModeTop;
    }else {
        self.bigBtn.hidden = YES;
        self.iconView.contentMode = UIViewContentModeScaleToFill;
    }
}

- (IBAction)clickImage:(UITapGestureRecognizer *)sender {
    LFSeePhotoViewController *photoVC = [[LFSeePhotoViewController alloc] init];
    photoVC.photoItem = self.photoItem;
    [kWindow.rootViewController presentViewController:photoVC animated:YES completion:nil];
}

@end
