//
//  CircleOfFreindsCell.m
//  CircleOfFriends
//
//  Created by 左梓豪 on 16/8/17.
//  Copyright © 2016年 左梓豪. All rights reserved.
//

#import "CircleOfFreindsCell.h"
#import "CircleOfFriendsData.h"
#import "CommentView.h"
#import "ShareView.h"
#import "ZoomingImageView.h"
#import <UIImageView+WebCache.h>
#import "MutiImageView.h"
#import <Masonry.h>

#define kAvatarWidth 40.0f
#define kImageHeight 100.0f

@implementation CircleOfFreindsCell {
    UIImageView         *_avatarImageView;
    UILabel             *_nickNameLabel;
    UILabel             *_contentLabel;//这里暂时用label
    ZoomingImageView    *_imageView;
    UILabel             *_placeLabel;
    UILabel             *_timeLabel;
    ShareView           *_shareView;
    UIScrollView        *_backgroundView;
    UIImageView         *_commetButton;
    MutiImageView       *_mutiImageView;
    UIGestureRecognizer *_commentAction;
    CommentActionView   *_commentActionView;
    NSInteger           _row;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(newCommentAction) name:@"newComment" object:nil];
    }
    return self;
}

- (void)initView {
    if (_avatarImageView == nil) {
     _avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 10, kAvatarWidth, kAvatarWidth)];
    }
    _avatarImageView.contentMode = UIViewContentModeScaleAspectFill;
    _avatarImageView.image = [UIImage imageNamed:@"head.jpg"];
    _avatarImageView.clipsToBounds = YES;
    [self.contentView addSubview:_avatarImageView];
    
    if (_nickNameLabel == nil) {
        _nickNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_avatarImageView.frame) + 10, CGRectGetMinY(_avatarImageView.frame), kAppScreenHeight - kAvatarWidth - 50, 15)];
    }
    _nickNameLabel.textColor = RGB(79, 97, 132);
    _nickNameLabel.font = [UIFont boldSystemFontOfSize:11];
    _nickNameLabel.shadowOffset = CGSizeMake(0.3f, 0.3f);
    _nickNameLabel.shadowColor = [UIColor whiteColor];
    _nickNameLabel.text = @"初音ミク";
    [self.contentView addSubview:_nickNameLabel];
    
    if (_contentLabel == nil) {
           _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(_nickNameLabel.frame), CGRectGetMaxY(_nickNameLabel.frame) + 5, kAppScreenWidth - 25 - _nickNameLabel.frame.origin.x, 0)];
    }
    _contentLabel.font = [UIFont systemFontOfSize:12];
    _contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _contentLabel.numberOfLines = 0;
    NSString *content = @"初音未来（初音ミク/Hatsune Miku），是2007年8月31日由CRYPTON FUTURE MEDIA以Yamaha的VOCALOID系列语音合成程序为基础开发的音源库，音源数据资料采样于日本声优藤田咲.";
    [self constraintContent:content];
    [self.contentView addSubview:_contentLabel];
    
    if (_shareView == nil) {
        _shareView = [[ShareView alloc] initWithFrame:CGRectMake(_contentLabel.frame.origin.x, CGRectGetMaxY(_contentLabel.frame)+5, _contentLabel.frame.size.width, 50)];
    }
    _shareView.hidden = YES;
    [self.contentView addSubview:_shareView];
    
    if (_mutiImageView == nil) {
        _mutiImageView = [[MutiImageView alloc] initWithFrame:CGRectMake(_contentLabel.frame.origin.x,CGRectGetMaxY(_contentLabel.frame)+5 ,  _contentLabel.frame.size.width, 0)];
    }
    _mutiImageView.hidden = YES;
    [self.contentView addSubview:_mutiImageView];
    
    UIImage *image = [UIImage imageNamed:@"Miku.jpg"];
    CGSize imageSize = image.size;
    if (_imageView == nil) {
        _imageView = [[ZoomingImageView alloc] initWithFrame:CGRectZero];
    }
    if (imageSize.width > imageSize.height) {
        _imageView.frame = CGRectMake(CGRectGetMinX(_contentLabel.frame), CGRectGetMaxY(_contentLabel.frame) + 5, kImageHeight * (imageSize.width/imageSize.height), kImageHeight);
    } else {
        _imageView.frame = CGRectMake(CGRectGetMinX(_contentLabel.frame), CGRectGetMaxY(_contentLabel.frame) + 5, kImageHeight, kImageHeight * (imageSize.height/imageSize.width));
    }
    _imageView.image = image;
    [self.contentView addSubview:_imageView];
    
    if (_placeLabel ==nil) {
      _placeLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(_contentLabel.frame), CGRectGetMaxY(_imageView.frame), 0, 0)];
    }
    _placeLabel.font = [UIFont systemFontOfSize:12];
    _placeLabel.textColor = RGB(79, 97, 132);
    [self.contentView addSubview:_placeLabel];
    
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(_contentLabel.frame), CGRectGetMaxY(_placeLabel.frame)+8, 200, 10)];
    }
    _timeLabel.font = [UIFont systemFontOfSize:10];
    _timeLabel.textColor = [UIColor grayColor];
    _timeLabel.text = @"昨天";
    [self.contentView addSubview:_timeLabel];
    
    if (_commetButton == nil) {
        _commetButton = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_contentLabel.frame) - 40, CGRectGetMinY(_timeLabel.frame), 40, 30)];
    }
    _commetButton.image = [UIImage imageNamed:@"AlbumOperateMore"];
    _commetButton.contentMode = UIViewContentModeScaleAspectFit;
    _commetButton.userInteractionEnabled = YES;
    [self.contentView addSubview:_commetButton];
    
    if (_commentView == nil) {
        _commentView = [[CommentView alloc] initWithFrame:CGRectMake(CGRectGetMinX(_contentLabel.frame), CGRectGetMaxY(_timeLabel.frame)+10, _contentLabel.frame.size.width, 0)];
    }
    [self.contentView addSubview:_commentView];
    
    if (_commentAction == nil) {
        _commentAction = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showCommentActionView)];
    }
    [_commetButton addGestureRecognizer:_commentAction];
    
    if (_commentActionView == nil) {
        _commentActionView = [[CommentActionView alloc] initWithFrame:CGRectMake(CGRectGetMinX(_commetButton.frame) - 80, CGRectGetMinY(_commetButton.frame), 80, _commetButton.frame.size.height)];
    }
    [self.contentView addSubview:_commentActionView];
    _commentActionView.delegate = self;
    
    [_commentActionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_commetButton.mas_left).offset(0);
        make.centerY.equalTo(_commetButton);
        make.height.equalTo(@(_commetButton.frame.size.height));

    }];
}

