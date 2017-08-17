//
//  LFTopicItem.m
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/12.
//  Copyright © 2017年 liufeng. All rights reserved.
//

#import "LFTopicItem.h"

static CGFloat const margin = 10;
@implementation LFTopicItem
@synthesize cellHeight = _cellHeight;

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"top_cmt": [LFCommentItem class]
             };
}

- (CGFloat)cellHeight
{
    if (_cellHeight > 0) { return _cellHeight; }
    
    _cellHeight += margin;
    _cellHeight += 40;
    _cellHeight += margin;
    
    CGFloat contentW = kWidth - 2*margin;
    if (self.text.length) {
        _cellHeight += [self.text boundingRectWithSize:CGSizeMake(contentW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17]} context:nil].size.height;
        _cellHeight += margin;
    }
    
    if (self.height > 0 && self.width > 0) {
        CGFloat extraH = [LFFit fitHeightForWidth:contentW originSize:CGSizeMake(self.width, self.height)];
        if (extraH >= kHeight && !self.is_gif) {
            extraH = 300;
            _is_longPhoto = YES;
        }
        _extraViewF = CGRectMake(margin, self.cellHeight, contentW, extraH);
        _cellHeight += extraH;
        _cellHeight += margin;
    }
    
    
    if (self.top_cmt.count) {
        _cellHeight += 21;
        _cellHeight += 5;
        _cellHeight += [self.top_cmt.firstObject.content boundingRectWithSize:CGSizeMake(contentW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15]} context:nil].size.height;
    }
    
    _cellHeight += 1;
    _cellHeight += 35;
    _cellHeight += margin;
    
    return _cellHeight;
}

@end
