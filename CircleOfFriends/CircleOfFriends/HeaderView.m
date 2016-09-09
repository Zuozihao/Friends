//
//  HeaderView.m
//  CircleOfFriends
//
//  Created by 左梓豪 on 16/8/17.
//  Copyright © 2016年 左梓豪. All rights reserved.
//

#import "HeaderView.h"

#define kAvatarHeight 70.0f
#define kBottomHeight 25.0f
#define kHeaderWidth  self.frame.size.width
#define kHeaderHeight self.frame.size.height

@interface HeaderView ()

@property(nonatomic, strong)UIImageView *backImageView;
@property(nonatomic, strong)UIImageView *avatarView;
@property(nonatomic, strong)UILabel *nickNameLabel;

@end

@implementation HeaderView

- (id)initWithBackGroundImageUrlString:(NSString *)backGroundUrlString
                       avatarUrlString:(NSString *)avatarUrlString
                                 frame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.backImageView];
        [self addSubview:self.avatarView];
        [self addSubview:self.nickNameLabel];
    }
    return self;
}

- (UIImageView *)backImageView {
    if (_backImageView == nil) {
        _backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kHeaderWidth, kHeaderHeight - kBottomHeight)];
        _backImageView.contentMode = UIViewContentModeScaleAspectFill;
        _backImageView.clipsToBounds = YES;
        _backImageView.image = [UIImage imageNamed:@"back.jpg"];
    }
    return _backImageView;
}

- (UIImageView *)avatarView {
    if (_avatarView == nil) {
        _avatarView = [[UIImageView alloc] initWithFrame:CGRectMake(kHeaderWidth - kAvatarHeight - 10, kHeaderHeight - kAvatarHeight, kAvatarHeight, kAvatarHeight)];
        _avatarView.contentMode = UIViewContentModeScaleAspectFill;
        _avatarView.clipsToBounds = YES;
        _avatarView.layer.borderColor = [UIColor whiteColor].CGColor;
        _avatarView.layer.borderWidth = 2.0f;
        _avatarView.image = [UIImage imageNamed:@"avatar.png"];
    }
    return _avatarView;
}

- (UILabel *)nickNameLabel {
    if (_nickNameLabel == nil) {
        _nickNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, kHeaderHeight - kBottomHeight - 30, kHeaderWidth - kAvatarHeight - 10 - 30, 30)];
        _nickNameLabel.textColor = [UIColor whiteColor];
        _nickNameLabel.font = [UIFont boldSystemFontOfSize:16];
        _nickNameLabel.textAlignment = NSTextAlignmentRight;
        _nickNameLabel.shadowColor = [UIColor blackColor];
        _nickNameLabel.shadowOffset = CGSizeMake(0.5, 0.5);
        _nickNameLabel.text = @"南小鸟";
    }
    return _nickNameLabel;
}

@end
