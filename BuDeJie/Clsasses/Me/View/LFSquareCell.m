//
//  LFSquareCell.m
//  BuDeJie
//
//  Created by 刘丰 on 2017/8/9.
//  Copyright © 2017年 liufeng. All rights reserved.
//

#import "LFSquareCell.h"
#import "LFSquareItem.h"

@interface LFSquareCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *nameL;

@end

@implementation LFSquareCell

- (void)setSquareItem:(LFSquareItem *)squareItem
{
    _squareItem = squareItem;
    
    [self.iconView sd_setImageWithURL:squareItem.icon];
    self.nameL.text = squareItem.name;
}

@end
