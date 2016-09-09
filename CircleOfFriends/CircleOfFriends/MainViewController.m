//
//  MainViewController.m
//  CircleOfFriends
//
//  Created by 左梓豪 on 16/8/17.
//  Copyright © 2016年 左梓豪. All rights reserved.
//

#import "MainViewController.h"
#import "HeaderView.h"
#import "ListTableView.h"
#import "VirtualData.h"
#import "ChatKeyBoard.h"
#import "FaceSourceManager.h"
#import "CommentData.h"
#import "CircleOfFriendsData.h"

@interface MainViewController ()<ChatKeyBoardDataSource, ChatKeyBoardDelegate>

@property(nonatomic, strong)ListTableView *mainTableView;

@property(nonatomic, strong)ChatKeyBoard *keyBoard;

@end

@implementation MainViewController {
    UITapGestureRecognizer *_tap;
    NSString               *_commentToUserID;
    NSArray                *_dataArray;
    NSInteger              _row;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"newComment" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hiddenKeyBoard) name:@"imageViewWillShow" object:nil];
    [self setNavigationBar];
    [self initTableView];
    [self initKeyBoard];
    [self getData];
}

- (void)initTableView {
    _mainTableView = [[ListTableView alloc] initWithFrame:CGRectMake(0, -60, kAppScreenWidth, self.view.frame.size.height + 60) style:UITableViewStylePlain];
    HeaderView *headerView = [[HeaderView alloc] initWithBackGroundImageUrlString:nil avatarUrlString:nil frame:CGRectMake(0, 0, kAppScreenWidth, kAppScreenHeight/2)];
    _mainTableView.tableHeaderView = headerView;
    [self.view addSubview:_mainTableView];
}

- (void)initKeyBoard {
    self.keyBoard = [ChatKeyBoard keyBoardWithParentViewBounds:self.view.frame];
    _keyBoard.keyBoardStyle = KeyBoardStyleComment;
    _keyBoard.dataSource = self;
    _keyBoard.delegate = self;
    _keyBoard.allowMore = NO;
    _keyBoard.allowVoice = NO;
    [self.view addSubview:self.keyBoard];
}

#pragma mark - Notification

- (void)receiveNotification:(NSNotification *)notification {
    
    [self.keyBoard keyboardUpforComment];
    if (_tap == nil) {
        _tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenKeyBoard)];
    }
    [self.mainTableView addGestureRecognizer:_tap];
    
    if (notification.object != nil) {
        
        NSDictionary *dic = notification.object;
         NSString *user = dic[@"name"];
        if (user.length > 0) {
            NSIndexPath *indexPath = dic[@"indexPath"];
            _row = indexPath.row;
            self.keyBoard.placeHolder = [NSString stringWithFormat:@"回复: %@",user];
            _commentToUserID = user;

        } else {
            NSNumber *row = dic[@"row"] ;
            _row = row.integerValue;
            self.keyBoard.placeHolder = @"评论";
            _commentToUserID = @"";
        }
        
    }
}


#pragma mark - KeyBoard About

- (void)hiddenKeyBoard {
    [self.keyBoard keyboardDownForComment];
    [self.mainTableView removeGestureRecognizer:_tap];
}

- (NSArray<ChatToolBarItem *> *)chatKeyBoardToolbarItems
{
    ChatToolBarItem *item1 = [ChatToolBarItem barItemWithKind:kBarItemFace normal:@"face" high:@"face_HL" select:@"keyboard"];
    return @[item1];
}

- (NSArray<MoreItem *> *)chatKeyBoardMorePanelItems {
    return nil;
}

- (NSArray<FaceThemeModel *> *)chatKeyBoardFacePanelSubjectItems {
    return [FaceSourceManager loadFaceSource];
}

- (void)chatKeyBoardSendText:(NSString *)text {
    NSLog(@"发送评论");
    
    CommentData *newComment = [[CommentData alloc] init];
    newComment.commentFromUserID = @"南小鸟";
    newComment.commentContent = text;
    if (_commentToUserID.length > 0) {
        newComment.commentToUserID = _commentToUserID;
    }
    
    CircleOfFriendsData *data = _dataArray[_row];
    NSArray *commentArray = data.commentArray;
    
    NSMutableArray *new = [[NSMutableArray alloc] initWithArray:commentArray];
    [new addObject: newComment];
    NSArray *newCommentArray = [new copy];
   
    commentArray = newCommentArray;
    data.commentArray = commentArray;
    
    [self.mainTableView reloadData];
    
    [self.keyBoard keyboardDownForComment];
    
}

- (void)getData {
    _dataArray = [VirtualData getVirtualData];
    _mainTableView.dataArray = _dataArray;
}

- (void)setNavigationBar {
    self.navigationController.navigationBar.barTintColor = RGB(45, 45, 45);
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.title = @"朋友圈";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
