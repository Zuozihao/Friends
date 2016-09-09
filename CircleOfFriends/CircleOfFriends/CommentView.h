//
//  CommentView.h
//  CircleOfFriends
//
//  Created by 左梓豪 on 16/8/18.
//  Copyright © 2016年 左梓豪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentView : UIView

@property(nonatomic, strong)NSArray *commentArray;

@property(nonatomic, strong)NSArray *likeUserArray;

@property(nonatomic, strong)UITableView *commentTableView;

- (void)setCommentArray:(NSArray *)commentArray
          likeUserArray:(NSArray *)likeUserArray
              indexPath:(NSIndexPath *)indexPath;


@end
