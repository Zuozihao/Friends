//
//  MutiImageView.m
//  CircleOfFriends
//
//  Created by 左梓豪 on 16/8/29.
//  Copyright © 2016年 左梓豪. All rights reserved.
//

#import "MutiImageView.h"
#import <UIImageView+WebCache.h>
#import "ZoomingImageView.h"

static CGFloat itemWidth;
@implementation MutiImageView

-(void)dealloc {
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}

- (id)initWithImageUrlArray:(NSArray *)imageUrlArray
                      frame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        itemWidth = (self.frame.size.width - 20) / 3;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        itemWidth = (self.frame.size.width - 20) / 3;
    }
    return self;

}

- (void)setImageUrlArray:(NSArray *)imageUrlArray {
    _imageUrlArray = imageUrlArray;
    NSInteger count = imageUrlArray.count;
    for (int i = 0; i < count; i++) {
        ZoomingImageView *imageView = [[ZoomingImageView alloc] init];
        imageView.clipsToBounds = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.frame = CGRectMake((i%3)*(10 + itemWidth), itemWidth * (i/3) + 10*(i/3), itemWidth, itemWidth);
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageUrlArray[i]]];
        [self addSubview:imageView];
    }
}

@end
