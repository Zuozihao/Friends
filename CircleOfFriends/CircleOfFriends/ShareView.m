//
//  ShareView.m
//  CircleOfFriends
//
//  Created by 左梓豪 on 16/8/18.
//  Copyright © 2016年 左梓豪. All rights reserved.
//

#import "ShareView.h"

@interface ShareView ()

@property(nonatomic, strong) UIImageView *logoView;
@property(nonatomic, strong) UILabel     *introductionLabel;

@end

@implementation ShareView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGB(235, 235, 235);
        [self addSubview:self.logoView];
        [self addSubview:self.introductionLabel];
    }
    return self;
}

- (UIImageView *)logoView {
    if (_logoView == nil) {
        _logoView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, self.frame.size.height - 10, self.frame.size.height - 10)];
        _logoView.contentMode = UIViewContentModeScaleAspectFill;
        _logoView.clipsToBounds = YES;
        _logoView.image = [UIImage imageNamed:@"head.jpg"];
    }
    return _logoView;
}

- (UILabel *)introductionLabel {
    if (_introductionLabel == nil) {
        _introductionLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_logoView.frame)+8, 0, self.frame.size.width - self.frame.size.height - 20, self.frame.size.height)];
        _introductionLabel.numberOfLines = 0;
        _introductionLabel.text = @"朋友圈疯传的东西是什么,到底是什么?";
        _introductionLabel.font = [UIFont systemFontOfSize:12];
    }
    return _introductionLabel;
}

@end
