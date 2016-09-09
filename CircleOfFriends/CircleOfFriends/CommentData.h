//
//  CommentData.h
//  CircleOfFriends
//
//  Created by 左梓豪 on 16/8/17.
//  Copyright © 2016年 左梓豪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentData : NSObject

@property(nonatomic, copy) NSString *commentFromUserID;
@property(nonatomic, copy) NSString *commentToUserID;
@property(nonatomic, copy) NSString *commentContent;
@property(nonatomic, copy) NSString *commentTime;
@property(nonatomic, assign) CGFloat height;

@end
