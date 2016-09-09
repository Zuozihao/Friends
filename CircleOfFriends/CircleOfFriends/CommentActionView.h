//
//  CommentActionView.h
//  CircleOfFriends
//
//  Created by 左梓豪 on 16/8/30.
//  Copyright © 2016年 左梓豪. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CommentActionViewDelegate <NSObject>

- (void)supportButtonPressed:(UIButton *)supportButton;

- (void)newCommentButtonPressed;

@end

@interface CommentActionView : UIView

@property(nonatomic, strong) UIButton *likeButton;

@property(nonatomic, strong) UIButton *commentButton;

@property (nonatomic, assign, getter = isShowing) BOOL show;

@property (nonatomic, weak) id<CommentActionViewDelegate> delegate;

@end
