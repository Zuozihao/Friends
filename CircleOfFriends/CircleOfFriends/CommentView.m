//
//  CommentView.m
//  CircleOfFriends
//
//  Created by 左梓豪 on 16/8/18.
//  Copyright © 2016年 左梓豪. All rights reserved.
//

#import "CommentView.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "CommentCell.h"
#import "VirtualComment.h"
#import "UIView+ViewController.h"

@interface CommentView ()<UITableViewDelegate, UITableViewDataSource>


@end

@implementation CommentView {
    NSIndexPath *_indexPath;
    NSArray     *_likeUserArray;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGB(235, 235, 235);
        [self addSubview:self.commentTableView];
    }
    return self;
}


- (UITableView *)commentTableView {
    if (_commentTableView == nil) {
        _commentTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStylePlain];
        _commentTableView.scrollEnabled = NO;
        _commentTableView.dataSource = self;
        _commentTableView.delegate = self;
        [_commentTableView registerClass:[CommentCell class] forCellReuseIdentifier:@"commentCell"];
        _commentTableView.separatorColor = [UIColor clearColor];
    }
    return _commentTableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_likeUserArray.count > 0) {
        return self.commentArray.count + 1;
    }
    return self.commentArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commentCell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[CommentCell alloc] init];
    }
    
    if (_likeUserArray.count > 0) {
        if (indexPath.row == 0) {
            cell.likeUserArray = _likeUserArray;
        } else {
            cell.data = self.commentArray[indexPath.row - 1];
        }
    } else {
        cell.data = self.commentArray[indexPath.row];
    }
    
    cell.backgroundColor = RGB(215, 215, 215);
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGRect frame = self.frame;
    frame.size.height = tableView.contentSize.height;
    self.frame = frame;
    _commentTableView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    CommentData *data;
    if (_likeUserArray.count > 0) {
        if (indexPath.row == 0) {
            NSMutableString *mutableString = [[NSMutableString alloc] initWithString:@"❤  "];
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
            
            return height + 10;
        } else {
            data = self.commentArray[indexPath.row - 1];
        }
    } else {
        data = self.commentArray[indexPath.row];
    }
    
    CGFloat height = data.height;
    
    return height + 7;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_likeUserArray.count > 0) {
        if (indexPath.row == 0) {
            return;
        } else {
            CommentData *data = self.commentArray[indexPath.row - 1];
            NSString *userID = data.commentFromUserID;
            
            NSDictionary *dic = @{@"name":userID,@"indexPath":_indexPath};
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"newComment" object:dic];
            NSLog(@"selected");

        }
    } else {
    
        CommentData *data = self.commentArray[indexPath.row];
        NSString *userID = data.commentFromUserID;
    
        NSDictionary *dic = @{@"name":userID,@"indexPath":_indexPath};
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"newComment" object:dic];
        NSLog(@"selected");
    }
}

- (void)setCommentArray:(NSArray *)commentArray
          likeUserArray:(NSArray *)likeUserArray
              indexPath:(NSIndexPath *)indexPath {
    
    _commentArray = commentArray;
    
    _likeUserArray = likeUserArray;
    
    if (indexPath != nil) {
       _indexPath = indexPath;
    }
    
    [_commentTableView reloadData];
}


@end
