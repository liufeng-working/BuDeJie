//
//  LFTagCell.m
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/8.
//  Copyright © 2017年 liufeng. All rights reserved.
//

#import "LFTagCell.h"
#import "LFTagItem.h"

@interface LFTagCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameL;
@property (weak, nonatomic) IBOutlet UILabel *subCountL;
@property (weak, nonatomic) IBOutlet UIButton *subBtn;

@end

@implementation LFTagCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.iconView.layer.cornerRadius = 30;
    self.iconView.layer.masksToBounds = YES;
}

- (void)setTagItem:(LFTagItem *)tagItem
{
    _tagItem = tagItem;
    
    [self.iconView sd_setImageWithURL:tagItem.image_list placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.nameL.text = tagItem.theme_name;
    self.subCountL.text = [NSString stringWithFormat:@"%@人订阅", tagItem.sub_number];
    self.subBtn.selected = tagItem.is_sub;
}

#pragma mark -
#pragma mark - 订阅
- (IBAction)sub:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.tagItem.is_sub = sender.selected;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
}

@end
