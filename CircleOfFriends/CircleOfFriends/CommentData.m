//
//  CommentData.m
//  CircleOfFriends
//
//  Created by 左梓豪 on 16/8/17.
//  Copyright © 2016年 左梓豪. All rights reserved.
//

#import "CommentData.h"

@implementation CommentData

- (CGFloat)height {
    NSString *content;
    
    if (self.commentToUserID.length == 0) {
        content = [NSString stringWithFormat:@"%@: %@",self.commentFromUserID,self.commentContent];
    } else {
        content = [NSString stringWithFormat:@"%@ 回复 %@: %@",self.commentFromUserID,self.commentToUserID,self.commentContent];
    }
    
//    NSString *content = self.commentContent;
    UIFont *font = [UIFont systemFontOfSize:12];
    CGSize size = CGSizeMake(kAppScreenWidth - 25 - 8 - 40 - 15,2000);//设置一个上限
    CGSize contentSize = [content sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
    return contentSize.height;
}

@end
