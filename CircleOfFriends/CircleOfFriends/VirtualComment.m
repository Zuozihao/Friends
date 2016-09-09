//
//  VirtualComment.m
//  CircleOfFriends
//
//  Created by 左梓豪 on 16/8/29.
//  Copyright © 2016年 左梓豪. All rights reserved.
//

#import "VirtualComment.h"
#import "CommentData.h"

@implementation VirtualComment

+ (NSArray *)getVitualComment {
    CommentData *data0 = [[CommentData alloc] init];
    data0.commentFromUserID = @"牧濑红莉栖";
    data0.commentToUserID = @"";
    data0.commentContent = @"这一切都是命运石之门的选择.作品于2011年5月号在讲谈社发行的杂志《月刊少年Magazine》上开始连载，至2015年3月号完结，单行本共发行11卷。截止2016年2月，作品销量突破400万册[4]  。在完结一年左右后较外传性质的Coda短篇集于2016年8月17日发售，讲述角色们过去和以后的故事，全5话。[5]  同时也被收录在动画《四月是你的谎言》Blu-ray和DVD中.";
    
    CommentData *data1 = [[CommentData alloc] init];
    data1.commentFromUserID = @"本间芽衣子";
    data1.commentToUserID = @"";
    data1.commentContent = @"( ⊙ o ⊙ )！,被找到了.";
    
    CommentData *data2 = [[CommentData alloc] init];
    data2.commentFromUserID = @"本间芽衣子";
    data2.commentToUserID = @"牧濑红莉栖";
    data2.commentContent = @"在这里打破次元壁.";
    
    CommentData *data3 = [[CommentData alloc] init];
    data3.commentFromUserID = @"iFox";
    data3.commentToUserID = @"";
    data3.commentContent = @"今天在这里遇见了你 明天你会在哪里";
    
    CommentData *data4 = [[CommentData alloc] init];
    data4.commentFromUserID = @"赤瞳";
    data4.commentToUserID = @"";
    data4.commentContent = @"斩.赤红之瞳.";
    
    NSArray *commentArray = @[data0,data1,data2,data3];
    
    return commentArray;
}

@end
