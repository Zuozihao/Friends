//
//  CircleOfFriendsData.m
//  CircleOfFriends
//
//  Created by 左梓豪 on 16/8/17.
//  Copyright © 2016年 左梓豪. All rights reserved.
//

#import "CircleOfFriendsData.h"

@implementation CircleOfFriendsData

- (CGFloat)height {
    
    _height = [self getLikeUserArrayHeight];
    
    switch (self.type) {
            
        case ContentOnly:
            _height += [self getContentOnlyHeight];
            break;
            
        case ContentWithImages:
            _height += [self getContentWithImagesHeight];
            break;
            
        case ContentWithShare:
            _height += [self getContentWithShareHeight];
            break;
            
        case ImageOnly:
            _height += [self getImageOnlyHeight];
            break;
            
        case ShareOnly:
            _height += [self getShareOnlyHeight];
            break;
            
        default:
            return 400;
            break;
    }
    return _height;
}

- (CGFloat)getContentOnlyHeight {
    CGFloat height = [self getContentHeight];
    height = [self getSomeNeedHeightWithHeight:height];
    
    return height;
}

- (CGFloat)getContentWithImagesHeight {

    CGFloat height = [self getContentHeight];
    height = [self getSomeNeedHeightWithHeight:height];
    
    NSInteger imageCount = self.imageArray.count;
    
    if (imageCount == 1) {
        height += 100;
    } else {
        NSInteger row = (imageCount-1)/3 + 1;
        height += (kAppScreenWidth - 60 - 30)/3*row;
    }
    
    height += 10;//预留空隙
    
    return height;
}

- (CGFloat)getContentWithShareHeight {
    CGFloat height = [self getContentHeight];
     height = [self getSomeNeedHeightWithHeight:height];
    
    height += 50;
    return height;
}

- (CGFloat)getImageOnlyHeight {
    CGFloat height = [self getContentHeight];
    height = [self getSomeNeedHeightWithHeight:height];
    height += 100;
    
    return height;
}

- (CGFloat)getShareOnlyHeight {
    CGFloat height = [self getContentHeight];
    height = [self getSomeNeedHeightWithHeight:height];
    
    height += 40;
    return height;
}

- (CGFloat)getContentHeight {
    UIFont *font = [UIFont systemFontOfSize:12];
    CGSize size = CGSizeMake(kAppScreenWidth - 25,2000);//设置一个上限
    CGSize labelsize = [self.content sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
    CGFloat height = labelsize.height;
    return height;
}

- (CGFloat)getSomeNeedHeightWithHeight:(CGFloat)height {
    height = height + 60;  //头像
    if (self.place.length > 0) {
        height += 15; //定位
    }            
    height += 40;    //时间,评论按钮
    for (int i = 0; i < self.commentArray.count; i++) {
        CommentData *data = self.commentArray[i];
        height += (data.height+7);
    }
    return height;
}

- (CGFloat)getLikeUserArrayHeight {
    NSMutableString *mutableString = [[NSMutableString alloc] initWithString:@"❤  "];
    if (self.likeUserArray.count >0) {
        for (int i = 0; i < self.likeUserArray.count; i ++) {
            [mutableString appendString:self.likeUserArray[i]];
            if (i != self.likeUserArray.count - 1) {
                [mutableString appendString:@",  "];
            }
        }
        UIFont *font = [UIFont systemFontOfSize:12];
        CGSize size = CGSizeMake(kAppScreenWidth - 25 - 60 - 120,2000);//设置一个上限
        CGSize labelsize = [mutableString sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];
        CGFloat height = labelsize.height;
        return height + 15;
    }
    return 0;
}

@end
