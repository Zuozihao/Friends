//
//  CommentCell.h
//  CircleOfFriends
//
//  Created by 左梓豪 on 16/8/29.
//  Copyright © 2016年 左梓豪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentData.h"
#import <YYLabel.h>

@interface CommentCell : UITableViewCell

@property (nonatomic, strong) CommentData *data;

@property (nonatomic, strong) YYLabel *commetLabel;

@property (nonatomic, strong) NSArray *likeUserArray;

@end
