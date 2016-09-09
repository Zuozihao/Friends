//
//  CircleOfFreindsCell.h
//  CircleOfFriends
//
//  Created by 左梓豪 on 16/8/17.
//  Copyright © 2016年 左梓豪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentActionView.h"

@class CircleOfFriendsData;
@class CommentView;

@interface CircleOfFreindsCell : UITableViewCell<UIScrollViewDelegate,CommentActionViewDelegate>

//一条朋友圈的数据
@property(nonatomic, strong)CircleOfFriendsData *data;

@property(nonatomic, strong)CommentView *commentView;

- (void)setData:(CircleOfFriendsData *)data
      indexPath:(NSIndexPath *)indexPath;

@end
