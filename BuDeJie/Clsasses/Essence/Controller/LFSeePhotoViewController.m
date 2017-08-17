//
//  LFSeePhotoViewController.m
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/15.
//  Copyright © 2017年 liufeng. All rights reserved.
//

#import "LFSeePhotoViewController.h"
#import "LFTopicItem.h"
#import <Photos/Photos.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface LFSeePhotoViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property(nonatomic,weak) FLAnimatedImageView *imageView;

@end

@implementation LFSeePhotoViewController

- (FLAnimatedImageView *)imageView
{
    if (!_imageView) {
        FLAnimatedImageView *imageView = [[FLAnimatedImageView alloc] init];
        [self.scrollView addSubview:imageView];
        _imageView = imageView;
    }
    return _imageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.imageView sd_setImageWithURL:self.photoItem.image1 completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        self.saveBtn.enabled = YES;
    }];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGFloat sw = CGRectGetWidth(self.scrollView.frame);
    CGFloat sh = CGRectGetHeight(self.scrollView.frame);
    CGFloat x = 0;
    CGFloat w = sw;
    CGFloat h = [LFFit fitHeightForWidth:sw originSize:CGSizeMake(self.photoItem.width, self.photoItem.height)];
    CGFloat y = [LFFit fitOrigin:h max:sh];
    self.imageView.frame = CGRectMake(x, y, w, h);
    self.scrollView.contentSize = CGSizeMake(0, h);
}

- (IBAction)back:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)save:(id)sender
{
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (status == PHAuthorizationStatusDenied) {
                [LFNotification autoHideWithText:@"您已经拒绝我们访问相册了，请先设置"];
            }else if (status == PHAuthorizationStatusAuthorized) {
                [self saveImage];
            }
        });
    }];
}

- (void)saveImage
{
    
    //    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
    //        [PHAssetChangeRequest creationRequestForAssetFromImage:self.imageView.image];
    //    } completionHandler:^(BOOL success, NSError * _Nullable error) {
    //
    //    }];
    
    __block PHObjectPlaceholder *placeholder;
    NSError *error;
    [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
        placeholder = [PHAssetChangeRequest creationRequestForAssetFromImage:self.imageView.image].placeholderForCreatedAsset;
    } error:&error];
    
    if (!error) {
        [LFNotification autoHideWithText:@"保存成功"];
    }else {
        [LFNotification autoHideWithText:error.domain];
    }
    
    NSString *title = [NSBundle mainBundle].infoDictionary[(__bridge NSString *)kCFBundleNameKey];
    PHFetchResult<PHAssetCollection *> *assetCollections = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    PHAssetCollection *collection = nil;
    for (PHAssetCollection * obj in assetCollections) {
        if ([obj.localizedTitle isEqualToString:title]) {
            collection = obj;
            break;
        }
    }
    
    if (collection == nil) {
        __block NSString *localIdentifier = nil;
        [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
            localIdentifier =  [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:title].placeholderForCreatedAssetCollection.localIdentifier;
        } error:nil];
        collection = [PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:@[localIdentifier] options:nil].firstObject;
    }
    
    [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
        PHAssetCollectionChangeRequest *request = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:collection];
        [request insertAssets:@[placeholder] atIndexes:[NSIndexSet indexSetWithIndex:0]];
    } error:nil];
    
}

#pragma mark -
#pragma mark - UIScrollViewDelegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

@end
