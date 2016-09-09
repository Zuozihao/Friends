//
//  CircleOfFriendsData.h
//  CircleOfFriends
//
//  Created by 左梓豪 on 16/8/17.
//  Copyright © 2016年 左梓豪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommentData.h"

typedef NS_ENUM(NSInteger, CircleOfFriendsType) {
    ContentOnly = 0,
    ContentWithImages,
    ContentWithShare,
    ImageOnly,
    ShareOnly,
};

@interface CircleOfFriendsData : NSObject

@property(nonatomic, copy)     NSString             *avatarUrlString;
@property(nonatomic, copy)     NSString             *content;
@property(nonatomic, copy)     NSString             *userID;
@property(nonatomic, copy)     NSString             *place;
@property(nonatomic, copy)     NSString             *sendTime;
@property(nonatomic, strong)   NSArray              *imageArray;
@property(nonatomic, assign)   CircleOfFriendsType  type;
@property(nonatomic, strong)   NSArray              *commentArray;//评论
@property(nonatomic, strong)   NSArray              *likeUserArray;//点赞的用户
@property(nonatomic, assign)   CGFloat              height;

@end
