//
//  CommentCell.m
//  CircleOfFriends
//
//  Created by 左梓豪 on 16/8/29.
//  Copyright © 2016年 左梓豪. All rights reserved.
//

#import "CommentCell.h"
#import <YYText.h>
#import <SVProgressHUD.h>

@interface CommentCell ()

@end

@implementation CommentCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.commetLabel];
    }
    return self;
}

- (YYLabel *)commetLabel {
    if (_commetLabel == nil) {
        _commetLabel = [[YYLabel alloc] initWithFrame:CGRectMake(5, 5, kAppScreenWidth - 25 - 8 - 40 - 15, 0)];
        _commetLabel.numberOfLines = 0;
        _commetLabel.lineBreakMode = NSLineBreakByWordWrapping;
    }
    return _commetLabel;
}

- (void)setData:(CommentData *)data {
    _data = data;
    
    CGRect frame = _commetLabel.frame;
    frame.size.height = data.height;
    _commetLabel.frame = frame;
    
    NSString *content;
    if (data.commentToUserID.length == 0) {
        content = [NSString stringWithFormat:@"%@: %@",data.commentFromUserID,data.commentContent];
    }
    
    else {
        content = [NSString stringWithFormat:@"%@ 回复 %@: %@",data.commentFromUserID,data.commentToUserID,data.commentContent];
    }

    
    NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:content];
    one.yy_font = [UIFont systemFontOfSize:12];
    
    [one yy_setTextHighlightRange:NSMakeRange(0, data.commentFromUserID.length)
                            color:RGB(79, 97, 132)
                  backgroundColor:nil
                        tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                            [SVProgressHUD showInfoWithStatus:data.commentFromUserID];
                        }];
    
    if (data.commentToUserID.length > 0) {
        [one yy_setTextHighlightRange:NSMakeRange(data.commentFromUserID.length + 4, data.commentToUserID.length)
                                color:RGB(79, 97, 132)
                      backgroundColor:nil
                            tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                                [SVProgressHUD showInfoWithStatus:data.commentToUserID];
                            }];
    }
    
    
    if (data.commentToUserID.length == 0) {
        _commetLabel.attributedText = one;
    } else {
        _commetLabel.attributedText = one;
    }
}

- (void)setLikeUserArray:(NSArray *)likeUserArray {
    _likeUserArray = likeUserArray;
     NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"❤  "];
    for (int i = 0; i < likeUserArray.count; i++) {
        NSInteger lenth = one.length;
        NSAttributedString *user = [[NSAttributedString alloc] initWithString:likeUserArray[i]];
        
        [one appendAttributedString:user];
        [one yy_setTextHighlightRange:NSMakeRange(lenth, user.length)
                                color:RGB(79, 97, 132)
                      backgroundColor:nil
                            tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                                [SVProgressHUD showInfoWithStatus:user.string];
                            }];
        if (i != likeUserArray.count - 1) {
            [one yy_appendString:@",  "];
        }
    
    }
    
    one.yy_font = [UIFont systemFontOfSize:12];
    _commetLabel.attributedText = one;
    
    NSString *allUser = one.string;
    
    UIFont *font = [UIFont systemFontOfSize:12];
    CGSize size = CGSizeMake(kAppScreenWidth - 25 - 60 - 120,2000);//设置一个上限
    CGSize labelsize = [allUser sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];
    CGFloat height = labelsize.height;
    
    CGRect frame = _commetLabel.frame;
    frame.size.height = height;
    _commetLabel.frame = frame;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