#pragma mark - Notification

- (void)newCommentAction {
    _commentActionView.show = NO;
}

#pragma mark - TapActions

- (void)showCommentActionView {
    _commentActionView.show = !_commentActionView.show;
    
}

#pragma mark - CommentActionViewDelegate

- (void)supportButtonPressed:(UIButton *)supportButton {
    
    if (!supportButton.selected) {
        NSLog(@"取消赞");
        NSMutableArray *array =  [[NSMutableArray alloc] initWithArray:self.data.likeUserArray];
        [array removeLastObject];
        _data.likeUserArray = [array copy];
        
    } else {
        NSLog(@"赞");
        NSMutableArray *array =  [[NSMutableArray alloc] initWithArray:self.data.likeUserArray];
        [array addObject:@"南小鸟"];
        _data.likeUserArray = [array copy];
        
    }
    
    NSDictionary *dic = @{@"data":_data, @"row":@(_row)};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NewLikeAction" object:dic];
}

- (void)newCommentButtonPressed {
    NSLog(@"评论");
    NSLog(@"%ld",_row);
    NSDictionary *dic = @{@"name":@"",@"row":@(_row)};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"newComment" object:dic];
}

#pragma mark - Data

- (void)setData:(CircleOfFriendsData *)data
      indexPath:(NSIndexPath *)indexPath {
    _data = data;
    _row = indexPath.row;
    
    if (data.likeUserArray.count > 0) {
        for (NSString *name in data.likeUserArray) {
            if ([name isEqualToString:@"南小鸟"]) {
                _commentActionView.likeButton.selected = YES;
                break;
            }
        }
    }
    
    
    [_commentView setCommentArray:data.commentArray likeUserArray:data.likeUserArray indexPath:indexPath];
    [self setAvatarWithUrlString:_data.avatarUrlString];
    [self setUserIDWithString:_data.userID];
    switch (data.type) {
        case ContentOnly:
            [self setContentOnlyFrame];
            break;
            
        case ContentWithImages:
            [self setContentWithImagesFrame];
            break;
            
        case ContentWithShare:
            [self setContentWithShareFrame];
            break;
            
        case ImageOnly:
            [self setImageOnlyFrame];
            break;
            
        case ShareOnly:
            [self setShareOnlyFrame];
            break;
            
        default:
            break;
    }
}

#pragma mark - ResetFrame

- (void)setContentOnlyFrame {
    
    [self constraintContent:_data.content];
    _imageView.frame = CGRectMake(CGRectGetMinX(_contentLabel.frame), CGRectGetMaxY(_contentLabel.frame) + 5, kImageHeight * 0, 0);
    [self constraintPlaceWithFrame:_imageView.frame];
    [self constraintSomeFrame];
}

- (void)setContentWithImagesFrame {
    
    [self constraintContent:_data.content];
    if (_data.imageArray.count == 1) {
        NSURL *url = [NSURL URLWithString:_data.imageArray.firstObject];
        [_imageView sd_setImageWithURL:url completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            CGSize imageSize = image.size;
            if (imageSize.width > imageSize.height) {
                _imageView.frame = CGRectMake(CGRectGetMinX(_contentLabel.frame), CGRectGetMaxY(_contentLabel.frame) + 5, kImageHeight * (imageSize.width/imageSize.height), kImageHeight);
            } else {
                _imageView.frame = CGRectMake(CGRectGetMinX(_contentLabel.frame), CGRectGetMaxY(_contentLabel.frame) + 5, kImageHeight, kImageHeight * (imageSize.height/imageSize.width));
            }
            [self constraintPlaceWithFrame:_imageView.frame];
            [self constraintSomeFrame];
        }];

    } else {
        _mutiImageView.hidden = NO;
        _imageView.hidden = YES;
        _mutiImageView.frame = CGRectMake(CGRectGetMinX(_contentLabel.frame), CGRectGetMaxY(_contentLabel.frame)+5, _contentLabel.frame.size.width, (_contentLabel.frame.size.width - 20)/3 * (((_data.imageArray.count -1)/3)+1)+15);
        _mutiImageView.imageUrlArray = _data.imageArray;
        [self constraintPlaceWithFrame:_mutiImageView.frame];
        [self constraintSomeFrame];
    }
}

- (void)setContentWithShareFrame {
    [self constraintContent:_data.content];
    _imageView.hidden = YES;
    _shareView.hidden = NO;
    [self constraintShareViewFrame];
    [self constraintPlaceWithFrame:_shareView.frame];
    [self constraintSomeFrame];
}

- (void)setImageOnlyFrame {
    _shareView.hidden = YES;
    [self constraintContent:@""];
    NSURL *url = [NSURL URLWithString:_data.imageArray.firstObject];
    [_imageView sd_setImageWithURL:url completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        CGSize imageSize = image.size;
        if (imageSize.width > imageSize.height) {
            _imageView.frame = CGRectMake(CGRectGetMinX(_contentLabel.frame), CGRectGetMaxY(_contentLabel.frame) + 5, kImageHeight * (imageSize.width/imageSize.height), kImageHeight);
        } else {
            _imageView.frame = CGRectMake(CGRectGetMinX(_contentLabel.frame), CGRectGetMaxY(_contentLabel.frame) + 5, kImageHeight, kImageHeight * (imageSize.height/imageSize.width));
        }
        [self constraintPlaceWithFrame:_imageView.frame];
        [self constraintSomeFrame];
    }];
}

- (void)setShareOnlyFrame {
    _shareView.hidden = NO;
    [self constraintContent:@""];
    [self constraintShareViewFrame];
    _imageView.frame = CGRectMake(CGRectGetMinX(_contentLabel.frame), CGRectGetMaxY(_contentLabel.frame) + 5, kImageHeight * 0, 0);
    [self constraintPlaceWithFrame:_shareView.frame];
    [self constraintSomeFrame];
}

- (void)setAvatarWithUrlString:(NSString *)urlString {
    [_avatarImageView sd_setImageWithURL:[NSURL URLWithString:urlString]];
}

- (void)setUserIDWithString:(NSString *)ID {
    _nickNameLabel.text = ID;
}

#pragma mark - SetConstraint

- (void)constraintContent:(NSString *)content {
    if (content.length > 0) {
        UIFont *font = [UIFont systemFontOfSize:12];
        CGSize size = CGSizeMake(kAppScreenWidth - 25 - _nickNameLabel.frame.origin.x,2000);//设置一个上限
        CGSize labelsize = [content sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
        CGRect contentFrame = _contentLabel.frame;
        contentFrame.size.height = labelsize.height;
        _contentLabel.text = content;
        _contentLabel.frame = contentFrame;
    } else {
        _contentLabel.frame = CGRectMake(CGRectGetMaxX(_avatarImageView.frame) + 10, CGRectGetMaxY(_nickNameLabel.frame), kAppScreenWidth - 25 - _nickNameLabel.frame.origin.x, 5);
        _contentLabel.text = content;
    }
}

- (void)constraintShareViewFrame {
    _shareView.frame = CGRectMake(_contentLabel.frame.origin.x, CGRectGetMaxY(_contentLabel.frame)+5, _contentLabel.frame.size.width, 50);
}

- (void)constraintPlaceWithFrame:(CGRect)frame {
    if (_data.place.length > 0) {
        _placeLabel.frame = CGRectMake(CGRectGetMinX(_contentLabel.frame), CGRectGetMaxY(frame)+5, 100, 15);
        _placeLabel.text = _data.place;
    } else {
        _placeLabel.frame = CGRectMake(CGRectGetMinX(_contentLabel.frame), CGRectGetMaxY(frame), 0, 0);
    }
}

- (void)constraintSomeFrame {
    _timeLabel.frame = CGRectMake(CGRectGetMinX(_contentLabel.frame), CGRectGetMaxY(_placeLabel.frame)+8, 200, 10);
    _commetButton.frame = CGRectMake(CGRectGetMaxX(_contentLabel.frame) - 25, CGRectGetMinY(_timeLabel.frame), 30, 20);
    _commentView.frame = CGRectMake(CGRectGetMinX(_contentLabel.frame), CGRectGetMaxY(_timeLabel.frame)+20, _contentLabel.frame.size.width, 0);
}

@end
